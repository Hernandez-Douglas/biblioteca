<section class="flex flex-col justify-center antialiased text-gray-600 min-h-screen p-4">
    <div class="h-full">
        <div class="w-full max-w-2xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
            <header class="px-5 py-4 border-b border-gray-100">
                <h2 class="font-semibold text-gray-800">Lectores con Deudas</h2>
            </header>
            <div class="p-3">
                <div class="overflow-x-auto">
                    <table class="table-auto w-full">
                        <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                            <tr>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="font-semibold text-left">Nombre</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="font-semibold text-left">Email</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="font-semibold text-left">Estado</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="font-semibold text-center">Libros</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="font-semibold text-left">Codigo</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="text-sm divide-y divide-gray-100">
                            <?php foreach ($columna as $valor) { ?>

                                <tr>
                                    <td class="p-2 whitespace-nowrap">
                                        <div class="flex items-center">

                                            <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                                                <img class="rounded-full" src="/biblioteca/php/public/images/usuarios/<?= $valor->codigoLector; ?>.jpg" width="40" height="40" alt="<?= $valor->nombre; ?>">
                                            </div>
                                            <div class="font-medium text-gray-800"><?= $valor->nombre; ?></div>
                                        </div>
                                    </td>
                                    <td class="p-2 whitespace-nowrap">
                                        <div class="text-left"><?= $valor->usuario; ?></div>
                                    </td>
                                    <td class="p-2 whitespace-nowrap">
                                        <div class="text-left font-medium text-green-500">activo</div>
                                    </td>
                                    <td class="p-2 whitespace-nowrap">
                                        <div class="text-lg text-center"><?= $valor->cantidad; ?></div>
                                    </td>
                                    <td class="p-2 whitespace-nowrap">
                                        <div class="text-left">
                                            <!-- Button trigger modal -->
                                            <button type="button" class="hidden sm:inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:outline-none focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5" data-mdb-toggle="modal" data-mdb-target="#exampleModal<?= $valor->codigoLector; ?>">
                                                <?= $valor->codigoLector; ?>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Modal -->
                                <div class="modal top fade" id="exampleModal<?= $valor->codigoLector; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-mdb-backdrop="true" data-mdb-keyboard="false">
                                    <div class="modal-dialog modal-lg modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Libros</h5>
                                            </div>
                                            <div class="modal-body">
                                                <?php
                                                $sql = "SELECT * FROM `v_datolector` WHERE codigo =$valor->codigoLector;";
                                                $libros = $lector->Select($sql);
                                                foreach ($libros as $libro) { ?>
                                                    <a href="devoluciones.php?lib=<?= $libro->idCopia;?>" class="btn btn-light"><?= $libro->titulo; ?></a>
                                                <?php } ?>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</section>