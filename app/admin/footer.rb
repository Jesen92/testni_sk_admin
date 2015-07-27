module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"                                                    
        super :style => "text-align: center;"                                     

        div do                                                                   
          para "Copyright &copy; #{Date.today.year.to_s} #{link_to('Frontend', home_path)}".html_safe                                     
        end
      end

    end
  end
end