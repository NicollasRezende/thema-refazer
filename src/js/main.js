/**
 * Main JavaScript for livingstone Hotel Liferay Theme
 */

// Quando o DOM estiver carregado
document.addEventListener('DOMContentLoaded', function () {
    initializeTheme();
    handleControlMenu();
    initializeMenu();
    handleScrolling();
    detectLiferaySidebar();
    fixSidebarToggleButton();
});

/**
 * Inicialização básica do tema
 */
function initializeTheme() {
    // Adicionar classe ao body para escopar os estilos do tema
    document.body.classList.add('livingstone-theme');
}

/**
 * Detecta e configura o Control Menu do Liferay
 */
function handleControlMenu() {
    const controlMenu = document.querySelector('.control-menu');

    if (controlMenu) {
        // Adicionar classe ao body
        document.body.classList.add('has-control-menu');

        // Definir a altura do control menu como variável CSS
        const controlMenuHeight = controlMenu.offsetHeight;
        document.documentElement.style.setProperty(
            '--control-menu-height',
            `${controlMenuHeight}px`
        );
    }
}

/**
 * Corrige o problema do botão de toggle do sidebar
 */
function fixSidebarToggleButton() {
    // Função para resolver o problema dos ícones no botão de toggle
    function adjustToggleButton() {
        const toggleButtons = document.querySelectorAll(
            '.product-menu-toggle, .sidenav-toggler'
        );

        toggleButtons.forEach(function (button) {
            // Resetar todos os ícones primeiro
            const allIcons = button.querySelectorAll(
                '.lexicon-icon, .icon-open, .icon-close'
            );
            allIcons.forEach(function (icon) {
                // Remove qualquer estilo inline que possa estar interferindo
                icon.style.display = '';
            });

            // Agora aplicar as regras corretas com base na classe
            const isOpen = button.classList.contains('sidenav-toggler-open');

            // Encontrar os ícones específicos
            const openIcon = button.querySelector(
                '.icon-open, .lexicon-icon-bars'
            );
            const closeIcon = button.querySelector(
                '.icon-close, .lexicon-icon-times'
            );

            if (openIcon && closeIcon) {
                if (isOpen) {
                    openIcon.style.display = 'none';
                    closeIcon.style.display = 'inline-block';
                } else {
                    openIcon.style.display = 'inline-block';
                    closeIcon.style.display = 'none';
                }
            }
        });
    }

    // Executar inicialmente
    adjustToggleButton();

    // Observar mudanças nas classes do botão
    const observer = new MutationObserver(function (mutations) {
        adjustToggleButton();
    });

    const toggleButtons = document.querySelectorAll(
        '.product-menu-toggle, .sidenav-toggler'
    );
    toggleButtons.forEach(function (button) {
        observer.observe(button, {
            attributes: true,
            attributeFilter: ['class'],
        });
    });

    // Também observar o DOM para novos botões que possam ser adicionados
    const bodyObserver = new MutationObserver(function (mutations) {
        const toggleButton = document.querySelector(
            '.product-menu-toggle, .sidenav-toggler'
        );
        if (toggleButton) {
            adjustToggleButton();
        }
    });

    bodyObserver.observe(document.body, {
        childList: true,
        subtree: true,
    });
}

/**
 * Manipulador de scroll para efeitos de header
 */
function handleScrolling() {
    const header = document.querySelector('.livingstone-header');
    if (!header) return;

    // Efeito de scroll no header
    window.addEventListener('scroll', function () {
        if (window.scrollY > 30) {
            header.classList.add('livingstone-scrolled');
        } else {
            header.classList.remove('livingstone-scrolled');
        }
    });

    // Trigger o evento de scroll para inicializar o estado
    window.dispatchEvent(new Event('scroll'));
}

/**
 * Inicializa comportamento do menu mobile
 */
function initializeMenu() {
    const menuToggler = document.querySelector('.livingstone-navbar-toggler');
    const navbar = document.querySelector('.livingstone-navbar');
    const overlay = document.querySelector('.livingstone-header-overlay');

    if (!menuToggler || !navbar) return;

    // Função para fechar o menu
    function closeMenu() {
        navbar.classList.remove('livingstone-navbar-open');
        if (menuToggler) menuToggler.classList.remove('active');
        if (overlay) overlay.classList.remove('livingstone-visible');
        document.body.style.overflow = '';
    }

    // Toggle do menu
    menuToggler.addEventListener('click', function () {
        navbar.classList.toggle('livingstone-navbar-open');
        menuToggler.classList.toggle('active');
        if (overlay) overlay.classList.toggle('livingstone-visible');

        // Prevenir scroll do body quando menu estiver aberto
        if (navbar.classList.contains('livingstone-navbar-open')) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = '';
        }
    });

    // Fechar ao clicar no overlay
    if (overlay) {
        overlay.addEventListener('click', closeMenu);
    }

    // Fechar ao clicar em link do menu (no mobile)
    const menuLinks = document.querySelectorAll('.livingstone-nav-link');
    menuLinks.forEach(function (link) {
        link.addEventListener('click', function () {
            // Só fechar se estiver no modo mobile (menu expanded)
            if (navbar.classList.contains('livingstone-navbar-open')) {
                closeMenu();
            }
        });
    });

    // Fechar ao redimensionar para desktop
    window.addEventListener('resize', function () {
        if (
            window.innerWidth >= 992 &&
            navbar.classList.contains('livingstone-navbar-open')
        ) {
            closeMenu();
        }
    });
}

/**
 * Detecta e ajusta para o sidebar do Liferay
 */
function detectLiferaySidebar() {
    // Verificar se o sidebar do Liferay está presente
    const liferaySidebar = document.querySelector('.lfr-admin-panel');

    if (liferaySidebar) {
        // Verificar se o sidebar está aberto
        if (
            document.body.classList.contains('open-admin-panel') ||
            document.body.classList.contains('sidenav-toggler-open') ||
            document.body.classList.contains('lfr-has-sidebar')
        ) {
            // Obter a largura do sidebar e definir como variável CSS
            const sidebarWidth = liferaySidebar.offsetWidth;
            document.documentElement.style.setProperty(
                '--lfr-admin-drawer-width',
                `${sidebarWidth}px`
            );
        }

        // Observar mudanças de classe no body
        const bodyObserver = new MutationObserver(function (mutations) {
            mutations.forEach(function (mutation) {
                if (mutation.attributeName === 'class') {
                    // Verificar se o sidebar do Liferay está aberto
                    if (
                        document.body.classList.contains('open-admin-panel') ||
                        document.body.classList.contains(
                            'sidenav-toggler-open'
                        ) ||
                        document.body.classList.contains('lfr-has-sidebar')
                    ) {
                        // Obter a largura do sidebar e definir como variável CSS
                        const sidebarWidth = liferaySidebar.offsetWidth;
                        document.documentElement.style.setProperty(
                            '--lfr-admin-drawer-width',
                            `${sidebarWidth}px`
                        );
                    }
                }
            });
        });

        // Iniciar a observação do body
        bodyObserver.observe(document.body, {
            attributes: true,
            attributeFilter: ['class'],
        });
    }
}
