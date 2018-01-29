<div class="row">
    <div class="col-md-10">
        <?php
        $attributes = array('class' => 'form-horizontal');
        echo modules::run('adminlte/widget/box_content_open', $style = 'primary', FALSE);
        echo form_open('', $attributes);
        ?>
        <table class="table table-bordered table-autosort">
            <thead>
                <tr>
                    <th>ลำดับที่</th>
                    <th>รหัสเครื่องมือ/อุปกรณ์</th>
                    <th>ชื่อเครื่องมือ/อุปกรณ์</th>
                    <th>รายละเอียดเครื่องมือ/อุปกรณ์</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($result as $key => $value) { ?>
                    <tr>
                        <td class="text-center" style="width: 50px;"><?php echo $key + 1; ?></td>
                        <td><?php echo $value->equipment_code; ?></td>
                        <td><?php echo $value->equipment_title; ?></td>
                        <td><?php echo $value->equipment_detail; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
        <?php
        echo form_close();
        echo modules::run('adminlte/widget/box_content_close');
        ?>
    </div>
</div>