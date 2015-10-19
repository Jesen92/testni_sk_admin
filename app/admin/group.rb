ActiveAdmin.register Group do
csv force_quotes: true, col_sep: ';' do
  column :id
  column ("Naziv tečaja") {|group| group.name}
  column ("Jezik") {|group| group.jezik != nil ? group.jezik.name : ""}
  column ("Razina") {|group| group.nivo != nil ? group.nivo.name : ""}
  column ("Dob") {|group| group.dob != nil ? group.dob.name : ""}
  column :dodatak
  column :location
  column ("Cijena tečaja(kn)") {|group| group.cijena}
end

   controller do
  def show
      @ucenik = Group.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

menu :label => "Grupe", :priority => 4

permit_params :id, :name, :profesor_id, :nivo_id, :jezik_id, :dob_id, :dodatak,:cijena, :location_id
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
    column :jezik, :sortable => :jezik
    column :nivo, :sortable => :nivo
    column :dob, :sortable => :dob
    column ("Cijena") {|group| number_to_currency(group.cijena, :unit => 'Kn', :format => "%n %u")}
    column :dodatak
    column :location
    column :created_at, :sortable => :created_at
    actions
  end

  form do |f|
    f.inputs "Details" do
      
      f.input :jezik
      f.input :dob
      f.input :nivo
      f.input :dodatak
      f.input :location
      f.input :cijena
      f.actions
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row :jezik
      row :nivo
      row :dob
      row :dodatak
      row :location
      row :created_at
      row :updated_at
      row ("Cijena") {|group| number_to_currency(group.cijena, :unit => 'Kn', :format => "%n %u")}
    end
  end

end
