<center>
    <h2>ใบเสนอราคา และสั่งผลิต (TG/SO)</h2>
</center>
<div class="row">
    <div class="col-xs-9">ลำดับที่
    </div>
    <div class="col-xs-1">วันที่</div>
    <div class="col-xs-2"><?php echo date('m/y H:i:s', strtotime($result->create_date)); ?></div>
</div> 
<div class="row">
    <div class="col-xs-10">
        <b>รหัสพนักงาน</b>
        <?php echo $result->order_kg_emp_id; ?>
        &nbsp;|&nbsp;
        <?php echo $result->order_kg_inv_id; ?>
    </div>
    <div class="col-xs-2">
        <b>FM-MK-01</b>
    </div>
</div>
<div class="row">
    <div class="col-xs-6">
        <b>ข้อมูลผู้สั่ง</b><br/>
        <?php echo Modules::run('sale/invoice_kg/get_customer_id', $result->order_kg_customer_id) ?><br/>
        <?php echo $result->order_kg_customer_address ?><br/>
        <?php echo $result->order_kg_customer_tax_id_number ?><br/>
    </div>
    <div class="col-xs-6">
        <b>สถานที่จัดส่งสินค้า</b><br/>
        <?php echo $result->order_kg_customer_order_name ?><br/>
        <?php echo $result->order_kg_customer_order_address ?><br/>
        <?php echo $result->order_kg_customer_order_telephone ?><br/>
    </div>
</div>
<div class="row">
    <div class="col-xs-4">
        <b>ข้อมูลการชำระเงิน</b><br/>
        <?php echo $result->order_kg_payment_type; ?><br/>
        <?php echo $result->order_kg_payment_tax ?><br/>
        <?php echo $result->order_kg_payment_details ?><br/>
    </div>
    <div class="col-xs-6">
        <b>ข้อมูลออนไลน์</b><br/>
        <div class="col-xs-6">

            ชื่ออีเมล์ลูกค้า : <?php echo $result->order_kg_email_info ?><br/>
            ชื่อเฟสลูกค้า : <?php echo $result->order_kg_facebook_info ?>
        </div>
        <div class="col-xs-6">
            ชื่อ Line ลูกค้า : <?php echo $result->order_kg_line_info ?><br/>
            วิธีการสั่งสินค้า : <?php echo $result->order_kg_order_info ?>
        </div>
    </div>
    <div class="col-xs-2">
        <b>ระบบการจัดส่ง</b><br/>
        <?php echo $result->order_kg_sent_type; ?><br/>
        <?php // echo $result->order_kg_customer_order_address     ?><br/>
        <?php // echo $result->order_kg_customer_order_telephone     ?><br/>
    </div>
</div> 
<br/>
<table border="1" class="table">
    <thead style="border-bottom: 3px solid #000;">
        <tr>
            <th style="width:50px;">No.</th>
            <th colspan="5">Description</th>
            <th style="width: 100px;">Quantity</th>
            <th style="width: 100px;">Unit</th>
            <th style="width: 100px;">Unit Price</th>
            <th style="width: 100px;">Amount</th>
        </tr>
    </thead>
    <tbody> 
        <?php
//        dd($result);
//        dd($result_details);
//        echo count($result_details);
        $summary = 0;
        foreach ($result_details as $key => $value) {
            ?>
            <tr>
                <td class="text-center"><?php echo $key + 1; ?></td>
                <td colspan="5">
                    <?PHP
                    echo $value->product_description;
                    ?>
                </td>
                <td class='text-center'><?php echo $value->product_qty; ?></td>
                <td class='text-center'><?php echo $value->product_unit; ?></td>
                <td class='text-right'><?php echo number_format($value->product_unit_price, 2); ?></td>
                <td class='text-right'><?php echo number_format($value->product_amount, 2); ?></td>
            </tr>
            <?php
            $summary += $value->product_amount;
        }
        for ($i = 0; $i < (10 - count($result_details)); $i++) {
            ?>
            <tr>
                <td>&nbsp;</td>
                <td colspan="5"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td>&nbsp;</td>
            <td colspan="5" style="background: #7d7b7b38">ค่าขนส่ง</td>
            <td class='text-center'><?php echo $result->order_kg_sent_qty; ?></td>
            <td class='text-center'><?php echo $result->order_kg_sent_unit; ?></td>
            <td class='text-right'><?php echo number_format($result->order_kg_sent_unit_price, 2); ?></td>
            <td class='text-right'><?php echo number_format($result->order_kg_sent_amount, 2); ?></td>
        </tr>
        <tr>
            <td colspan="6" style="border-top-width: 1px;border-top-color: #000;"></td>
            <td colspan="3" style="border-top-width: 1px;border-top-color: #000;">ราคาไม่รวมvat</td>
            <td class='text-right' style="border-top-width: 1px;border-top-color: #000;">
                <?php
                $summary += $result->order_kg_sent_amount;
                echo number_format($summary, 2);
                ?>

            </td>
        </tr>
        <tr>
            <td colspan="6"></td>
            <td colspan="3">ราคารวม (VAT)7%</td>
            <td class='text-right'>
                <?php
                echo number_format($result->order_kg_vat, 2);
                ?>
            </td>
        </tr>
        <tr>
            <td colspan="6"></td>
            <td colspan="3">จำนวนเงินรวม</td>
            <td class='text-right'>
                <?php echo number_format($result->order_kg_total, 2); ?>
            </td>
        </tr>
        <tr>
            <td colspan="6"></td>
            <td colspan="3">ตัดเงินมัดจำ</td>
            <td class='text-right'><?php echo number_format($result->order_kg_deposit, 2); ?></td>
        </tr>
        <tr>
            <td colspan="6"></td>
            <td colspan="3">คงเหลือชำระ</td>
            <td class='text-right'><?php echo number_format(($result->order_kg_total - $result->order_kg_deposit)); ?></td>
        </tr>
    </tfoot>
</table>
<b>*หมายเหตุ: บิลนี้ลูกค้าสั่งเพื่อไปใช้เอง สินค้างานกิโลหากนำไปแบ่งบรรจุต้องขออย.ใหม่ เพื่อความถูกต้องไม่สามารถใช้เลขใบรับจดแจ้งของโรงงานได้</b> 
<!--<div class='row'>
    <div class='col-md-12'>   
    </div>
</div>-->
<br/><br/>
<div class='row'>
    <div class='col-xs-6 text-center'>
        _________________________________
    </div>
    <div class='col-xs-6 text-center'>
        _________________________________
    </div>
</div>
<div class='row'>
    <div class='col-xs-6 text-center'>
        ผู้สั่งผลิต
    </div>
    <div class='col-xs-6 text-center'>
        ผู้รับผลิต
    </div>
</div>