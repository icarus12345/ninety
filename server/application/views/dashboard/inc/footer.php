<footer class="footer">
    <div class="container">
    Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?>
    </div>
</footer>
<iframe id="integration_asynchronous" name="integration_asynchronous" style="width: 0;height: 0;border: 0;position: absolute"></iframe>
<script type="text/javascript">
if($('#navigation a[href^="<?php echo base_url(uri_string()); ?>"]').length==1)
    $('#navigation a[href^="<?php echo base_url(uri_string()); ?>"]').parents('li').addClass('active open');
</script>