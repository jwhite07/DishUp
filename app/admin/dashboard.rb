ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Restaurants" do 
          div class: "dashboard_status" do
            h1 Restaurant.all.count
            link_to "Manage Restaurants", admin_restaurants_path
          end
        end
      end
      column do
        panel "Dishes" do 
          div class: "dashboard_status" do
            h1 Dish.all.count
            link_to "Manage Dishes", admin_dishes_path
          end
        end
      end
      column do
        panel "DishPics" do 
          div class: "dashboard_status" do
            h1 Dishpic.all.count
            link_to "Manage DishPics", admin_dishpics_path
          end
        end
      end
      column do
        panel "Users" do 
          div class: "dashboard_status" do
            h1 User.all.count
            link_to "Manage Users", admin_users_path
          end
        end
      end
      
    end
    columns do 
      column do
        panel "Newest Locations" do
          table_for Location.all.order("id desc").limit(10) do
                      column("Name")    {|loc| link_to(loc.name, admin_location_path(loc))                               }
                      column("City")    {|loc| text_node "#{loc.city}, #{loc.state}" }
                      column("Dishes")  {|loc| text_node loc.restaurant.dishes.count                      }
                    end
        end
      end
      column do
        panel "Download Latest iOS Build" do
          
            link_to 'Install App', "itms-services://?action=download-manifest&url=https://dishupapp.herokuapp.com/manifest.plist"
          
         
        end
      end
    end
    
          
    

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
  end # content
end
