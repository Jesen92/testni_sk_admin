ActiveAdmin.register User do

menu :label => "Korisnici", :priority => 1


controller do
 
  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    super
  end
 
end


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
  permit_params :email, :password, :password_confirmation, :role, :profesor_id
 
 config.clear_sidebar_sections!
 
    index :title => "Korisnici" do 
        selectable_column
        column :profesor, :sortable => :profesor
        column ("Username") {|user| user.email}
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :role
        actions
    end
 
   # filter :email
 
    form do |f|
        f.inputs "User Details" do
            f.input :profesor, :label => "Ime i prezime"
            f.input :email, :label => "Username"
            f.input :password
            f.input :password_confirmation
            f.input :role, as: :radio, collection: {None: "none", Administrator: "admin"}
        end
        f.actions
    end


    show do
    attributes_table do
      row :id
      row :profesor
      row ("Username") {|user| user.email}
      row :current_sign_in_at
      row :last_sign_in_at
      row :created_at
      row :updated_at
      row :role
    end
  end


end
