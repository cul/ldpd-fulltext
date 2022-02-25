module TextCollections
  class SearchState < Blacklight::SearchState
    def url_for_document(doc, options = {})
      a = doc['url_ssi'].split('//')
      "#{a[0]}//#{a[1..-1].join('/')}"
    end

    # Deprecations in BL7
    def add_facet_params_and_redirect(field, item)
      new_params = filter(field).add(item).params

      # Delete any request params from facet-specific action, needed
      # to redir to index action properly.
      request_keys = blacklight_config.facet_paginator_class.request_keys
      new_params.extract!(*request_keys.values)

      new_params
    end
  end
end