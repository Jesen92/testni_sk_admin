ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "Dashboard"
config.clear_sidebar_sections!

  content :title => proc{ I18n.t("active_admin.dashboard") } do

columns do
    column do
        panel "Nedavno izmjenjen sadržaj" do
          table_for PaperTrail::Version.order('id desc').limit(50) do  # Use PaperTrail::Version if this throws an error
            #column("Item") { |v| v.item }
            column "Item" do |v|
                if v.event.to_s == "destroy"
                    v.item
                else
                    if v.item.try(:name)
                        link_to v.item.name, [:admin, v.item]
                    elsif v.item.try(:title)
                        link_to v.item.title, [:admin, v.item]
                    else
                        v.item
                    end                        
                end
            end
   
            column("Tip") { |v| v.item_type.underscore.humanize }
            column("Događaj") { |v| v.event }
            column("Vrijeme") { |v| v.created_at.to_s :long }

            column"Korisnik" do |v|
                if User.find(v.whodunnit) != nil
                    link_to User.find(v.whodunnit).email, [:admin, User.find(v.whodunnit)] 
                else
                    deleted user
                end
            end
          end
    end
end
end
end

 # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

 # content title: proc{ I18n.t("active_admin.dashboard") } do
 #   div class: "blank_slate_container", id: "dashboard_default_message" do
 #     span class: "blank_slate" do
 #       span I18n.t("active_admin.dashboard_welcome.welcome")
 #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
 #     end
 #   end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
 # end # content



end
