module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"                                                    
        super :style => "text-align: center;"                                     

        div do                                                                   
          para " <h1>#{link_to('Frontend', home_path)}</h1> Copyright &copy; #{Date.today.year.to_s}".html_safe                                     
        end
      end

    end
  end
end