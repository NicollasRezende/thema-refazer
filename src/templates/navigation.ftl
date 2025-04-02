<nav class="navbar-nav" role="navigation">
    <ul class="navbar-nav">
        <#list nav_items as nav_item>
            <#assign
                nav_item_attr_has_popup = ""
                nav_item_css_class = "nav-item"
                nav_item_layout = nav_item.getLayout()
            />

            <#if nav_item.isSelected()>
                <#assign
                    nav_item_attr_has_popup = "aria-haspopup='true'"
                    nav_item_css_class = "nav-item active"
                />
            </#if>

            <li class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
                <a class="nav-link" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
                    <span>${nav_item.getName()}</span>
                </a>

                <#if nav_item.hasChildren()>
                    <ul class="dropdown-menu" role="menu">
                        <#list nav_item.getChildren() as nav_child>
                            <#assign
                                nav_child_css_class = "dropdown-item"
                            />

                            <#if nav_child.isSelected()>
                                <#assign
                                    nav_child_css_class = "dropdown-item active"
                                />
                            </#if>

                            <li role="presentation">
                                <a class="${nav_child_css_class}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
                            </li>
                        </#list>
                    </ul>
                </#if>
            </li>
        </#list>
    </ul>
</nav>