<?php get_header();?>

<main>

    <!-- blog -->
        <?php get_template_part('templates/breadcrumbs'); ?>

    
    <div class="container blog-box">
        <!-- Content -->
        <div class="blog-box_content">
            <?php query_posts('cat=-12&paged='.$paged); ?>
            <?php if ( have_posts() ) : while ( have_posts() ) : the_post();?>
            <?php get_template_part('templates/post'); ?>
            <?php endwhile; ?>
            <?php else: ?>
            <?php endif; ?>

           <?php catalog_pagination(); ?>
        </div>
        
        <!-- Sidebar -->
        <div class="sidebar">
        <?php get_template_part('templates/search'); ?>
            <!-- <div class="search-box">
                <form action="#" method="post">
                    <input class="search-area" type="text" placeholder="Поиск">
                    <button type="submit"></button>
                </form>
            </div> -->

            <div class="sidebar_popular">
                <h3 class="main-title">Свежие записи</h3>
                <ul>
                    <li>
                        <div class="sidebar_popular__img">
                            <a href="#"><img src="img/test-img.jpg" alt=""></a>
                        </div>
                        <div class="sidebar_popular__title"> 
                            <a href="#">Название статьи</a><br>
                            <span>26 февраля, 2018</span>
                        </div>
                    </li>
                    <li>
                         <div class="sidebar_popular__img">
                            <a href="#"><img src="img/test-img.jpg" alt=""></a>
                        </div>
                        <div class="sidebar_popular__title"> 
                            <a href="#">Название статьи</a><br>
                            <span>26 февраля, 2018</span>
                        </div>
                    </li>
                    <li>
                        <div class="sidebar_popular__img">
                            <a href="#"><img src="img/test-img.jpg" alt=""></a>
                        </div>
                        <div class="sidebar_popular__title"> 
                            <a href="#">Название статьи</a><br>
                            <span>26 февраля, 2018</span>
                        </div>
                    </li>
                    <li>
                        <div class="sidebar_popular__img">
                            <a href="#"><img src="img/test-img.jpg" alt=""></a>
                        </div>
                        <div class="sidebar_popular__title"> 
                            <a href="#">Название статьи</a><br>
                            <span>26 февраля, 2018</span>
                        </div>
                    </li>
                    <li>
                        <div class="sidebar_popular__img">
                            <a href="#"><img src="img/test-img.jpg" alt=""></a>
                        </div>
                        <div class="sidebar_popular__title"> 
                            <a href="#">Название статьи</a><br>
                            <span>26 февраля, 2018</span>
                        </div>
                    </li>
                   
                </ul>
            </div>

            <div class="sidebar_form">
            <h3 class="main-title">Задать вопрос</h3>
                <form action="#" method="get">
                    <input class="search-area" type="text" placeholder="Ваше имя" required>
                    <input class="search-area" type="email" placeholder="Email" required>
                    <textarea></textarea>
                    <button class="blog-box_btn" type="submit">Отправить</button>
                </form>
            </div>
        </div>

    </div>

</main>

<?php get_footer();?>









