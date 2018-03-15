<div class="search-box">
    <form role="search" action="<?php bloginfo( 'url' ); ?>" method="get">
        <input class="search-area" name="s" type="text" placeholder="Поиск" value="<?php if(!empty($_GET['s'])){echo $_GET['s'];}?>">
        <button type="submit"></button>
    </form>
</div>