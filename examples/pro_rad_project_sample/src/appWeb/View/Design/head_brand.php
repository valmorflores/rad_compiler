<div class="header-brand">
            <div class="nav-item no-hover">
               <h6 class="title"><span class="tag tag--dark text-success"> TI</span> <span class=" subtitle font-normal"> Administração</span></h6>
            </div>
            <div class="nav-item nav-btn" id="header-btn"> <span></span> <span></span> <span></span> </div>
         </div>
         <div class="header-nav" id="header-menu">
            <div class="nav-left">
               
            </div>
            <div class="nav-right">
               <div class="nav-item has-sub toggle-hover" id="dropdown">
                  <a class="nav-dropdown-link">Menu</a> 
                  <ul class="dropdown-menu dropdown-animated" role="menu">
                     <li role="menu-item"><a href="<?php echo base_url();?>/public/dashboard">Dashboard</a></li>
                     <li role="menu-item"><a href="<?php echo base_url();?>/public/profile">Perfil</a></li>
                     <?php if ( isProfileAdmin() ) { ?>
                     <li role="menu-item"><a href="<?php echo base_url();?>/public/internalusers">Usuários</a></li>
                     <?php } ?>
                     <li role="menu-item"><a href="<?php echo base_url();?>/public/login/off">Sair</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>