<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// NOTE: this controller inherits from MY_Controller instead of Admin_Controller,
// since no authentication is required
class Login extends MY_Controller {

    /**
     * Login page and submission
     */
    public function index() {
        $this->load->library('form_builder');
        $form = $this->form_builder->create_form();
		$this->load->model('user_model', 'users');
		$this->load->model('admin_user_model', 'admin');

        if ($form->validate()) {
            // passed validation
            $identity = $this->input->post('username');
            $password = $this->input->post('password');
            $remember = ($this->input->post('remember') == 'on');
			
		//	$this->ion_auth->login($identity, $password, $remember);

            if ($this->ion_auth->login($identity, $password, $remember)) {
                // login succeed
				$group = $this->admin->get_group_by_key($this->session->userdata('user_id'));
				$cotton = $this->admin->get_cotton_by_key($this->session->userdata('user_id'));
				
				foreach($group as $row){
					$group_us[] = $row->group_id;
				}
				
				foreach($cotton as $row){
					$cotton_us[] = $row->group_id;
				}
				
				$this->session->set_userdata('group_us', $group_us);
				$this->session->set_userdata('cotton_us', $cotton_us);
				
                $messages = $this->ion_auth->messages();
                $this->system_message->set_success($messages);
                redirect($this->mModule);
            } else {
                // login failed
                $errors = $this->ion_auth->errors();
                $this->system_message->set_error($errors);
                refresh();
            }
        }

        // display form when no POST data, or validation failed
        $this->mViewData['form'] = $form;
        $this->mBodyClass = 'login-page';
        $this->render('login', 'empty');
    }

}
