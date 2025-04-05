<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />" lang="${w3c_language_id}">

<head>
    <title>
        ${html_title}
    </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Livingstone Hotel - ${hotel_description}">
    <meta name="keywords" content="hotel, luxo, hospedagem, acomodações, suítes, quartos, reservas">
    <meta name="author" content="Livingstone Hotel">
    <!-- Fontes Google -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <@liferay_util["include"]
        page=top_head_include />
</head>

<body class="${css_class}">
    <@liferay_ui["quick-access"]
        contentId="#main-content" />
    <@liferay_util["include"]
        page=body_top_include />
    <@liferay.control_menu />
    <div class="livingstone-page-wrapper" id="wrapper">
        <!-- Cabeçalho -->
        <#include "${full_templates_path}/header.ftl" />
        <!-- Conteúdo principal -->
        <main id="content" role="main" tabindex="-1">
            <h1 class="hide-accessible">
                ${the_title}
            </h1>
            <#if selectable>
                <@liferay_util["include"]
                    page=content_include />
                <#else>
                    ${portletDisplay.recycle()}
                    ${portletDisplay.setTitle(the_title)}
                    <@liferay_theme["wrap-portlet"]
                        page="portlet.ftl">
                        <@liferay_util["include"]
                            page=content_include />
                        </@>
            </#if>
        </main>
        <!-- Rodapé -->
        <#include "${full_templates_path}/footer.ftl" />
    </div>
    <!-- Inclusões adicionais -->
    <@liferay_util["include"]
        page=body_bottom_include />
    <@liferay_util["include"]
        page=bottom_include />
</body>

</html>