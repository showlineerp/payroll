<footer class="main-footer">
    <div class="container-fluid">
        <p>&copy; <?php echo e($general_settings->site_title ?? "no title"); ?> || <?php echo e(__('Developed by')); ?>

            <a href=<?php echo e($general_settings->footer_link); ?> class="external"><?php echo e($general_settings->footer); ?></a> || Version - <?php echo e(env('VERSION')); ?>

    </div>
</footer>
<?php /**PATH C:\xampp\htdocs\payroll\resources\views/layout/main_partials/footer.blade.php ENDPATH**/ ?>