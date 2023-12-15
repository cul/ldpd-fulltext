# frozen_string_literal: true

module TextCollections::Search
  class NnySidebarComponent < Blacklight::Search::SidebarComponent
    delegate :link_to_nny, to: :helpers
    def initialize(**args)
      super
    end
  end
end