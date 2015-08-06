ActiveAdmin.register Book do

permit_params :num, :title

config.clear_sidebar_sections!
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

menu :label => "Udžbenici", :priority => 7

 index :title => 'Udžbenici' do
    selectable_column
    column "Naziv", :title
    column "Broj komada", :num
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Naziv"
      f.input :num, :label => "Broj komada"


      end

      f.actions
  end

  show do
  	attributes_table do
  	row :id
  	row :title
  	row "Broj komada", :num

  	panel "Učenici" do
        table_for book.uceniks do 
          column :name do |ucenik|
           link_to ucenik.name, [:admin, ucenik]
         end
        end
      end
 	end
  end

end
