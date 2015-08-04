ActiveAdmin.register Ucenik do
 
 

 menu :label => "Učenici", :priority => 10

permit_params :name, :OIB, :adresa, group_ids: []
permit_params book_ids: []
permit_params ucenik_books: []
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


  index :title => 'Učenici' do
    selectable_column
    column :id 
    column :name, :sortable => :name
#    column :groups, :sortable => :groups do |group|
#      table_for group.groups.order('name ASC') do
#        column do |group|
#          link_to group.name, [:admin, group]
#        end
#      end
#    end
    column :created_at, :sortable => :created_at
    actions
  end

  form do |f|

      @books = Array.new
      @i = 0

    f.inputs "Details" do
      f.input :name, :label => "Ime i prezime"
      f.input :OIB, :label => "OIB"
      f.input :adresa, :label => "Adresa"
      f.input :parents_name, :label => "Ime roditelja"
      f.input :email, :label => "e-mail"
      f.input :tel, :label => "Broj telefona/mobitela"
      f.input :groups, :label => "Grupe", :as => :check_boxes
      f.input :books, :label => "Udžbenici", :as => :check_boxes

       ucenik.books.each do |book|
        @books.unshift(book.title)
       end

      f.has_many :ucenik_books, heading: "Plaćeni udžbenik", new_record: false  do |a|

          a.input :placeno, :label => @books.pop

      end

     # panel "Plaćeni udžbenik" do
     #   ucenik.ucenik_books.each do |book|
     #     f.input book.placeno
     #   end
     # end


      f.actions
    end
  end



show do
  @placeno = Array.new
    attributes_table do
      row :id
      row :name
      row :OIB
      row :parents_name
      row :email
      row :tel
      row :adresa
      row :created_at
      row :updated_at

      panel "Popis grupa" do
        table_for ucenik.groups do 
          column :name do |group|
           link_to group.name, [:admin, group]
         end
        end
      end

      ucenik.ucenik_books.each do |book|
        @placeno.unshift(book.placeno)
      end

      panel "Popis udžbenika" do
        table_for ucenik.books do
          column :title do |book|
            link_to book.title, [:admin, book]
          end
          column "Plaćeno" do |book|
            (@placeno.pop) == true ? "Da" : "Ne"
          end
        end
      end
    end
  end

end
