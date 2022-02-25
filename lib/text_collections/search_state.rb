module TextCollections
  class SearchState < Blacklight::SearchState
    def url_for_document(doc, options = {})
      a = doc['url_ssi'].split('//')
      "#{a[0]}//#{a[1..-1].join('/')}"
    end
  end
end