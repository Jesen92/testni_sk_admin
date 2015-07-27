ActiveAdmin.register Ucenik do
 
 

 menu :label => "Ucenici", :priority => 10

permit_params :name, :OIB, :adresa, group_ids: []
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


  index :title => 'Ucenici' do
    selectable_column
    column :id 
    column :name, :sortable => :name
#    column :groups, :sortable => :groups do |group|
#      table_for group.groups.order('name ASC') do
#        column do |group|
#          link_to group.name, [:admin, group]
#        end
#      end
#    end
    column :created_at, :sortable => :created_at
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name, :label => "Ime i prezime"
      f.input :OIB, :label => "OIB"
      f.input :adresa, :label => "Adresa"
      f.input :groups, :as => :check_boxes

      f.actions
    end
  end

show do
    attributes_table do
      row :id
      row :name
      row :OIB
      row :adresa
      row :created_at
      row :updated_at

      panel "Popis grupa" do
        table_for ucenik.groups do 
          column :name do |group|
           link_to group.name, [:admin, group]
         end
        end
      end
    end
  end

end
