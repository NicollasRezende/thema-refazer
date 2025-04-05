/**
 * Main JavaScript for Livingstone Hotel Liferay Theme
 */

// Quando o DOM estiver carregado
document.addEventListener('DOMContentLoaded', function () {
    initializeHeader();
    initializeMenuBehavior();
    setupAccessibility();
    detectLiferaySidebar();
});

// Quando o Liferay terminar de carregar todos os portlets
Liferay.on('allPortletsReady', function () {
    console.log('All portlets are loaded');
    initializeDynamicComponents();
    detectLiferaySidebar();
});

/**
 * Inicializa comportamentos do header
 */
function initializeHeader() {
    const header = document.querySelector('.livingstone-header');
    const body = document.body;

    if (!header) return;

    // Verificar se o controle-menu do Liferay está visível
    const controlMenu = document.querySelector('.control-menu');
    if (controlMenu) {
        body.classList.add('has-control-menu');
        // Define variável CSS com a altura do control-menu
        const controlMenuHeight = controlMenu.offsetHeight;
        document.documentElement.style.setProperty(
            '--control-menu-height',
            `${controlMenuHeight}px`
        );
    }

    // Efeito de scroll no header
    window.addEventListener('scroll', function () {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Trigger o evento de scroll para inicializar o estado
    window.dispatchEvent(new Event('scroll'));
}

/**
 * Inicializa comportamento do menu (especialmente para mobile)
 */
function initializeMenuBehavior() {
    const navbarToggler = document.querySelector('.navbar-toggler');
    const navbarCollapse = document.querySelector('.navbar-collapse');
    const headerOverlay = document.querySelector('.header-overlay');

    if (!navbarToggler || !navbarCollapse) return;

    // Função para fechar o menu
    function closeMenu() {
        navbarCollapse.classList.remove('show');
        if (headerOverlay) {
            headerOverlay.classList.remove('show');
        }
        document.body.classList.remove('menu-open');
    }

    // Toggle do menu
    navbarToggler.addEventListener('click', function () {
        navbarCollapse.classList.toggle('show');
        if (headerOverlay) {
            headerOverlay.classList.toggle('show');
        }
        document.body.classList.toggle('menu-open');
    });

    // Fechar ao clicar no overlay
    if (headerOverlay) {
        headerOverlay.addEventListener('click', closeMenu);
    }

    // Fechar ao clicar em link do menu (no mobile)
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    navLinks.forEach(function (link) {
        link.addEventListener('click', function () {
            // Só fechar se estiver no modo mobile (menu expanded)
            if (navbarCollapse.classList.contains('show')) {
                closeMenu();
            }
        });
    });

    // Fechar ao redimensionar para desktop
    window.addEventListener('resize', function () {
        if (
            window.innerWidth >= 992 &&
            navbarCollapse.classList.contains('show')
        ) {
            closeMenu();
        }
    });

    // Comportamento de dropdowns nos dispositivos móveis
    setupDropdowns();
}

/**
 * Configuração dos dropdowns do menu
 */
function setupDropdowns() {
    const dropdownItems = document.querySelectorAll('.nav-item.dropdown');

    dropdownItems.forEach(function (item) {
        const link = item.querySelector('.nav-link');
        const menu = item.querySelector('.dropdown-menu');

        if (!link || !menu) return;

        // Em dispositivos móveis, evitar que o clique no link abra a página
        link.addEventListener('click', function (e) {
            // Verificar se estamos em viewport mobile
            if (window.innerWidth < 992) {
                e.preventDefault();
                menu.classList.toggle('show');
            }
        });

        // Em desktop, mostrar/ocultar no hover
        if (window.matchMedia('(min-width: 992px)').matches) {
            item.addEventListener('mouseenter', function () {
                menu.classList.add('show');
            });

            item.addEventListener('mouseleave', function () {
                menu.classList.remove('show');
            });
        }
    });
}

/**
 * Melhoria de acessibilidade para componentes interativos
 */
function setupAccessibility() {
    // Melhorar acessibilidade dos ícones interativos
    const iconLinks = document.querySelectorAll('a[aria-label]');
    iconLinks.forEach(function (link) {
        // Garantir que ícones SVG tenham papel apresentacional
        const svg = link.querySelector('svg');
        if (svg) {
            svg.setAttribute('focusable', 'false');
            svg.setAttribute('role', 'presentation');
        }
    });

    // Garantir que todos os formulários têm labels acessíveis
    const formInputs = document.querySelectorAll('input, textarea, select');
    formInputs.forEach(function (input) {
        if (!input.id) {
            input.id = 'input-' + Math.random().toString(36).substr(2, 9);
        }

        // Se não tiver label, verificar se tem placeholder e criar aria-label
        const hasLabel = document.querySelector(`label[for="${input.id}"]`);
        if (
            !hasLabel &&
            input.placeholder &&
            !input.getAttribute('aria-label')
        ) {
            input.setAttribute('aria-label', input.placeholder);
        }
    });
}

/**
 * Inicializa componentes dinâmicos após o carregamento dos portlets
 */
function initializeDynamicComponents() {
    // Adicionar tooltips do Bootstrap se existirem
    if (typeof bootstrap !== 'undefined' && bootstrap.Tooltip) {
        const tooltips = document.querySelectorAll(
            '[data-bs-toggle="tooltip"]'
        );
        tooltips.forEach(function (tooltip) {
            new bootstrap.Tooltip(tooltip);
        });
    }

    // Inicializar scrollspy para o menu se existir
    if (typeof bootstrap !== 'undefined' && bootstrap.ScrollSpy) {
        const body = document.body;
        if (body) {
            new bootstrap.ScrollSpy(body, {
                target: '.navbar-nav',
                offset: 100,
            });
        }
    }

    // Animação suave de scroll para links internos
    const internalLinks = document.querySelectorAll(
        'a[href^="#"]:not([href="#"])'
    );
    internalLinks.forEach(function (link) {
        link.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);

            if (targetElement) {
                e.preventDefault();
                const headerHeight = document.querySelector(
                    '.livingstone-header'
                ).offsetHeight;
                const targetPosition =
                    targetElement.getBoundingClientRect().top +
                    window.pageYOffset -
                    headerHeight;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth',
                });
            }
        });
    });
}

/**
 * Detecta a abertura e fechamento do sidebar do Liferay
 */
function detectLiferaySidebar() {
    // Verificar se o sidebar do Liferay está presente
    const liferaySidebar = document.querySelector('.lfr-admin-panel');
    
    if (liferaySidebar) {
        // Observar mudanças de visibilidade no sidebar do Liferay
        const bodyObserver = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                if (mutation.attributeName === 'class') {
                    const body = document.body;
                    // Verificar se o sidebar do Liferay está aberto
                    if (body.classList.contains('open-admin-panel') || 
                        body.classList.contains('sidenav-toggler-open') ||
                        body.classList.contains('lfr-has-sidebar')) {
                        body.classList.add('open-admin-drawer');
                        
                        // Obter a largura do sidebar e definir como variável CSS
                        const sidebarWidth = liferaySidebar.offsetWidth;
                        document.documentElement.style.setProperty('--lfr-admin-drawer-width', `${sidebarWidth}px`);
                    } else {
                        body.classList.remove('open-admin-drawer');
                    }
                }
            });
        });
        
        // Iniciar a observação do body
        bodyObserver.observe(document.body, {
            attributes: true,
            attributeFilter: ['class']
        });
        
        // Verificar se o sidebar já está aberto no carregamento da página
        if (document.body.classList.contains('open-admin-panel') || 
            document.body.classList.contains('sidenav-toggler-open') ||
            document.body.classList.contains('lfr-has-sidebar')) {
            document.body.classList.add('open-admin-drawer');
            const sidebarWidth = liferaySidebar.offsetWidth;
            document.documentElement.style.setProperty('--lfr-admin-drawer-width', `${sidebarWidth}px`);
        }
    }
}

/**
 * Helper para detectar se a tela é touch
 */
function isTouchDevice() {
    return (
        'ontouchstart' in window ||
        navigator.maxTouchPoints > 0 ||
        navigator.msMaxTouchPoints > 0
    );
}