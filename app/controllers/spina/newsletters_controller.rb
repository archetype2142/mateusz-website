module Spina
  class NewslettersController < ApplicationController
    def create
      # TODO: Implement newsletter signup handling
      redirect_back(fallback_location: main_app.root_path, notice: 'Thank you for subscribing!')
    end
  end
end
