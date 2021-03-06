module SimpleForm
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy SimpleForm default files"
      source_root File.expand_path('../templates', __FILE__)
      class_option :template_engine

      def copy_initializers
        copy_file 'simple_form.rb', 'config/initializers/simple_form.rb'
      end

      def copy_locale_file
        copy_file 'en.yml', 'config/locales/simple_form.en.yml'
      end
      
      def copy_index_files
        engine = options[:template_engine]
        copy_file "index.html.#{engine}", "lib/templates/#{engine}/scaffold/index.html.#{engine}"
        copy_file "_row.html.#{engine}", "lib/templates/#{engine}/scaffold/_row.html.#{engine}"
      end
      
      def copy_alternative_show_file
        engine = options[:template_engine]
        copy_file "show.html.#{engine}", "lib/templates/#{engine}/scaffold/show.html.#{engine}"
      end
        

      def copy_scaffold_template
        engine = options[:template_engine]
        copy_file "_form.html.#{engine}", "lib/templates/#{engine}/scaffold/_form.html.#{engine}"
      end
    end
  end
end
