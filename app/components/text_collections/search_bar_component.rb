# frozen_string_literal: true

module TextCollections
  class SearchBarComponent < Blacklight::SearchBarComponent
    def initialize(**args)
      super
      @classes << 'w-100' unless  @classes.include?('w-100')
    end
  end
end