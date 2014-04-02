Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "add_mixpanel_configuration_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
                     :text  => %q{<%= configurations_sidebar_menu_item Spree.t("mixpanel_settings"), spree.edit_admin_mixpanel_settings_path %>},
                     :disabled => false)
