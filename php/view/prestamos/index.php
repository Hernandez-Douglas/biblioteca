<?php
$encabezado = 'Sistema de prestamos';
if (isset($_POST['codigoLector'])) {
    $codigo = $_POST['codigoLector'];
    $call = "CALL P_READER($codigo, @estado, @mensaje);";
    $datos = $lector->consultarEstado($call);
}
if (isset($_POST['codigoCopia'])) {
    $codLector = $_POST['lector'];
    $libro = $_POST['codigoCopia'];
    $bibliotecario = $_POST['bibliotecario'];
    $prestar = "CALL P_LOANS($codLector, $bibliotecario, $libro, @mensaje, @STATTUS);";
    $result = $lector->prestarLibro($prestar);
    $tipo = 'info';
    if ((@$result[0]->STATTUS == 0)) $tipo = 'warning';
?>
    <div class="alert fade alert-<?= $tipo; ?> alert-fixed show" id="offset-alert" role="alert" data-mdb-offset="100" data-mdb-autohide="true" data-mdb-delay="5000" data-mdb-position="top-right" data-mdb-width="250px" data-mdb-hidden="true" data-mdb-append-to-body="true" data-mdb-color="primary" style="display: block; width: 250px; top: 100px; right: 100px; bottom: unset; left: unset; transform: unset;">
        <i class="fas fa-info-circle me-3"></i><?= @$result[0]->msg; ?>
    </div>
    <script>
        let eliminarAlert = () => document.getElementById("offset-alert").remove();
        setTimeout(eliminarAlert, 4000);
    </script>
<?php
}
?>
<p class="text-center text-xl py-4"><?= $encabezado; ?></p>
<form action="" method="POST">
    <div class="shadow overflow-hidden rounded">
        <div class="px-4 py-5 bg-white sm:p-6">
            <div class="grid gap-6 mb-6 lg:grid-cols-1">
                <?php
                if ((@$datos[0]->id !== 1)) {
                ?>
                    <div>
                        <label for="codigoLector" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Codigo Lector </label>
                        <input name="codigoLector" type="search" id="codigoLector" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="10025 Luego presiona enter" required="" autofocus>
                        <label class="block mb-2 text-sm font-medium text-red-600" for="mensaje"><?= @$datos[0]->msg; ?></label>
                    </div>
                <?php
                }
                if (isset($_POST['codigoLector']) && (@$datos[0]->id == 1)) {
                ?>

                    <label for="codigoCopia" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Codigo de Libro</label>
                    <div class="flex">
                        <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            COP--
                        </span>
                        <input type="number" id="codigoCopia" name="codigoCopia" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="1001" require="" autofocus>
                    </div>
                    <input type="hidden" name="lector" value="<?= $codigo; ?>">

                    <input name="bibliotecario" value="1000" type="hidden" id="bibliotecario">
            </div>
            <button type="submit" name="prestamo" class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Enviar</button>
        <?php
                } else {
        ?>

        </div>
    <?php } ?>
    </div>
</form>