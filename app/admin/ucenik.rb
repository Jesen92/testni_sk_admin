ActiveAdmin.register Ucenik do
 
 controller do
  def show
      @ucenik = Ucenik.includes(versions: :item).find(params[:id])
      @versions = @ucenik.versions 
      @ucenik = @ucenik.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
  end
end
  sidebar :versionate, :partial => "layouts/version", :only => :show
 

 menu :label => "Učenici", :priority => 10

permit_params :name, :OIB, :email, :tel, :parents_name, :adresa, :fee, :fee_to_pay, :br_rata, :placanje_na_rate, :prvi_mj_placanja, group_ids: [], book_ids: [], ucenik_books_attributes: [:id, :paid]

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

  member_action :history do
    @ucenik = Ucenik.find(params[:id])
    @versions = @ucenik.versions
    render "layouts/history"
  end


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
    end

    f.inputs "Plaćanje na rate" do
      f.input :placanje_na_rate, :label => "Plaćanje na rate"
      f.input :prvi_mj_placanja, :label => "Mjesec prve uplate", :as => :datepicker
      f.input :br_rata, :label => "Broj rata"


      end 

       ucenik.books.each do |book|
        @books.unshift(book.title)
       end

      f.inputs do
        f.has_many :ucenik_books, heading: "Plaćeni udžbenik", new_record: false  do |a|
            a.input :paid, :label => @books.pop
        end
      end
     # panel "Plaćeni udžbenik" do
     #   ucenik.ucenik_books.each do |book|
     #     f.input book.placeno
     #   end
     # end


      f.actions

  end



show do
  @placeno = Array.new
    attributes_table do
      row :id
      row("Ime i prezime") {ucenik.name}      
      row :OIB
      row ("Ime roditelja") {ucenik.parents_name}
      row ("e-mail") {ucenik.email}
      row ("Broj telefona/mobitela") {ucenik.tel}
      row ("Adresa") {ucenik.adresa}
      row ("Ukupno za platiti") {ucenik.fee}
      row ("Preostalo za platiti") {ucenik.fee_to_pay}
      row ("Plaćanje na rate") {ucenik.placanje_na_rate}
      row ("Broj rata") {ucenik.br_rata}
      row ("Mjesec prve rate") {ucenik.prvi_mj_placanja}
      row ("Kreiran") {ucenik.created_at}
      row ("Izmijenjen") {ucenik.updated_at}

      panel "Popis grupa" do
        table_for ucenik.groups do 
          column "Naziv" do |group|
           link_to group.name, [:admin, group]
         end
        end
      end

      ucenik.ucenik_books.each do |book|
        @placeno.unshift(book.paid)
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
        table_for ucenik.payments.order('date ASC') do
          column "Grupa" do |pay|
            pay.group.name
          end

          column "Mjesec" do |pay|
            link_to pay.date.strftime(" %m.%Y. "), [:admin, pay]
          end
  
          column "Plaćeno" do |pay|
            pay.uplaceno? ? "Da" : "Ne"
          end

          column "Uplata(kn)" do |pay|
            pay.uplata? ? pay.uplata : "---"
          end
        end
      end



  end
  end

end
