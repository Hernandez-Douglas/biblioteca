<?php
if (isset($_POST['codigoCopia'])) {
    $codigoCopia = $_POST['codigoCopia'];
    $bibliotecario = $_POST['bibliotecario'];
    $codigo = "CALL P_RETURN($codigoCopia, @msgP, @msgL, @msgC, @msgD, @STATTUS, $bibliotecario);";
    $result = $lector->devolverLibro($codigo);
    $mensaje = $result[0]->msgDevolucion;
    $tipo = 'info';
    if ($result[0]->STATTUS == 0) {
        $tipo = 'warning';
        $mensaje = 'Error..! Libro no encontrado!';
    }
?>

    <div class="alert fade alert-<?= $tipo; ?> alert-fixed show" id="offset-alert" role="alert" data-mdb-offset="100" data-mdb-autohide="true" data-mdb-delay="5000" data-mdb-position="top-right" data-mdb-width="250px" data-mdb-hidden="true" data-mdb-append-to-body="true" data-mdb-color="primary" style="display: block; width: 250px; top: 100px; right: 100px; bottom: unset; left: unset; transform: unset;">
        <i class="fas fa-info-circle me-3"></i><?= $mensaje; ?>
    </div>
    <script>
        let eliminarAlert = () => document.getElementById("offset-alert").remove();
        setTimeout(eliminarAlert, 4000);
    </script>
<?php } ?>