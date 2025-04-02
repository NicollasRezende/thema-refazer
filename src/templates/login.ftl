<div class="custom-login-page">
    <div class="login-container">
        <!-- Cabeçalho do Login -->
        <div class="login-header">
            <img src="/documents/d/guest/logohotel" alt="${company_name}" class="logo-img" />
            <h2>Bem-vindo ao Living Stone Hotel</h2>
            <p>
                <@liferay.language key="sign-in-to-your-account" default="Entre com suas credenciais para acessar" />
            </p>
        </div>
        
        <!-- Wrapper do portlet de login -->
        <div class="portlet-login-wrapper">
            <@liferay_portlet["runtime"]
                defaultPreferences="${freeMarkerPortletPreferences}"
                portletProviderAction=portletProviderAction.VIEW
                portletProviderClassName="com.liferay.login.web.internal.portlet.action.LoginPortlet" />
        </div>
        
        <!-- Rodapé do Login -->
        <div class="login-footer">
            <p>Ainda não tem uma conta?</p>
            <a href="/web/guest/criar-conta" class="create-account-button">
                <@liferay.language key="create-account" default="Criar Conta" />
            </a>
        </div>
    </div>
</div>

