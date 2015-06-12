# -*- encoding : utf-8 -*-
class NnyController < FullTextController
  self.search_params_logic << :controller_fq

  configure_blacklight do |config|
    config.facet_fields['author_ssi'].label = 'Interviewee'
    config.facet_fields.delete('collection_ssim')
  end
end