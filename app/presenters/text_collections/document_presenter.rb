module TextCollections
  class DocumentPresenter < Blacklight::DocumentPresenter
    def render_document_index_label field, opts ={}
      "#{@document['title_ssi']}, page #{@document['page_num_ssi']}"
    end
  end
end