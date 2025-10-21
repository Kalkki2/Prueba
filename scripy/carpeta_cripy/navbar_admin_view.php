<header>
    <nav class="navbar navbar-expand-lg" style="box-shadow: 1px 6px 8px 6px rgba(151, 149, 149, 0.20);">
        <div class="container-fluid">
                <a class="navbar-brand" href="<?php echo base_url('usuario_admin')?>" style="font-weight: 600; color:#4a4a4a;" >MUSNOK</a>
                <a class="toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </a>

                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">

                       <li class="nav-item">
                            <a class="nav-link py-1 mt-1 activar" href="<?php echo base_url('ver_consultas')?>">Ver Consultas</a>
                        </li>
                       <li class="nav-item">
                            <a class="nav-link py-1 mt-1 activar" href="<?php echo base_url('gestionar_usuarios')?>">Gestionar Usuarios</a>
                        </li>

                        <li>
                            <a class=" nav-link py-1 mt-1" href=""><?php echo session('apellido') .' '. session('nombre'); ?></a>
                        </li>

                        <li class="nav-item">
                            <a  class="nav-link py-1 mt-1 activar" href="<?php echo base_url('logout')?>">Salir</a>
                        </li>
                    </ul>   
                </div>
        </div>
    </nav>
</header>  

