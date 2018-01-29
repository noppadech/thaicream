<div class="row">

    <div class="col-md-12">
        <?php
        echo Modules::run('adminlte/Widget/box_content_open', '', 'primary', FALSE);
        ?>
        <table class="table table-bordered table-autosort">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ชื่อการค้า</th>
                    <th>ชื่อสินค้าจด อย.แจ้งภาษาไทย</th>
                    <th>ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ</th>
                    <th>เลขที่จดแจ้ง</th>
                    <th>ประเภทผลิตภัณฑ์</th>
                    <th>ลักษณะประเภทผลิตภัณฑ์</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?PHP foreach ($result as $key => $value) { ?>
                    <tr>
                        <td style="vertical-align: middle;" class="text-center"><?php echo $key + 1; ?></td>
                        <td style="vertical-align: middle;">
                            <?PHP // dd($value);?>
                            <?PHP echo $value->trading_name; ?>
                        </td>
                        <td style="vertical-align: middle;"><?PHP echo $value->fda_name_th; ?></td>
                        <td style="vertical-align: middle;"><?PHP echo $value->fda_name_en; ?></td>
                        <td style="vertical-align: middle;"><?PHP echo $value->registered_number; ?></td>
                        <td style="vertical-align: middle;"><?PHP echo $value->product_category; ?></td>
                        <td style="vertical-align: middle;"><?PHP echo $value->product_type; ?></td>
                        <td style="vertical-align: middle;" class="text-center">
                            <a href="<?php echo site_url('fdadocuments/bpr/report/' . $value->bpr_id) ?>" class="fa fa-print"></a>
                            <!--<a href="#" class="fa fa-edit" data-toggle="modal" data-target="#modal-edit-<?php echo $value->bpr_id; ?>"></a>-->
                            <a href="<?php echo site_url('fdadocuments/bpr/edit/'.$value->bpr_id); ?>" class="fa fa-edit"></a>
                            <a href="<?php echo site_url('fdadocuments/bpr/delete/' . $value->bpr_id) ?>" onclick="return confirm('ต้องการลบข้อมูลหรือไม่')" class="fa fa-trash"></a>
                            <?php echo form_open(site_url('fdadocuments/bpr/edit/' . $value->bpr_id)); ?>
<!--                            <div class="modal fade" id="modal-edit-<?php echo $value->bpr_id; ?>" style="display: none;">
                                <div class="modal-dialog" style="text-align: -webkit-auto;">
                                    <div class="modal-content modal-lg">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title">Edit Modal</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="trading_name">ชื่อการค้า</label>  
                                                    <div class="col-md-8">
                                                        <input id="trading_name" type="text" name="trading_name" value="<?PHP echo $value->trading_name; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="fda_name_th">ชื่อสินค้าจด อย.แจ้งภาษาไทย</label>  
                                                    <div class="col-md-8">
                                                        <input id="fda_name_th" type="text" name="fda_name_th" value="<?PHP echo $value->fda_name_th; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="fda_name_en">ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ</label>  
                                                    <div class="col-md-8">
                                                        <input id="fda_name_en" type="text" name="fda_name_en" value="<?PHP echo $value->fda_name_en; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="registered_number">เลขที่จดแจ้ง</label>  
                                                    <div class="col-md-8">
                                                        <input id="registered_number" type="text" name="registered_number" value="<?PHP echo $value->registered_number; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="product_category">ประเภทผลิตภัณฑ์</label>  
                                                    <div class="col-md-8">
                                                        <input id="product_category" type="text" name="product_category" value="<?PHP echo $value->product_category; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="product_type">ลักษณะประเภทผลิตภัณฑ์</label>  
                                                    <div class="col-md-8">
                                                        <input id="product_type" type="text" name="product_type" value="<?PHP echo $value->product_type; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="mix_room">ห้องผสม</label>  
                                                    <div class="col-md-8">
                                                        <input id="mix_room" type="text" name="mix_room" value="<?PHP echo $value->mix_room; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="customer_name">ชื่อลูกค้า</label>  
                                                    <div class="col-md-8">
                                                        <input id="customer_name" type="text" name="customer_name" value="<?PHP echo $value->customer_name; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="production_date">วันที่ผลิต</label>  
                                                    <div class="col-md-8">
                                                        <input id="production_date" type="text" name="production_date" value="<?PHP echo $value->production_date; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="lot">Lot</label>  
                                                    <div class="col-md-8">
                                                        <input id="lot" type="text" name="lot" value="<?PHP echo $value->lot; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="machine">เครื่อง</label>  
                                                    <div class="col-md-8">
                                                        <input id="machine" type="text" name="machine" value="<?PHP echo $value->machine; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="pot">หม้อที่</label>  
                                                    <div class="col-md-8">
                                                        <input id="pot" type="text" name="pot" value="<?PHP echo $value->pot; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="quantity_kg">จำนวน/kg</label>  
                                                    <div class="col-md-8">
                                                        <input id="quantity_kg" type="text" name="quantity_kg" value="<?PHP echo $value->quantity_kg; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="total_weight">น้ำหนักรวม(Kg)</label>  
                                                    <div class="col-md-8">
                                                        <input id="total_weight" type="text" name="total_weight" value="<?PHP echo $value->total_weight; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="tank_weight">น้ำหนักถัง(Kg)</label>  
                                                    <div class="col-md-8">
                                                        <input id="tank_weight" type="text" name="tank_weight" value="<?PHP echo $value->tank_weight; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="net_weight">น้ำหนักสุทธิ(Kg)</label>  
                                                    <div class="col-md-8">
                                                        <input id="net_weight" type="text" name="net_weight" value="<?PHP echo $value->net_weight; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="percentage">ผลผลิตที่ผสมได้คิดเป็นร้อยละ</label>  
                                                    <div class="col-md-8">
                                                        <input id="percentage" type="text" name="percentage" value="<?PHP echo $value->percentage; ?>" class="form-control input-md">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label" for="mix_process">ขั้นตอนการผสม</label>  
                                                    <div class="col-md-12">
                                                        <textarea name="mix_process" id="mix_process_<?php echo $value->bpr_id; ?>" rows="10" cols="80">
                                                            <?PHP echo $value->mix_process; ?>
                                                        </textarea>
                                                        <script type="text/javascript">
                                                            <?PHP // $this->load->helper('editor'); ?>
                                                            <?PHP // echo ckeditor_render('mix_process', $value->bpr_id, 650, 300, 'custom') ?>
                                                        </script>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12 control-label" for="percentage">ข้อแนะนำ/ข้อควรระวัง</label>  
                                                    <div class="col-md-12">
                                                        <textarea name="guideline" id="guideline_<?php echo $value->bpr_id; ?>" rows="10" cols="80">
                                                            <?PHP echo $value->guideline; ?>
                                                        </textarea>
                                                        <script type="text/javascript">
                                                            <?PHP // $this->load->helper('editor'); ?>
                                                            <?PHP // echo ckeditor_render('guideline', $value->bpr_id, 650, 300, 'custom') ?>
                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                     /.modal-content 
                                </div>
                                 /.modal-dialog 
                            </div>-->
                            <?php echo form_close(); ?>
                        </td>
                    </tr>
                <?PHP } ?>
            </tbody>
        </table>
        <?php
        echo Modules::run('adminlte/Widget/box_content_close');
        ?>
    </div>
</div>