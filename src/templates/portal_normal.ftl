<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Living Stone Hotel - Luxo e conforto em cada detalhe para uma experiência única de hospedagem">
	<meta name="keywords" content="hotel, luxo, hospedagem, acomodações, suítes, spa, reservas">
	
	<!-- Fontes Google -->
	<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Raleway:wght@300;400;500;700&display=swap" rel="stylesheet">
	
	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">
	<@liferay_ui["quick-access"] contentId="#main-content" />
	<@liferay_util["include"] page=body_top_include />
	<@liferay.control_menu />
	
	<div id="wrapper">
		<#include "${full_templates_path}/header.ftl" />

		<main id="content" role="main">
			<h1 class="hide-accessible">${the_title}</h1>

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}
				${portletDisplay.setTitle(the_title)}
				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</main>

		<#include "${full_templates_path}/footer.ftl" />
	</div>

	<@liferay_util["include"] page=body_bottom_include />
	<@liferay_util["include"] page=bottom_include />
</body>

</html>