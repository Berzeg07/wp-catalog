<?php get_header();?>

<main>
    <div class="container">
        <?php get_template_part('templates/breadcrumbs'); ?>
        <h1 class="main-title">
           <?php
               $getcat = get_the_category();
               $cat = $getcat[0]->cat_ID;
               if($cat != 1){
                   mayak_cat_h1($name_cat);
               }
               else{

               }
           ?>
       </h1>
    </div>

    <div class="container blog-box">
        <!-- Content -->
        <div class="content-box product-box">

        <?php if ( have_posts() ) : while ( have_posts() ) : the_post();

                // $getcat = get_the_category();
                // $cat = $getcat[0]->cat_ID;

                // $categories = get_categories( array(
                //     'type'         => 'post',
                //     'child_of'     => 18
                // ) );

                $cat = get_category(get_query_var('cat'),false);
                $cat_parent = $cat->parent; // ID родительской категории
                $current_cat = get_query_var('cat'); // ID текущей категории
                if ($cat_parent == 18 || $cat_parent == 19) {
                    get_template_part('templates/cart');
                } else {
                    get_template_part('templates/post');
                }
                // if($cat = 1){
                //     get_template_part('templates/post');
                // }
                // else{
                //     get_template_part('templates/cart');
                // }
            endwhile;
            else:
            endif;
        ?>

           <?php catalog_pagination(); ?>



        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <?php get_sidebar();?>
        </div>
    </div>
    <div class="cateory-desc container">
         <?php
             if (is_category()) {
             if (is_paged()) { echo '';}
             else {
                 echo category_description(); }
             }
         ?>
     </div>
</main>

<?php get_footer();?>
