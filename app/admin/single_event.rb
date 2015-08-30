ActiveAdmin.register SingleEvent do
  csv force_quotes: true, col_sep: ';' do
  column :id
  column ("Naziv") {|event| event.title}
  column ("Početak") {|event| event.start}
  column ("Kraj") {|event| event.end}
  column ("Datum") {|event| event.date}
  column ("Odrzano") {|event| event.odrzano? ? "Da" : "Ne"}
  column ("Profesor") {|event| event.profesor != nil ? event.profesor.name : ""}
  column ("Grupa") {|event| event.group != nil ? event.group.name : ""}
  column ("Učionica") {|event| event.where != nil ? event.where.name : ""}
end

 controller do
  def show
      @ucenik = SingleEvent.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

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

scope("Neodržano predavanje") { |scope| scope.where(odrzano: false)}

menu :label => "Predavanja", :priorty => 5

 index :title => 'Predavanja' do



    selectable_column
    column :id
    column :event
    column :title, :sortable => :title
    column "Početak predavanja", :sortable => :start do |t|
      t.start.strftime("%H:%M")
    end
    column "Kraj predavanja", :sortable => :end do |t|
      t.end.strftime("%H:%M")
    end
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
      row ("Početak predavanja") {single_event.start.strftime("%H:%M")}
      row ("Kraj predavanja") {single_event.end.strftime("%H:%M")}
      row :odrzano
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
