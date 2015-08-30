ActiveAdmin.register NoviUcenik do
csv force_quotes: true, col_sep: ';' do
	column :id
	column ("Ime i prezime") {|ucenik| ucenik.name}
	column ("Ime i prezime roditalje") {|ucenik| ucenik.parents_name}
	column :mjesto
	column :jezik
	column :vrsta_tecaja
	column :tel
	column :email
	column :comment
end

menu :label => "Android prijave", :priority => 2

permit_params :id, :name, :parents_name, :jezik, :vrsta_tecaja, :mjesto, :email, :tel, :comment, :created_at, :updated_at
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

index :title => 'Android prijave' do
	selectable_column
 	column :id
	column :name
	column "Ime roditelja",:parents_name
	column :jezik
	column :vrsta_tecaja
	column :mjesto
	actions
end

end
