ActiveAdmin.register SingleEvent do

permit_params :odrzano, :title,:start, :ucenik_events, :end, :br_pred, :ucenik_id, :date, :where_id, :profesor_id, :group_id, :event_id, ucenik_ids: []
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


config.clear_action_items!

config.per_page = 20

config.sort_order = 'date_asc'

menu :label => "Predavanja", :priorty => 5

 index :title => 'Predavanja' do
    selectable_column
    column :id
    column :event
    column :title, :sortable => :title
    column :start, :sortable => :start
    column :end, :sortable => :end
    column :date
    column :odrzano
    column :where
    column :profesor
    column :group
    column :created_at
    actions
  end


  show do
    attributes_table do
      row :id
      row :title
      row :profesor
      row :group
      row :where
      row :start
      row :end
      row :date
      row :created_at
      row :updated_at

      panel "Prisutni učenici" do
        table_for single_event.uceniks do 
          column :name do |ucenik|
           link_to ucenik.name, [:admin, ucenik]
         end
        end
      end
      #row :recurring_rule





      
    end
  end


  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Title"
      f.input :profesor, :label => "Profesor"
      f.input :start, :label => "Vrijeme početka:", :as => :time_picker
      f.input :end, :label => "Vrijeme završetka:", :as => :time_picker
      f.input :where, :label => "Mjesto predavanja",  :as => :select
      f.input :date, :label => "Datum:", :as => :datepicker
      f.input :odrzano, :label => "Odrzano"

      panel "Prisutnost učenika" do
      	f.input :uceniks,:label => "", :as => :check_boxes , :collection => Ucenik.includes(:groups).where(:groups => {:id => single_event.group_id})

  	  end
      end
     # f.inputs "Ponavljanje" do
     #   f.input :recurring_rule, :as=> :select, :input_html => { :class => 'recurring_select'}, :collection => options_for_select([[ "- not recurring -" , "null"],["Set schedule..." , "custom" ]], [ "- not recurring -" , "null"])
     # end
      f.actions
  end

end
