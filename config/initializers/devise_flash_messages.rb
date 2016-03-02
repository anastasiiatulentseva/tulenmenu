Tulenmenu::Application.configure do
  config.after_initialize do
    DeviseController.class_eval do
      def set_flash_message_with_custom_keys(key, kind, options={})
        case key 
          when :notice
            key = :success
          when :alert
            key = :warning
        end 
        options[:scope] = "devise.#{controller_name}"
        options[:default] = Array(options[:default]).unshift(kind.to_sym)
        options[:resource_name] = resource_name
        options = devise_i18n_options(options) if respond_to?(:devise_i18n_options, true)
        message = I18n.t("#{options[:resource_name]}.#{kind}", options)
        flash[key] = message if message.present?
      end 
      alias_method_chain :set_flash_message, :custom_keys
    end 

    Devise::FailureApp.class_eval do
      def recall_with_custom_flash_keys
        env["PATH_INFO"]  = attempted_path
        flash.now[:warning] = i18n_message(:invalid)
        self.response = recall_app(warden_options[:recall]).call(env)
      end 
      alias_method_chain :recall, :custom_flash_keys

      def redirect_with_custom_flash_keys
        store_location!
        if flash[:timedout] && flash[:warning]
          flash.keep(:timedout)
          flash.keep(:warning)
        else
          flash[:warning] = i18n_message
        end 
        redirect_to redirect_url
      end 
      alias_method_chain :redirect, :custom_flash_keys
    end 
  end 
end