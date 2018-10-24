<?php get_header();?>
<main>
    <div class="container">
        <!-- <?php get_template_part('templates/breadcrumbs'); ?>
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
       </h1> -->
    </div>

    <div class="container blog-box">
        <div class="content-box ">
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
            <div class="product-box">
                <?php if ( have_posts() ) : while ( have_posts() ) : the_post();
                    
                        $cat = get_category(get_query_var('cat'),false);
                        $cat_parent = $cat->parent; // ID родительской категории
                        $current_cat = get_query_var('cat'); // ID текущей категории
                        
                        $ancestors = get_ancestors( $current_cat, 'category' );
                        if (in_array(18, $ancestors)) {
                            get_template_part('templates/cart');
                        }else{
                            get_template_part('templates/post');
                        }
                    endwhile;
                    else:
                    endif;
            ?>
            </div>
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
