ActiveAdmin.register Profesor do

   controller do
  def show
      @ucenik = Profesor.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :verzije, :partial => "layouts/version", :only => :show

menu :label => "Suradnici", :priority => 2




permit_params :name, :OIB, :adresa, :group, :jezik, :radi_za_nas, :komentar,:sudski_tumac,:mobitel,:telefon,:mail,:obrazovanje,:karijerska_pozicija,:inozemno_iskustvo,:datum_rodenja,:mjesto_rodenja,:postanski_broj ,:grad, :racun_banke
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



 form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name, :label => "Ime i prezime"
      f.input :OIB, :label => "OIB"
      f.input :adresa, :label => "Adresa"
  	  f.input :jezik
  	  f.input :radi_za_nas
  	  f.input :komentar
  	  f.input :sudski_tumac
  	  f.input :mobitel
  	  f.input :telefon
  	  f.input :mail
  	  f.input :obrazovanje
  	  f.input :karijerska_pozicija
  	  f.input :inozemno_iskustvo
  	  f.input :datum_rodenja, start_year: 1920, end_year: Time.now.year
  	  f.input :mjesto_rodenja
  	  f.input :grad
  	  f.input :postanski_broj
  	  f.input :racun_banke

  	
      f.actions
    end
  end

index :title => 'Suradnici' do
	selectable_column
	column :name
	column :jezik
	column :radi_za_nas
	column :sudski_tumac
	column "Prebivalište", :grad  
	column :karijerska_pozicija
	column :inozemno_iskustvo
	actions
end

  show do
    attributes_table do
      row :name, :label => "Ime i prezime"
      row :OIB, :label => "OIB"
      row :adresa, :label => "Adresa"
      row :jezik
      row :radi_za_nas
      row :komentar
      row :sudski_tumac
      row :mobitel
      row :telefon
      row :mail
      row :obrazovanje
      row :karijerska_pozicija
      row :inozemno_iskustvo
      row :datum_rodenja, start_year: 1920, end_year: Time.now.year
      row :mjesto_rodenja
      row :grad
      row :postanski_broj
      row :racun_banke
      row :document, :required => false , :as => :file 

      panel "Grupe" do
        table_for profesor.groups do 
          column :name do |group|
           link_to group.name, [:admin, group]
         end
        end
      end
    end
  end

end
