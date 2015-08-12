ActiveAdmin.register Message do

     controller do
  def show
      @ucenik =Message.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

menu :label => "Obavijesti", :priority => 10

permit_params :title, :body, :profesor
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

index :title => 'Obavijesti' do
    selectable_column
    column :id
    column :title, :sortable => :title
    column :profesor
    column :created_at, :sortable => :created_at

    actions
  end

form do |f|
	f.inputs "Nova obavijest" do
	  f.input :title, :label => "Naziv"
	  f.input :body, :label => "Tekst obavijesti"
	  f.actions
	end
end

end
