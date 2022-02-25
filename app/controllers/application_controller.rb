class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
  include Blacklight::Controller

  layout 'blacklight'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # from Blacklight::BlacklightHelperBehavior, but we delegate to controllers
  def application_name
    Rails.cache.fetch 'blacklight/application_name' do
      t('blacklight.application_name',
        default: t('blacklight.application_name', locale: I18n.default_locale))
    end
  end
end
