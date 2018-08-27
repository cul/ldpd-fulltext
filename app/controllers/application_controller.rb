class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
  include Blacklight::Controller
  # monkey patch Blacklight FacetField to account for bug when ngroups is false
  Blacklight::Solr::Response::Facets::FacetField.class_eval do
    def length
      @items.length
    end
  end
  layout 'blacklight'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
