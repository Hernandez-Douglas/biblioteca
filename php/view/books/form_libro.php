<?php
$encabezado = 'Formulario registro de libros';
# Editar o registrar
if (isset($_GET['id'])) {
    $encabezado = 'Editar registro de libros';
    $btnNombre = 'editar';
    $id = intval($_GET['id']);
    $sqlLibro = "SELECT * FROM `v_editar_libro` WHERE ideditar = $id;";
    $tblLibro = $book->Select($sqlLibro);
    # cargar valores en el formulario
  
    $isbn = $tblLibro[0]->isbn;
    $tituloLibro = $tblLibro[0]->titulo;
    $idAutor = $tblLibro[0]->{'id autor'};
    $autor = $tblLibro[0]->{'nombre autor'};
    $idTipoLibro = $tblLibro[0]->{'id tipo libro'};
    $tipoLibro = $tblLibro[0]->{'tipo de libro'};
    $imagen_db = $tblLibro[0]->{'imagen'};
}
?>
<p class="text-center text-xl py-4"><?= $encabezado; ?></p>
<form action="" method="POST" enctype='multipart/form-data'>
    <div class="shadow overflow-hidden rounded">
        <div class="px-4 py-5 bg-white sm:p-6">
            <div class="grid gap-6 mb-6 lg:grid-cols-2">
                <div>
                    <label for="isbn" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">ISBN</label>
                    <input name="isbn" type="text" value="<?= $isbn; ?>" id="isbn" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="0-7645-2641-3" required="">
                </div>
                <div>
                    <label for="title" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Titulo</label>
                    <input name="titulo" type="text" value="<?= $tituloLibro; ?>" id="title" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="El sueño de una noche de verano" required="">
                </div>
                <?php if (!isset($_GET['id'])) { ?>
                <div>
                    <label for="copias" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Copias</label>
                    <input name="copias" type="number" min="1" value="1" id="copias" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                </div>
                <?php }?>
                <div>
                    <label for="autor" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">Selecciona un Autor</label>
                    <select id="autor" name="autor" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option value="<?= $idAutor; ?>" selected=""><?= $autor; ?></option>
                        <?php
                        foreach ($datosAutor as $columnaAutor) {
                        ?>
                            <option value="<?php echo $columnaAutor['idAutor'] ?>"><?php echo $columnaAutor['nombre'] ?></option>
                        <?php
                        }
                        ?>
                    </select>
                </div>
                <div>
                    <label for="tipo-libro" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">Selecciona un tipo libro</label>
                    <select id="tipo-libro" name="tipo-libro" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option value="<?= $idTipoLibro; ?>" selected=""><?= $tipoLibro; ?></option>
                        <?php
                        foreach ($datosTiposDeLibros as $columnaTiposLibros) {
                        ?>
                            <option value="<?php echo $columnaTiposLibros['idtipoLibro'] ?>"><?php echo $columnaTiposLibros['nombre'] ?></option>
                        <?php
                        }
                        ?>
                    </select>
                </div>
            </div>
            <div class="grid gap-6 mb-6 lg:grid-cols-2">

            </div>
            <div class="flex justify-center items-center w-full">
                <label for="dropzone-file" class="flex flex-col justify-center items-center w-full h-64 bg-gray-50 rounded-lg border-2 border-gray-300 border-dashed cursor-pointer dark:hover:bg-bray-800 dark:bg-gray-700 hover:bg-gray-100 dark:border-gray-600 dark:hover:border-gray-500 dark:hover:bg-gray-600">
                    <div class="flex flex-col justify-center items-center pt-5 pb-6">
                        <svg class="mb-3 w-10 h-10 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                        </svg>
                        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400"><span class="font-semibold">Haga clic para cargar</span> o arrastrar y soltar</p>
                        <p class="text-xs text-gray-500 dark:text-gray-400">SVG, PNG, JPG o GIF (MAX. 800x400px)</p>
                    </div>
                    <input id="dropzone-file" name="imagen" value="<?= $imagen_db;?>" type="file" class="hidden" accept="image/png, .jpeg, .jpg, image/gif"/>
                </label>
            </div>
            <div>
                <p class="py-4"></p>
                <input name="bibliotecario" value="1000" type="hidden" id="bibliotecario">
                <input name="imagen_db" value="<?= $imagen_db;?>" type="hidden" id="bibliotecario">
                <input name="idEditarLibro" value="<?= $id;?>" type="hidden" id="idEditarLibro">
            </div>

            <button type="submit" name="<?= $btnNombre; ?>" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Enviar</button>
        </div>
    </div>
</form>