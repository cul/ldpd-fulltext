module FacetsHelper
  include Blacklight::FacetsHelperBehavior

  def translate_collection facet_value
  	key = "ldpd.collection.#{facet_value}"
  	t key
  end
end