<style media="print">
    .img-responsive{
        max-width: 10%;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <?php
        $revise_check = count($result_revise);
        foreach ($result_revise as $key => $value) {
            echo "ครั้งที่ ";
            echo $revise_check--;
            echo " : ";
            echo $value->order_brand_revise_date;
            echo " : ";
            echo $value->order_brand_revise;
            echo "<br/>";
        }
        ?>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th rowspan="2" class="text-center" style="vertical-align: middle;">No.</th>
                    <th rowspan="2" class="text-center" style="vertical-align: middle;">ต้นแบบที่</th>
                    <th rowspan="2" class="text-center" style="vertical-align: middle;">รายละเอียดสินค้า</th>
                    <th class="text-center" style="vertical-align: middle;">จำนวนสั่ง</th>
                    <th colspan="2" class="text-center" style="vertical-align: middle;">ขนาดบรรจุ</th>
                    <th class="text-center" style="vertical-align: middle;">ประเภทของบรรจุภัณฑ์</th> 
                    <th class="text-center" style="vertical-align: middle;">ประเภทของสติ๊กเกอร์</th> 
                </tr>
                <tr>
                    <!--<th>No.</th>-->
                    <!--<th>ต้นแบบที่</th>-->
                    <!--<th>รายละเอียดสินค้า</th>-->
                    <th style="width: 10%;" class="text-center">โล</th>
                    <th style="width: 10%;" class="text-center">package</th>
                    <th style="width: 10%;" class="text-center">บรรจุได้</th>
                    <th style="width: 15%;" class="text-center">type of package</th> 
                    <th style="width: 15%;" class="text-center">type of sticker</th> 
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($result_details as $key => $value) {
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $key + 1; ?></td>
                        <td><?php echo $value->order_brand_detail_master ?></td>
                        <td><?php echo $value->order_brand_detail_master_details ?></td>
                        <td class="text-center"><?php echo $value->order_brand_detail_qty ?></td>
                        <td class="text-center"><?php echo $value->order_brand_detail_package ?></td>
                        <td class="text-center"><?php echo $value->order_brand_detail_real_qty ?></td>
                        <td class="text-center"><?php echo $value->order_brand_detail_type_of_package ?></td>
                        <td class="text-center"><?php echo $value->order_brand_detail_type_of_sticker ?></td>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-xs-6">
        ชื่อแบรนด์ภาษาไทย : <?php echo $result->order_brand_brand_th; ?><br/>
        ชื่อแบรนด์อังกฤษ : <?php echo $result->order_brand_brand_en; ?><br/>
        รายละเอียด<br/>
        <?php echo $result->order_brand_brand_details; ?>
        รูปที่เกี่ยวข้อง<br/>
    </div>
    <div class="col-xs-6">
        <?php
        $comment_check = count($result_comment);
        foreach ($result_comment as $key => $value) {
            echo "ครั้งที่ ";
            echo $comment_check--;
            echo " : ";
            echo $value->order_brand_comment_date;
            echo " : ";
            echo $value->order_brand_comment;
            echo "<br/>";
        }
        ?>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="row">
            <?php
            foreach ($result_img as $key => $value) {
                if ($value->order_brand_img_name != "<p>You did not select a file to upload.</p>") {
                    ?>
            <label class="text-center" for="check_img_<?php echo $key; ?>" style="width: 16%;" >
                        <img class="img-responsive" src="<?php echo site_url('uploads/' . $value->order_brand_img_name); ?>" />
                    </label>
                    <?php
                }
            }
            ?>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <label>เงื่อนไขการผลิต</label>
        <ul style="list-style: decimal;">
            <li>
                เมื่อลูกค้าชำระเงินมัดจำ ผื่อสั่งผลิตสินค้า จะต้องทำการส่งเอกสารในการดำเนินการขอใบรับจดแจ้งต่อ อย. ให้ทางบริษัท ภายใน 90 วัน
                นับจากวันที่วางเงินมัดจำ หายภายในระยะเวลาที่กำหนดทางบริษทไม่ได้รับเอกสาร หรือเอกสารยังไม่ครบ
                เป็นเหตุให้ทางบริษัทไม่สามารถดำเนินการใดๆ ต่อได้ ทางบริษัทขอสงวนสิทธิ์ในการรับเงินมัดจำ และยกเลิกใบสั่งผลิต
                โดยไม่ต้องชี้แจงเป็นลายลักษณ์อักษรให้ลูกค้าทราบ พร้องทั้งไม่ต้องส่งมอบสินค้าหรือส่วนใดคืนให้กับลูกค้า
            </li>
            <li>
                หลังจากลูกค้าจำระเงินมัดจำ ทางบริษัทของสงวนสิทธิ์ในการเปลี่ยนแปลง เช่น ภาชนะ และ รายการสินค้า
            </li>
            <li>
                เมื่อสินค้าผลิตเสร็จแล้ว ทางบริษัทจะแจ้งให้ท่านทราบ เพื่อให้ชำระเงินส่วนที่เหลือสำหรับการส่งมอบสินค้า หากท่านไม่จ่ายชำระเงินภายใน 60 วัน
                นับจากวันที่แจ้งสินค้าพร้อมส่ง ทางบริษัทขอสงวนสิทธิ์ในการริบเงินมัดจำ พร้อมทำลายสินค้า และแจ้งยกเลิกใบรับจดแจ้งต่อคณะกรรมการอาหารและยา โดยไม่ต้องชี้แจงเป็นลายลักษณ์อักษร
            </li>
            <li>
                หลังจากที่ท่านได้รับสินค้าในการสั่งผลิตครั้งแรกแล้ว หากท่านไม่มีการสั่งซื้อซ้ำภายใน 1 ปี
                ทางบริษัทขอสวนสิทธิ์ในการรายงานต่อคณะกรรมการอาหารและยา และเข้าสู่การดำเนินการเพิกถอนใบรับจดแจ้งต่อคณะกรรมการอาหารและยา
            </li>
            <li>
                ภาชนะที่ลูกค้านำมาเอง หรือ การเลือกภาชนะที่ไม่ควรใช้ โดยก่อนการสั่งผลิตทางบริษัทได้ทำการแจ้งให้ท่านทราบเสมอว่าภาชนะดังกล่าวไม่ควรใช้
                หากเกิดความเสียหายทางบริษัทขอปฏิเสธการรับผิดชอบในทุกกรณี
            </li>
        </ul>
    </div>
</div>