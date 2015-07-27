ActiveAdmin.register Group do

menu :label => "Grupe", :priority => 4

permit_params :id, :name, :profesor_id, :level
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




  index :title => "Grupe" do
    selectable_column
    column :id 
    column :name, :sortable => :name
    column :profesor, :sortable => :profesor
    column :created_at, :sortable => :created_at
    column :level, :sortable => :level
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name, :label => "Name"
      f.input :profesor, :label => "Profesor"
      f.input :level, :label => "Level"
      f.actions
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row :profesor
      row :level
      row :created_at
      row :updated_at

      panel "Popis učenika" do
        table_for group.uceniks do 
          column :name do |ucenik|
           link_to ucenik.name, [:admin, ucenik]
         end
        end
      end
    end
  end

end
