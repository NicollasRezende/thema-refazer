<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />" lang="${w3c_language_id}">

<head>
    <title>
        ${the_title}
    </title>
    <!-- Fontes Google -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <@liferay_util["include"]
        page=top_head_include />
</head>

<body class="livingstone-theme portal-popup ${css_class}">
    <@liferay_util["include"]
        page=content_include />
    <@liferay_util["include"]
        page=bottom_ext_include />
</body>

</html>