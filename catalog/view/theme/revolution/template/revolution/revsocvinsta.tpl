<div class="module-instagram" style="width:<?php echo $width; ?>px">
    <div class="main">
        <?php if (!$userInfo['user']['is_private']) { ?>
        <div class="images">
            <?php $i=0; ?>
            <?php foreach ($userInfo['user']['media']['nodes'] as $image) { ?>
            <?php $i++; if ($i==10) break; ?>
            <a href="https://www.instagram.com/p/<?= $image['code'] ?>/" target="_blank">
                <img src="<?= $image['thumbnail_src'] ?>" class="img-responsive" alt="" />
            </a>
            <?php } ?>
        </div>
        <?php } ?>
    </div>
</div>