<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Panel extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('form_builder');
		$this->load->model('user_model', 'users');
		$this->load->model('admin_user_model', 'admin');
		$this->load->library('form_validation');
		$this->load->helper('url');
    }

    // Admin Users CRUD
	public function admin_user() {
		
		$this->load->library('form_validation');
        $this->mPageTitle = 'Admin Users';
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->mViewData['data_cat'] = $this->admin->get_all_admin();

		$this->render('admins/v_admin');
		
    }
	
	public function admin_user_create() {
		$this->form_validation->set_rules('email', 'E-mail', 'trim|required|valid_email');
		$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|is_unique[users.username]');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[5]|matches[password_re]');
		$this->form_validation->set_rules('password_re', 'Retype Password', 'trim|required');
		
		if($this->form_validation->run() == FALSE){
			
		}else{
			$username = $this->input->post('username',true);
            $email = $this->input->post('email',true);
            $password = $this->input->post('password',true);
            $additional_data = array(
                'first_name' => $this->input->post('first_name',true),
                'last_name' => $this->input->post('last_name',true),
            );
            $groups = $this->input->post('groups',true);
			
			$cotton = $this->input->post("cotton",true);
			
			//echo "test.jpg";
            // create user (default group as "members")
            $user = $this->ion_auth->register($username, $password, $email, $additional_data, $groups);
            if ($user) {
                // success
                $messages = $this->ion_auth->messages();
                $this->system_message->set_success($messages);
				
				$field_name = "img";
				$path = "./assets/uploads/users/";
				$allowed_types = "png|jpg|jpeg|gif";
				$img_name = $this->upload_file($field_name, $path, $allowed_types);
				if(!empty($img_name)){
					$this->admin->updates_user_array(array("img" => $img_name),array("id"=>$user));
				}
			
				if(!empty($cotton)){
					foreach($cotton as $row){
						$this->admin->inserts_usergroup_module_array(array("user_id"=>$user,"group_id"=>$row));
					}
				}
				
				redirect($this->mModule.'/panel/admin_user');
            } else {
                // failed
                $errors = $this->ion_auth->errors();
                $this->system_message->set_error($errors);
				$this->mViewData['errors'] = $errors;
            }
		
		}
		
		$form = $this->form_builder->create_form();
        $groups = $this->ion_auth->groups()->result();
        unset($groups[0]); // disable creation of "webmaster" account
        $this->mViewData['groups'] = $groups;
        $this->mViewData['cotton'] = $this->admin->get_all_cotton();
        $this->mPageTitle = 'Create Admin User';
		
        $this->mViewData['form'] = $form;
        $this->render('admins/v_admin_create');
	}
	
	
	public function admin_user_edit($user_id=null) {
		
		
		//$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|max_length[12]|is_unique[users.username]');
		$this->form_validation->set_rules('email', 'E-mail', 'trim|required|valid_email');
		//$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|is_unique[users.username]');
		
		if($this->form_validation->run() == FALSE){
			
		}else{
			
			$groups = $this->input->post('groups',true);
			
			$cotton = $this->input->post("cotton",true);
			
			$user_id = $this->input->post("user_id",true);
			
			
			$email = $this->input->post("email",true);
			$first_name = $this->input->post("first_name",true);
			$last_name = $this->input->post("last_name",true);
			
			$data_user = array(
								"email"=> $email,
								"first_name"=> $first_name,
								"last_name"=> $last_name,
							);
			
			$this->admin->updates_user_array($data_user,array("id"=>$user_id));
			
			
			$field_name = "img";
			$path = "./assets/uploads/users/";
			$allowed_types = "png|jpg|jpeg|gif";
			$img_name = $this->upload_file($field_name, $path, $allowed_types);
			if(!empty($img_name)){
				$this->admin->updates_user_array(array("img" => $img_name),array("id"=>$user_id));
			}
			
			
			$this->admin->deletes_usergroup_module($user_id);
			
			if(!empty($cotton)){
				foreach($cotton as $row){
					$this->admin->inserts_usergroup_module_array(array("user_id"=>$user_id,"group_id"=>$row));
				}
			}
			
			$this->admin->deletes_usergroup($user_id);
			
			if(!empty($groups)){
				foreach($groups as $row){
					$this->admin->inserts_usergroup_array(array("user_id"=>$user_id,"group_id"=>$row));
				}
			}
			
			redirect($this->mModule.'/panel/admin_user');
		}
		
		
		
		$user_data_group = $this->admin->get_group_by_key($user_id);
		$group_edit[] = 0;
		foreach($user_data_group as $row){
			$group_edit[] = $row->group_id;
		}
		
		$user_data_cotton = $this->admin->get_cotton_by_key($user_id);
		
		$cotton_edit[] = 0;
		foreach($user_data_cotton as $row){
			$cotton_edit[] = $row->group_id;
		}
		
		
		$form = $this->form_builder->create_form();
        $groups = $this->ion_auth->groups()->result();
        unset($groups[0]); // disable creation of "webmaster" account
        $this->mViewData['groups'] = $groups;
        $this->mViewData['cotton'] = $this->admin->get_all_cotton();
		
		
        $this->mViewData['group_edit'] = $group_edit;
        $this->mViewData['cotton_edit'] = $cotton_edit;
        $this->mViewData['user_id'] = $user_id;
		
		$this->mViewData['user_data_edit'] = $this->admin->get_by_key($user_id);
		
		
        $this->mPageTitle = 'Edit Admin User';
		
        $this->mViewData['form'] = $form;
        $this->render('admins/v_admin_edit');
	}
	
	 public function admin_user_close($user_id=null){
		$user = $this->admin->get_by_key($user_id);
		
		if($user[0]->active){
			$this->admin->updates_user_array(array("active" => 0),array("id"=>$user_id));
		}else{
			$this->admin->updates_user_array(array("active" => 1),array("id"=>$user_id));
		}
		
		redirect($this->mModule.'/panel/admin_user');
	 }

    // Create Admin User
	/*
    public function admin_user_create() {
        // (optional) only top-level admin user groups can create Admin User
        //$this->verify_auth(array('webmaster'));

        $form = $this->form_builder->create_form();

        if ($form->validate()) {
            // passed validation
            $username = $this->input->post('username');
            $email = $this->input->post('email');
            $password = $this->input->post('password');
            $additional_data = array(
                'first_name' => $this->input->post('first_name'),
                'last_name' => $this->input->post('last_name'),
            );
            $groups = $this->input->post('groups');

            // create user (default group as "members")
            $user = $this->ion_auth->register($username, $password, $email, $additional_data, $groups);
            if ($user) {
                // success
                $messages = $this->ion_auth->messages();
                $this->system_message->set_success($messages);
            } else {
                // failed
                $errors = $this->ion_auth->errors();
                $this->system_message->set_error($errors);
            }
            refresh();
        }

        $groups = $this->ion_auth->groups()->result();
        unset($groups[0]); // disable creation of "webmaster" account
        $this->mViewData['groups'] = $groups;
        $this->mPageTitle = 'Create Admin User';

        $this->mViewData['form'] = $form;
        $this->render('panel/admin_user_create');
    }*/

    // Admin User Groups CRUD
    public function admin_user_group() {
        $crud = $this->generate_crud('admin_groups');
        $this->mPageTitle = 'Admin User Groups';
        $this->render_crud();
    }

    // Admin User Reset password
    public function admin_user_reset_password($user_id) {
        // only top-level users can reset Admin User passwords
        $this->verify_auth(array('webmaster'));

        $form = $this->form_builder->create_form();
        if ($form->validate()) {
            // pass validation
            $data = array('password' => $this->input->post('new_password'));
            if ($this->ion_auth->update($user_id, $data)) {
                $messages = $this->ion_auth->messages();
                $this->system_message->set_success($messages);
            } else {
                $errors = $this->ion_auth->errors();
                $this->system_message->set_error($errors);
            }
            refresh();
        }

        $this->load->model('admin_user_model', 'admin_users');
        $target = $this->admin_users->get($user_id);
        $this->mViewData['target'] = $target;

        $this->mViewData['form'] = $form;
        $this->mPageTitle = 'Reset Admin User Password';
        $this->render('panel/admin_user_reset_password');
    }

    // Account Settings
    public function account() {
        // Update Info form
        $form1 = $this->form_builder->create_form($this->mModule . '/panel/account_update_info');
        $form1->set_rule_group('panel/account_update_info');
        $this->mViewData['form1'] = $form1;

        // Change Password form
        $form2 = $this->form_builder->create_form($this->mModule . '/panel/account_change_password');
        $form1->set_rule_group('panel/account_change_password');
        $this->mViewData['form2'] = $form2;

        $this->mPageTitle = "Account Settings";
        $this->render('panel/account');
    }

    // Submission of Update Info form
    public function account_update_info() {
        $data = $this->input->post();
        if ($this->ion_auth->update($this->mUser->id, $data)) {
            $messages = $this->ion_auth->messages();
            $this->system_message->set_success($messages);
        } else {
            $errors = $this->ion_auth->errors();
            $this->system_message->set_error($errors);
        }

        redirect($this->mModule . '/panel/account');
    }

    // Submission of Change Password form
    public function account_change_password() {
        $data = array('password' => $this->input->post('new_password'));
        if ($this->ion_auth->update($this->mUser->id, $data)) {
            $messages = $this->ion_auth->messages();
            $this->system_message->set_success($messages);
        } else {
            $errors = $this->ion_auth->errors();
            $this->system_message->set_error($errors);
        }

        redirect($this->mModule . '/panel/account');
    }

    /**
     * Logout user
     */
    public function logout() {
        $this->ion_auth->logout();
        redirect($this->mConfig['login_url']);
    }

}
