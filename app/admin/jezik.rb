ActiveAdmin.register Jezik do

menu :label => "Jezici", :priority => 8
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

index :title => "Jezici" do
    selectable_column
    column :id 
    column :name, :label => "Jezik"

    actions
  end


show do
  	attributes_table do
  		row :id
  		row ("Jezik") {jezik.name}

   		panel "Profesori" do
        	table_for jezik.profesors do
          		column "Profesor" do |profesor|
         			link_to profesor.name, [:admin, profesor]   		
            	end
        	end
  		end
    end
end



end
