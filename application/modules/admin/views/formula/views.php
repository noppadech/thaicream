<style>
    table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td{
        vertical-align: middle;
    }
</style>
<?php
echo Modules::run('adminlte/Widget/box_open', '', $style = 'primary', $solid = FALSE);
?>
<div class="table-responsive"> 
    <table class="table table-bordered table-autosort-serverside">
        <thead>
            <tr>
                <th style="width: 50px;">No.</th>
                <th>ชื่อสินค้าภาษาไทย</th>
                <th>ชื่อสินค้าภาษาอังกฤษ</th>
                <th style="width: 100px;">สถานะ</th>
                <th style="width: 100px;">แก้ไขล่าสุด</th>
                <th style="width: 200px;">Action.</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<?php
echo Modules::run('adminlte/Widget/box_close');
?>
<script type="text/javascript">
    $(".table-autosort-serverside").DataTable({
        "pageLength": 10,
        "lengthMenu": [10, 20, 50, 100],
        "processing": true,
        "serverSide": true,
        ajax: {
            url: '<?php echo site_url('admin/formula/server_side'); ?>',
            type: 'GET'
        }
    });
</script>