<p class="text-center text-xl py-4">Registro de Libros</p>

<div class="flex justify-between py-4">
    <div class="order-last">
        <div class="w-32 rounded-xl bg-green-300 bg-gradient-to-r dark:bg-gray-900 border border-gray-200 dark:border-gray-700 p-2 sm:p-6">
            <div class="flex space-x-5">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                </svg>
                <a href="/biblioteca/book.php">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                    </svg>
                </a>
            </div>
        </div>
    </div>
    <div class="w-full px-2">
        <?php require_once('../../components/buscar.php'); ?>
    </div>
</div>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-blue-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="p-4">
                    <div class="flex items-center">
                        <input id="checkbox-all" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                        <label for="checkbox-all" class="sr-only">checkbox</label>
                    </div>
                </th>
                <th scope="col" class="px-6 py-3">ISBN</th>
                <th scope="col" class="px-6 py-3">Titulo</th>
                <th scope="col" class="px-6 py-3">Autor</th>
                <th scope="col" class="px-6 py-3">Copias</th>
                <th scope="col" class="px-6 py-3">Tipo de Libro</th>
                <th scope="col" class="px-6 py-3">imagen</th>
                <th scope="col" class="px-6 py-3">
                    <span class="sr-only">Edit</span>
                </th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = "SELECT * FROM `v_libros`;";
            $columnaLibro = $book->Select($sql);
            foreach ($columnaLibro as  $dato) {
            ?>

                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <td class="w-4 p-4">
                        <div class="flex items-center">
                            <input id="checkbox-table-1" value="<?php echo $dato->isbn; ?>" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                            <label for="checkbox-table-1" class="sr-only">identificador</label>
                        </div>
                    </td>
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 dark:text-white whitespace-nowrap">
                        <?php echo $dato->isbn; ?>
                    </th>
                    <td class="px-6 py-4">
                        <?php echo $dato->titulo; ?>
                    </td>
                    <td class="px-6 py-4">
                        <?php echo $dato->Autor; ?>
                    </td>
                    <td class="px-6 py-4">
                        <?php echo $dato->copias; ?>
                    </td>
                    <td class="px-6 py-4">
                        <?php echo $dato->{'Tipo de Libro'}; ?>
                    </td>
                    <td class="px-6 py-4">
                        <img src="/biblioteca/php/public/images/books/<?= $dato->image; ?>" alt="" class="w-8">
                    </td>
                    <td class="px-6 py-4 text-right">
                        <a href="/biblioteca/book.php?id=<?= $dato->{'id libro'}; ?>" name="editar" class="font-medium text-blue-600 dark:text-blue-500 hover:underline" data-modal-toggle="editbook-modall">Editar</a>
                    </td>
                </tr>
            <?php
            }

            ?>
        </tbody>
    </table>

</div>