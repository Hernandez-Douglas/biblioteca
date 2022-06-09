<?php $encabezado = 'Devoluciones'; ?>
<?php require_once('validate.php'); ?>
<p class="text-center text-xl py-4"><?= $encabezado; ?></p>
<form action="" method="POST">

    <div class="shadow overflow-hidden rounded">
        <div class="px-4 py-5 bg-white sm:p-6">
            <div class="grid gap-6 mb-6 lg:grid-cols-1">
                <div>
                    <label for="codigoCopia" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Codigo Libro</label>
                    <input name="codigoCopia" type="number" id="codigoCopia" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" autofocus placeholder="ej: 10020 Luego tecla enter" required="">
                </div>

                <input name="bibliotecario" value="1000" type="hidden" id="bibliotecario">
            </div>
            <!-- <button type="submit" name="devoluciones" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Enviar</button> -->
        </div>
</form>