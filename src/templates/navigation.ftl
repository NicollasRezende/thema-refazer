<#if nav_items?has_content>
    <ul class="livingstone-nav" role="menubar">
        <#list nav_items as nav_item>
            <#assign
                nav_item_attr_has_popup=""
                nav_item_css_class="livingstone-nav-item"
                nav_item_layout=nav_item.getLayout()
                nav_item_link_css_class="livingstone-nav-link" />
            <#if nav_item.isSelected()>
                <#assign
                    nav_item_css_class="${nav_item_css_class} livingstone-nav-item-active"
                    nav_item_link_css_class="${nav_item_link_css_class} livingstone-active" />
            </#if>
            <li class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
                <a
                    class="${nav_item_link_css_class}"
                    href="${nav_item.getURL()}"
                    ${nav_item.getTarget()}
                    role="menuitem">
                    ${nav_item.getName()}
                </a>
                <#if nav_item.hasChildren()>
                    <ul class="livingstone-dropdown" role="menu">
                        <#list nav_item.getChildren() as nav_child>
                            <#assign
                                nav_child_css_class="livingstone-dropdown-item" />
                            <#if nav_child.isSelected()>
                                <#assign
                                    nav_child_css_class="${nav_child_css_class} livingstone-active" />
                            </#if>
                            <li role="presentation">
                                <a class="${nav_child_css_class}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
                                    ${nav_child.getName()}
                                </a>
                            </li>
                        </#list>
                    </ul>
                </#if>
            </li>
        </#list>
    </ul>
</#if>