ActiveAdmin.register Event do
 controller do
  def show
      @ucenik = Event.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

menu :label => "Tečajevi", :priority => 3

csv do
  column :id
  column :title
  column :start
  column :end
  column :start_date
  column :where
  column :profesor
end

 index :title => 'Tečajevi' do
    selectable_column
    column :id
    column :title, :sortable => :title
    column :start, :sortable => :start_time
    column :end, :sortable => :end_time
    column :start_date
    column :where


    column :profesor
    column :group
    column :created_at
    actions
  end




permit_params :title,:start, :end, :br_pred, :dodatak,:skolska_god_id, :polje_id, :start_date, :single_event, :end_date, :allDay, :where_id, :profesor_id, :repeat, :repeat_until, :group_id, :recurring_rule, day_ids: []
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


show do
    attributes_table do
      row :id
      row :title
      row :skolska_god
      row :polje
      row :dodatak
      row :profesor
      row :group
      row :where
      row :start
      row :end
      row :start_date
      #row :recurring_rule



      row :created_at
      row :updated_at

      panel "Popis grupa" do
        table_for event.single_events do 

          column "Naziv" do |e|
            link_to e.title, [:admin, e]
          end

          column "Datum" do |e|
            link_to e.date, [:admin, e]
          end

          column "Vrijeme predavanja" do |e|
            e.start+" - "+e.end
          end

          column "Profesor" do |e|
            link_to e.profesor.name, [:admin, e.profesor]
          end

          column "Predavaonica" do |e|
            link_to e.where.name, [:admin, e.where]
          end

        end
      end
      
    end
  end

  sidebar "Tjedno se ponavlja:", only: [:show], if: proc{event.repeat?} do
    table_for event.days do 
          column "Dani ponavljanja", :name do |day|
           day.name
      end
    end

    table_for event do
      column "Broj predavanja",:br_pred 
    end 
  end


  form do |f|
    f.inputs "Details" do
      f.input :profesor, :label => "Profesor"
      f.input :group, :label => "Grupa"
      f.input :skolska_god, :label => "Školska godina"
      f.input :polje
      f.input :dodatak
      f.input :start, :label => "Vrijeme početka:", :as => :time_picker, :required => true
      f.input :end, :label => "Vrijeme završetka:", :as => :time_picker, :required => true
      f.input :where, :label => "Mjesto predavanja",  :as => :select


      f.input :start_date, :label => "Datum početka:", :as => :datepicker, :required => true

      f.input :repeat,:label => "Tjedno Ponavljanje:" 
      f.input :br_pred, :label => "Broj predavanja"
      f.input :days, :label => "Dani ponavljanja:", :as => :check_boxes

      end
     # f.inputs "Ponavljanje" do
     #   f.input :recurring_rule, :as=> :select, :input_html => { :class => 'recurring_select'}, :collection => options_for_select([[ "- not recurring -" , "null"],["Set schedule..." , "custom" ]], [ "- not recurring -" , "null"])
     # end
      f.actions
  end

end
