<header class="livingstone-header livingstone-component">
    <div class="livingstone-container livingstone-header-container">
        <!-- Logo -->
        <a class="livingstone-logo ${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
        <img alt="${logo_description}" src="${site_logo}" height="${site_logo_height}" width="${site_logo_width}" />
        <div class="livingstone-logo-text">livingstone <span class="livingstone-accent-text">Hotel</span></div>
        </a>
        <!-- Menu Mobile Toggle -->
        <button class="livingstone-navbar-toggler" type="button" aria-controls="livingstoneNavbar" aria-expanded="false" aria-label="<@liferay.language key=" toggle-navigation" />">
        <span class="livingstone-toggler-icon"></span>
        </button>
        <!-- Navigation -->
        <div class="livingstone-navbar" id="livingstoneNavbar">
            <#if has_navigation && is_setup_complete>
                <#include "${full_templates_path}/navigation.ftl" />
            </#if>
            <!-- User Links -->
            <div class="livingstone-user-links">
                <#if !is_signed_in>
                    <a href="/c/portal/login" class="livingstone-btn livingstone-btn-primary">
                        <span class="livingstone-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path>
                                <polyline points="10 17 15 12 10 7"></polyline>
                                <line x1="15" y1="12" x2="3" y2="12"></line>
                            </svg>
                        </span>
                        <span>
                            <@liferay.language key="sign-in" />
                        </span>
                    </a>
                    <#else>
                        <div class="livingstone-user-info">
                            <span class="livingstone-user-greeting">
                                <span class="livingstone-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                </span>
                                <span>
                                    ${user_name}
                                </span>
                            </span>
                            <a href="${sign_out_url}" class="livingstone-btn livingstone-btn-outline">
                                <span class="livingstone-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                        <polyline points="16 17 21 12 16 7"></polyline>
                                        <line x1="21" y1="12" x2="9" y2="12"></line>
                                    </svg>
                                </span>
                                <span>
                                    <@liferay.language key="sign-out" />
                                </span>
                            </a>
                        </div>
                </#if>
            </div>
        </div>
    </div>
    <!-- Overlay for Mobile Menu -->
    <div class="livingstone-header-overlay" aria-hidden="true"></div>
</header>