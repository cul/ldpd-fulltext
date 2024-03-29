# -*- encoding : utf-8 -*-
class FullTextController < ApplicationController  
  include Blacklight::Catalog

  layout Proc.new { |controller| controller.controller_name }

  self.search_state_class = TextCollections::SearchState

  def only_if_q(config, *args)
    params.include? :q
  end

  def application_name
    'Digital Collections Transcript Search'
  end

  configure_blacklight do |config|
    config.navbar.partials = {}
    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    config.default_solr_params = {
      defType: 'edismax',
      qf: 'all_text_tsimv',
      q: '*',
      :'q.alt' => '*:*',
      :hl => true,
      :'hl.fl' => 'all_text_tsimv',
      :rows => 10
    }

    # solr path which will be added to solr base url before the other solr params.
    #config.solr_path = 'select' 
    
    # items to show per page, each number in the array represent another option to choose from.
    #config.per_page = [10,20,50,100]
    config.default_per_page = 20
    ## Default parameters to send on single-document requests to Solr. These settings are the Blackligt defaults (see SearchHelper#solr_doc_params) or
    ## parameters included in the Blacklight-jetty document requestHandler.
    #
    #config.default_document_solr_params = {
    #  :qt => 'document',
    #  ## These are hard-coded in the blacklight 'document' requestHandler
    #  # :fl => '*',
    #  # :rows => 1
    #  # :q => '{!raw f=id v=$id}' 
    #}

    # solr field configuration for search results/index views
    config.index.title_field = 'title_display'
    config.index.display_type_field = 'format'

    # solr field configuration for document/show views
    #config.show.title_field = 'title_display'
    #config.show.display_type_field = 'format'

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.    
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or 
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.  
    #
    # :show may be set to false if you don't want the facet to be drawn in the 
    # facet bar
    config.add_facet_field 'collection_ssim', label: 'Collection',
      helper_method: :translate_collection, solr_params: { 'facet.mincount' => 1 }
    config.add_facet_field 'author_ssi', label: 'Author', limit: 10, solr_params: { 'facet.mincount' => 1, 'facet.missing' => false }
    config.add_facet_field 'basename_ssi', :label => 'Work Id', if: false
    config.add_facet_field 'title_ssi', :label => 'Title', if: false
    config.add_facet_field 'interview_num_ssi', :label => 'Interview', if: false


    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display 
    config.add_index_field 'title_ssi', :label => 'Title', if: true
    config.add_index_field 'author_ssi', :label => 'Author', if: false
    config.add_index_field 'page_num_ssi', :label => 'Page Number', if: false
    config.add_index_field 'interview_num_ssi', :label => 'Interview', if: false
    config.add_index_field 'imprint_ssi', :label => 'Imprint'
    config.add_index_field 'all_text_tsimv', highlight: 'all_text_tsimv',
     label: 'Text Match', if: :only_if_q

    config.index.presenter_class = TextCollections::DocumentPresenter
    config.index.document_actions.delete(:bookmark) # no bookmarks!
    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display 
    config.add_show_field 'title_display', :label => 'Title'
    config.add_show_field 'title_vern_display', :label => 'Title'
    config.add_show_field 'subtitle_display', :label => 'Subtitle'
    config.add_show_field 'subtitle_vern_display', :label => 'Subtitle'
    config.add_show_field 'author_display', :label => 'Author'
    config.add_show_field 'author_vern_display', :label => 'Author'
    config.add_show_field 'format', :label => 'Format'
    config.add_show_field 'url_fulltext_display', :label => 'URL'
    config.add_show_field 'url_suppl_display', :label => 'More Information'
    config.add_show_field 'language_facet', :label => 'Language'
    config.add_show_field 'published_display', :label => 'Published'
    config.add_show_field 'published_vern_display', :label => 'Published'
    config.add_show_field 'lc_callnum_display', :label => 'Call number'
    config.add_show_field 'isbn_t', :label => 'ISBN'

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different. 

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise. 
    
    #config.add_search_field 'all_text_timv', :label => 'Keywords'
    

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc, sort_title_ssi asc, page_num_isi asc', :label => 'relevance'
    config.add_sort_field 'sort_author_ssi asc, sort_title_ssi asc, page_num_isi asc', :label => 'author'
    config.add_sort_field 'sort_title_ssi asc,  page_num_isi asc, sort_author_ssi asc', :label => 'title'

    # If there are more than this many search results, no spelling ("did you 
    # mean") suggestion is offered.
    config.spell_max = 5
  end

  def self.local_prefixes
    super + ['catalog']
  end
end
