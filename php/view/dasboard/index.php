<?php
$sql = "SELECT * FROM `v_libros`;";
$columnaLibro = $book->Select($sql);
?>
<div class="grid sm:grid-cols-2 md:grid-cols-2">
<?php
foreach ($columnaLibro as  $dato) {
?>
    <div class="max-w-sm bg-white rounded-lg shadow-md dark:bg-gray-800 dark:border-gray-700">
        <a href="#">
            <img width="309px" class="p-8 rounded-t-lg" src="php/public/images/books/<?= $dato->image; ?>" alt="<?= $dato->titulo; ?>">
        </a>
        <div class="px-5 pb-5">
            <a href="#">
                <h5 class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white"><?= $dato->titulo; ?></h5>
            </a>

        </div>
    </div>
<?php } ?>
</div>