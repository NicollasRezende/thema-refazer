<header class="livingstone-header">
    <div class="container">
        <div class="navbar">
            <!-- Logo -->
            <div class="navbar-brand">
                <a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
                <img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
                </a>
                <h3>Living <span>Stone</span> Hotel</h3>
            </div>
            <!-- Menu Mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navigationMenu" aria-controls="navigationMenu" aria-expanded="false" aria-label="<@liferay.language key=" toggle-navigation" />">
            <svg class="lexicon-icon lexicon-icon-bars" focusable="false" role="presentation">
                <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bars" />
            </svg>
            </button>
            <!-- Navigation and User Links -->
            <div class="navbar-collapse collapse" id="navigationMenu">
                <#if has_navigation && is_setup_complete>
                    <#include "${full_templates_path}/navigation.ftl" />
                </#if>
                <!-- User Links -->
                <div class="user-links">
                    <#if !is_signed_in>
                        <a href="/c/portal/login" class="btn btn-primary">
                            <svg class="lexicon-icon lexicon-icon-sign-in" focusable="false" role="presentation">
                                <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#sign-in" />
                            </svg>
                            <span>
                                <@liferay.language key="sign-in" />
                            </span>
                        </a>
                        <#else>
                            <div class="user-info">
                                <span class="user-greeting">
                                    <svg class="lexicon-icon lexicon-icon-user" focusable="false" role="presentation">
                                        <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#user" />
                                    </svg>
                                    <span>
                                        ${user_name}
                                    </span>
                                </span>
                                <a href="${sign_out_url}" class="btn btn-outline-primary">
                                    <svg class="lexicon-icon lexicon-icon-sign-out" focusable="false" role="presentation">
                                        <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#sign-out" />
                                    </svg>
                                    <span>
                                        <@liferay.language key="sign-out" />
                                    </span>
                                </a>
                            </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <!-- Overlay for Mobile Menu -->
    <div class="header-overlay" id="headerOverlay"></div>
</header>
<script>
// Script para o overlay do menu mobile
document.addEventListener('DOMContentLoaded', function() {
    const navbarToggler = document.querySelector('.navbar-toggler');
    const headerOverlay = document.getElementById('headerOverlay');
    const navbarCollapse = document.getElementById('navigationMenu');
    if (navbarToggler && headerOverlay && navbarCollapse) {
        navbarToggler.addEventListener('click', function() {
            headerOverlay.classList.toggle('show');
        });
        headerOverlay.addEventListener('click', function() {
            navbarCollapse.classList.remove('show');
            headerOverlay.classList.remove('show');
        });
    }
});
</script>