module FacetsHelper
  include Blacklight::FacetsHelperBehavior
  def should_render_facet? display_facet
    # display when show is nil or true
    facet_config = facet_configuration_for_field(display_facet.name)
    display = should_render_field?(facet_config, display_facet)
    display &&= facet_field_in_params? facet_config.after if facet_config.after
    return display && display_facet.items.present?
  end
end