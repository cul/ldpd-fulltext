module ApplicationHelper
  include Blacklight::CatalogHelperBehavior
  include Blacklight::UrlHelperBehavior
  ##
  # Standard display of a facet value in a list. Used in both _facets sidebar
  # partial and catalog/facet expanded list. Will output facet value name as
  # a link to add that to your restrictions, with count in parens.
  #
  # @param [Blacklight::SolrResponse::Facets::FacetField]
  # @param [String] facet item
  # @param [Hash] options
  # @option options [Boolean] :suppress_link display the facet, but don't link to it
  # @return [String]
  def render_facet_value(facet_field, item, options ={})
    path = search_action_path(add_facet_params_and_redirect(facet_field, item))
    content_tag(:span, :class => "facet-label") do
      link_to_unless(options[:suppress_link], facet_display_value(facet_field, item), path, :class=>"facet_select")
    end + render_facet_count(item.hits)
  end
  ##
  # Standard display of a SELECTED facet value (e.g. without a link and with a remove button)
  # @params (see #render_facet_value)
  def render_selected_facet_value(facet_field, item)
    content_tag(:span, :class => "facet-label") do
      content_tag(:span, facet_display_value(facet_field, item), :class => "selected") +
      # remove link
      link_to(content_tag(:span, '', :class => "glyphicon glyphicon-remove") + content_tag(:span, '[remove]', :class => 'sr-only'), search_action_path(remove_facet_params(facet_field, item, params)), :class=>"remove")
    end + render_facet_count(item.hits, :classes => ["selected"])
  end

  ##
  # Renders a count value for facet limits. Can be over-ridden locally
  # to change style. And can be called by plugins to get consistent display. 
  #
  # @param [Integer] number of facet results
  # @param [Hash] options
  # @option options [Array<String>]  an array of classes to add to count span.
  # @return [String]
  def render_facet_count(num, options = {})
    classes = (options[:classes] || []) << "facet-count"
    content_tag("span", t('blacklight.search.facets.count', :number => number_with_delimiter(num)), :class => classes)
  end

  def doc_title(doc, *args)
    "#{doc["title_ssi"]} #{doc["page_num_ssi"]}"
  end
end
