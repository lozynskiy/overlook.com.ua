<?php if ($comments) { ?>
    <?php foreach ($comments as $comment) { ?>
        <div class="comment blog-comment">
            <div class="comment-info">
                <div class="user-info">
                    <span class="username"><?php echo $comment['name']; ?></span>
                </div>
            </div>
            <div class="comment-content">
                <div class="comment-time">
                    <label>Created on:</label>
                    <span class="stat-value"><?php echo $comment['date_added']; ?></span>
                </div>
                <div class="comment-body">
                    <?php echo $comment['comment']; ?><br>
                </div>
            </div>
        </div>
    <?php } ?>
    <div class="pager">
        <?php echo $pagination; ?>
        <?php echo $results; ?>
    </div>
<?php } else { ?>
    <div class="comment blog-comment">
        <div class="comment-body"></div>
        <?php echo $text_no_comment; ?>
    </div>
<?php } ?>
