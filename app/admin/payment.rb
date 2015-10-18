ActiveAdmin.register Payment do
csv force_quotes: true, col_sep: ';' do
  column :id
  column ("Naziv") {|pay| pay.title}
  column ("Učenik") {|pay| pay.ucenik.name}
  column ("Grupa") {|pay| pay.group.name}
  column ("Uplaćeno") {|pay| pay.uplaceno? ? "Da" : "Ne"}
  column ("Datum") {|pay| pay.date}
  column ("Rata") {|pay| pay.default_uplata}
end

     controller do
  def show
      @ucenik = Payment.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

menu :label => "Plaćanje", :priority => 12

permit_params :uplaceno, :uplata, :date
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


  index :title => "Plaćanje" do
    selectable_column
    column :id 
    column :date, :sortable => :date
    column :default_date, :sortable => :default_date
    column :ucenik
    column :group, :sortable => :level
    column :uplaceno
    column :uplata
    column :created_at, :sortable => :created_at

    actions
  end

	form do |f|
		f.inputs "Details" do
		  f.input :date, :label => "Datum", :as => :datepicker
		  f.input :uplaceno, :label => "Plaćeno"
		  f.input :uplata, :label => "Uplata(kn)"


		  end

		  f.actions
	end

end
