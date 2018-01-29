<div id='header'>
    <div class="swagger-ui-wrap">
        <a id="logo" href=""><?php echo $site_name; ?></a>
    </div>
</div>
<script>
    var key_row = 0;
</script>
<link rel="stylesheet" href="<?PHP echo base_url(); ?>/assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<?PHP echo base_url(); ?>/assets/css/datatables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<?PHP
$attributes = array('class' => 'form-horizontal', "role" => "form");
echo form_open("installs/create_tables", $attributes);
?>
<div id="message-bar" class="swagger-ui-wrap" data-sw-translate>&nbsp;</div>
<div id="swagger-ui-container" class="swagger-ui-wrap"></div>
<div class="col-md-12">
    Table Code : <input type="text" name="tablecodename">
    Table Name : <input type="text" name="tablename">
    Icon Menu : <input type="text" name="icon_menu" value="fa-cube">
    Column : <input type="number" name="columns" id="columns">
    <input type="button" id="addcolumns" value="Add">
    <table id="table_columns" class="table table-striped table-bordered dataTable no-footer">
        <th>ชื่อฟิว</th>
        <th>ประเภทฟิว</th>
        <th>ขนาดฟิว</th>
        <th>ค่าเริ่มต้น</th> 
        <th>ดัชนี</th>
        <th>auto number</th>
        <th>type input</th>
        <th>col</th>
        <tbody id="contentfile"> 

        </tbody>
        <input type="submit" value="submit">
    </table>
</div>

<div class="col-md-2">
    <div><i class="fa fa-cube" aria-hidden="true"> fa-cube</i></div>
    <div><i class="fa fa-cubes" aria-hidden="true"> fa-cubes</i></div>
    <div><i class="fa fa-file-image-o" aria-hidden="true"> fa-file-image-o</i></div>
    <div><i class="fa fa-file-video-o" aria-hidden="true"> fa-file-video-o</i></div>
    <div><i class="fa fa-file-pdf-o" aria-hidden="true"> fa-file-pdf-o</i></div>
    <div><i class="fa fa-picture-o" aria-hidden="true">fa-picture-o</i></div>
    <div><i class="fa fa-info" aria-hidden="true"> fa-info</i></div>
</div>

<div class="col-md-2">
    <div><i class="fa fa-pencil-square-o" aria-hidden="true"> fa-pencil-square-o</i></div>
    <div><i class="fa fa-eye" aria-hidden="true"> fa-eye</i></div>
    <div><i class="fa fa-folder-open-o" aria-hidden="true"> fa-folder-open-o</i></div>
    <div><i class="fa fa-folder-o" aria-hidden="true"> fa-folder-o</i></div>
    <div><i class="fa fa-pencil" aria-hidden="true"> fa-pencil</i></div>
    <div><i class="fa fa-question" aria-hidden="true"> fa-question</i></div>
    <div><i class="fa fa-tag" aria-hidden="true"> fa-tag</i></div>
</div>

<div class="col-md-2">
    <div><i class="fa fa-phone" aria-hidden="true"> fa-phone</i></div>
    <div><i class="fa fa-suitcase" aria-hidden="true"> fa-suitcase</i></div>
    <div><i class="fa fa-user" aria-hidden="true"> fa-user</i></div>
    <div><i class="fa fa-users" aria-hidden="true"> fa-users</i></div>
    <div><i class="fa fa-user-secret" aria-hidden="true"> fa-user-secret</i></div>
    <div><i class="fa fa-shopping-cart" aria-hidden="true"> fa-shopping-cart</i></div>
    <div><i class="fa fa-print" aria-hidden="true"> fa-print</i></div>
</div>

<div class="col-md-2">
    <div><i class="fa fa-video-camera" aria-hidden="true"> fa-video-camera</i></div>
    <div><i class="fa fa-upload" aria-hidden="true"> fa-upload</i></div>
    <div><i class="fa fa-truck" aria-hidden="true"> fa-truck</i></div>
    <div><i class="fa fa-file-excel-o" aria-hidden="true"> fa-file-excel-o</i></div>
    <div><i class="fa fa-cog" aria-hidden="true"> fa-cog</i></div>
    <div><i class="fa fa-tachometer" aria-hidden="true"> fa-tachometer</i></div>
    <div><i class="fa fa-shopping-basket" aria-hidden="true"> fa-shopping-basket</i></div>
</div>

<div class="col-md-2">
    <div><i class="fa fa-spinner" aria-hidden="true"> fa-spinner</i></div>
    <div><i class="fa fa-credit-card" aria-hidden="true"> fa-credit-card</i></div>
    <div><i class="fa fa-area-chart" aria-hidden="true"> fa-area-chart</i></div>
    <div><i class="fa fa-bar-chart" aria-hidden="true"> fa-bar-chart</i></div>
    <div><i class="fa fa-pie-chart" aria-hidden="true"> fa-pie-chart</i></div>
    <div><i class="fa fa-commenting-o" aria-hidden="true"> fa-commenting-o</i></div>
    <div> <i class="fa fa-bell-o" aria-hidden="true"> fa-bell-o</i></div>
</div>

<div class="col-md-2">
    <div> <i class="fa fa-money" aria-hidden="true"> fa-money</i></div>
    <div><i class="fa fa-file-text-o" aria-hidden="true"> fa-file-text-o</i></div>
    <div><i class="fa fa-university" aria-hidden="true"> fa-university</i></div>
    <div><i class="fa fa-camera" aria-hidden="true"> fa-camera</i></div>
    <div><i class="fa fa-cogs" aria-hidden="true"> fa-cogs</i></div>
    <div><i class="fa fa-car" aria-hidden="true"> fa-car</i></div>
    <div><i class="fa fa-smile-o" aria-hidden="true"> fa-smile-o</i></div>
</div>












<script>
    $("#addcolumns").click(function () {
        var html = "";

        var loops = key_row + +$("#columns").val();
        
        for (key_row; key_row < loops; key_row++) {
            html += '<tr>';
            html += '<td class="center"><input type="text" name="field_name[' + key_row + ']" maxlength="64" class="textfield" title="Column" size="10" value=""></td>';
            html += '<td class="center"><select class="column_type" name="field_type[' + key_row + ']" id="field_' + key_row + '_2"><option >INT</option><option >VARCHAR</option><option >TEXT</option>';
            html += '<option >DATE</option><optgroup label="Numeric"><option >TINYINT</option><option >SMALLINT</option><option >MEDIUMINT</option><option >INT</option>';
            html += '<option >BIGINT</option><option disabled="disabled">-</option><option >DECIMAL</option><option >FLOAT</option><option >DOUBLE</option><option >REAL</option>';
            html += '<option disabled="disabled">-</option><option >BIT</option><option >BOOLEAN</option><option >SERIAL</option></optgroup><optgroup label="Date and time"><option >DATE</option>';
            html += '<option >DATETIME</option><option >TIMESTAMP</option><option >TIME</option><option >YEAR</option></optgroup><optgroup label="String"><option >CHAR</option>';
            html += '<option >VARCHAR</option><option disabled="disabled">-</option><option >TINYTEXT</option><option >TEXT</option><option >MEDIUMTEXT</option><option >LONGTEXT</option>';
            html += '<option disabled="disabled">-</option><option >BINARY</option><option >VARBINARY</option><option disabled="disabled">-</option><option >TINYBLOB</option><option >MEDIUMBLOB</option>';
            html += '<option >BLOB</option><option >LONGBLOB</option><option disabled="disabled">-</option><option >ENUM</option><option >SET</option></optgroup></select></td>';
            html += '<td class="center"><input id="field_0_3" type="text" name="field_length[' + key_row + ']" size="8" value="" class="textfield"><p class="enum_notice" id="enum_notice_' + key_row + '_3"';
            html += 'style="display: none;"><a href="#" class="open_enum_editor">Edit ENUM/SET values</a></p></td>';
            html += '<td class="center"><select name="field_default_type[' + key_row + ']" id="field_' + key_row + '_4" class="default_type"><option value="NONE">None</option><option value="NULL">NULL</option>';
            html += '</select></td>';
            html += '<td class="center"><select name="field_key[' + key_row + ']" id="field_' + key_row + '_7" data-index=""><option value="none">---</option>';
            html += '<option value="primary" title="Primary">PRIMARY</option><option value="unique" title="Unique">UNIQUE</option>';
            html += '<option value="index" title="Index">INDEX</option><option value="fulltext" title="Fulltext">FULLTEXT</option>';
            html += '<option value="spatial" title="Spatial">SPATIAL</option></select></td>';
            html += '<td class="center"><input name="field_extra[' + key_row + ']" id="field_' + key_row + '_8" type="checkbox" value="AUTO_INCREMENT"></td>';
            html += '<td><select name="type_input[' + key_row + ']"><option value="text">text</option></select></td>';
            html += '<td class="center"><input type="text" name="col_css[' + key_row + ']" maxlength="12" class="textfield" title="Column" size="10" value="6"></td>';
            html += '</tr>';
        }


        $("#contentfile").append(html);

    });
</script>
<?php echo form_close(); ?>	


<!--<option value="select">select</option><option value="radio">radio</option><option value="checkbox">checkbox</option><option value="textarea">textarea</option><option value="file_img">file_img</option><option value="file_pdf">file_pdf</option><option value="texteditor">texteditor</option>-->



























