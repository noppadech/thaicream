<span class="<?php echo $class; ?>" style="cursor: pointer; <?php echo $style; ?>;" data-toggle="modal" data-target="#<?php echo $target; ?>"></span>
<!-- Modal -->
<div class="modal fade <?php echo $dialog_style; ?>" id="<?php echo $target; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <?php echo form_open($url); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-left" id="myModalLabel"><?php echo $title_message; ?></h4>
            </div>
            <div class="modal-body text-left">
                <?php echo $message; ?>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline"><?PHP echo $btn_submit; ?></button>
                <button type="button" class="btn btn-outline" data-dismiss="modal">Close</button>
            </div>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>