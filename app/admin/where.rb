ActiveAdmin.register Where do

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

menu :label => "Predavaonice", :priorty => 6

 index :title => 'Predavaonice' do
    selectable_column
    column :id, :sortable => :id
    column :name
    column "Adresa", :adress
    actions
  end

show do
    attributes_table do
      row :id
      row :name
      row :adress

    panel "Predavanja" do
        table_for where.single_events.sort_by {|e| e.date} do 
          column :title do |event|
           link_to event.title, [:admin, event]
         end
         column "Datum", :date do |event|
         	event.date.to_date.strftime(" %d.%m.%Y.")
         end
         column "Početak", :start
         column "Kraj", :end
      end
  	 end
    end
  end

end
