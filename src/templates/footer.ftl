<footer class="livingstone-footer">
    <!-- Decoração de fundo -->
    <div class="footer-decoration"></div>
    <div class="container">
        <div class="row">
            <!-- Informações da Marca -->
            <div class="col-lg-4 footer-brand">
                <h4>Living Stone Hotel</h4>
                <p>Luxo e conforto em cada detalhe para proporcionar uma experiência inesquecível em sua estadia.</p>
                <!-- Redes Sociais -->
                <div class="social-icons">
                    <a href="#" aria-label="Instagram">
                        <svg class="lexicon-icon lexicon-icon-social-instagram" focusable="false" role="presentation">
                            <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#social-instagram" />
                        </svg>
                    </a>
                    <a href="#" aria-label="Facebook">
                        <svg class="lexicon-icon lexicon-icon-social-facebook" focusable="false" role="presentation">
                            <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#social-facebook" />
                        </svg>
                    </a>
                    <a href="#" aria-label="Twitter">
                        <svg class="lexicon-icon lexicon-icon-twitter" focusable="false" role="presentation">
                            <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#twitter" />
                        </svg>
                    </a>
                    <a href="#" aria-label="LinkedIn">
                        <svg class="lexicon-icon lexicon-icon-social-linkedin" focusable="false" role="presentation">
                            <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#social-linkedin" />
                        </svg>
                    </a>
                </div>
            </div>
            <!-- Links de Navegação do Rodapé -->
            <div class="col-lg-3 footer-nav">
                <h4>
                    <@liferay.language key="navigation" />
                </h4>
                <#if nav_items??>
                    <ul class="footer-links">
                        <#list nav_items as nav_item>
                            <li><a href="${nav_item.getURL()}">
                                    ${nav_item.getName()}
                                </a></li>
                        </#list>
                    </ul>
                </#if>
            </div>
            <!-- Informações de Contato -->
            <div class="col-lg-3 footer-contact">
                <h4>
                    <@liferay.language key="contact" />
                </h4>
                <p>
                    <svg class="lexicon-icon lexicon-icon-phone" focusable="false" role="presentation">
                        <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#phone" />
                    </svg>
                    <span>+55 (11) 99999-9999</span>
                </p>
                <p>
                    <svg class="lexicon-icon lexicon-icon-envelope" focusable="false" role="presentation">
                        <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#envelope" />
                    </svg>
                    <span>contato@livingstone.com</span>
                </p>
                <p>
                    <svg class="lexicon-icon lexicon-icon-map-marker" focusable="false" role="presentation">
                        <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#map-marker" />
                    </svg>
                    <span>Av. Principal, 1000 - São Paulo, SP</span>
                </p>
                <p>
                    <svg class="lexicon-icon lexicon-icon-calendar" focusable="false" role="presentation">
                        <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#calendar" />
                    </svg>
                    <span>Funcionamento 24h</span>
                </p>
            </div>
            <!-- Newsletter -->
            <div class="col-lg-2 footer-newsletter">
                <h4>Newsletter</h4>
                <p>Receba novidades e ofertas exclusivas.</p>
                <form class="newsletter-form">
                    <input type="email" placeholder="Seu e-mail" required aria-label="E-mail para newsletter">
                    <button type="submit">
                        <svg class="lexicon-icon lexicon-icon-paper-plane" focusable="false" role="presentation">
                            <use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#paper-plane" />
                        </svg>
                    </button>
                </form>
            </div>
        </div>
        <!-- Parte Inferior do Rodapé -->
        <div class="footer-bottom">
            <p>&copy; ${the_year} ${company_name}.
                <@liferay.language key="all-rights-reserved" /> |
                <a href="#">
                    <@liferay.language key="privacy-policy" />
                </a> |
                <a href="#">
                    <@liferay.language key="terms-of-use" />
                </a>
            </p>
        </div>
    </div>
</footer>