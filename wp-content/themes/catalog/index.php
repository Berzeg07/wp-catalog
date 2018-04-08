<?php get_header();?>

<main>
    <!-- breadcrumbs -->
    <div class="container">
        <?php get_template_part('templates/breadcrumbs'); ?>
    </div>

    <div class="container blog-box">
        <!-- Content -->
        <div class="content-box">
      
        <?php 
         
            if ( have_posts() ) : while ( have_posts() ) : the_post();
              
                $getcat = get_the_category();
                $cat = $getcat[0]->cat_ID;

                if($cat == 1){ 
                    get_template_part('templates/post');
                }
                else{
                    get_template_part('templates/cart');
                }
    
            endwhile; 
            else: 
            endif; 
        ?>

           <?php catalog_pagination(); ?>

           <div class="cateory-desc container">
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

                <?php                  
                    if (is_category()) {
                    if (is_paged()) { echo '';}
                    else {
                        echo category_description(); }
                    }
                ?>

            </div>

        </div>
        
        <!-- Sidebar -->
        <div class="sidebar">
            <?php get_sidebar();?>
        </div>

</main>

<?php get_footer();?>









