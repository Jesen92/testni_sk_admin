ActiveAdmin.register Ucenik do
 
 

 menu :label => "Učenici", :priority => 10

permit_params :name, :OIB, :tel, :adresa, :fee, :fee_to_pay, :br_rata ,:placanje_na_rate,:prvi_mj_placanja, group_ids: [], book_ids: [], ucenik_books: []

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
      f.input :name, :label => "Ime i prezime", :required => true
      f.input :OIB, :label => "OIB"
      f.input :adresa, :label => "Adresa", :required => true
      f.input :parents_name, :label => "Ime roditelja"
      f.input :email, :label => "e-mail"
      f.input :tel, :label => "Broj telefona/mobitela", :required => true
      f.input :groups, :label => "Grupe", :as => :check_boxes
      f.input :books, :label => "Udžbenici", :as => :check_boxes
      f.input :fee, :label => "Ukupno za platiti"
      f.input :fee_to_pay, :label => "Preostalo za platiti"

      f.input :placanje_na_rate, :label => "Plaćanje an rate"
      f.input :prvi_mj_placanja, :label => "Mjesec prve uplate", :as => :datepicker
      f.input :br_rata, :label => "Broj rata"

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
      row :fee
      row :fee_to_pay
      row :placanje_na_rate
      row :br_rata
      row :prvi_mj_placanja

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
          column "Naziv" do |book|
            link_to book.title, [:admin, book]
          end
          column "Plaćeno" do |book|
            (@placeno.pop) == true ? "Da" : "Ne"
          end
        end
      end

      panel "Uplate" do
        table_for ucenik.payments do
          column "Mjesec" do |pay|
            link_to pay.date.strftime(" %m.%Y. "), [:admin, pay]
          end
          column "Plaćeno" do |pay|
            pay.uplaceno? ? "Da" : "Ne"
          end
        end
      end
    end
  end

end
