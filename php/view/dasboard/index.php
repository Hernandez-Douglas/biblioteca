<?php
$sql = "SELECT * FROM `v_libros`;";
$columnaLibro = $book->Select($sql);
?>
<section class="overflow-hidden text-gray-700">
    <div class="container px-5 py-2 mx-auto lg:pt-24 lg:px-32">
        <div class="flex flex-wrap -m-1 md:-m-2">
            <div class="flex flex-wrap w-96">
            <?php foreach ($columnaLibro as  $dato) { ?>
                <div class="w-48 p-1 md:p-2">
                    <img alt="gallery" class="block object-cover object-center w-full h-full rounded-lg" src="php/public/images/books/<?= $dato->image; ?>" alt="<?= $dato->titulo; ?>">
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
</section>