ActiveAdmin.register Where do
  csv force_quotes: true, col_sep: ';' do
    column :id
    column :name
    column ("Adresa") {|where| where.adress}
  end

   controller do
  def show
      @ucenik = Where.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

permit_params :name, :adress
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

menu :label => "Učionice", :priorty => 6

 index :title => 'Učionice' do
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
