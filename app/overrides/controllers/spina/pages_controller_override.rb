module Spina
  PagesController.class_eval do
    include LocaleHelper

    def show
      page_id = LocaleHelper.strip_locale_prefix(params[:id], params[:locale])
      case(page_id)
      when "about"
        render 'default/pages/about'
      when "events"
        render 'default/pages/events'
      else
        super
      end
    end
  end
end
