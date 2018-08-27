# -*- encoding : utf-8 -*-
class NnyController < FullTextController
  self.search_params_logic << :controller_fq

  configure_blacklight do |config|
    config.facet_fields['author_ssi'].label = 'Interviewee'
    config.facet_fields.delete('collection_ssim')
    config.facet_fields['interview_num_ssi'].if = true
    config.facet_fields['interview_num_ssi'].sort = 'index'
    config.facet_fields['interview_num_ssi'].after = 'author_ssi'
    config.facet_fields['interview_num_ssi'].limit = true
    config.facet_fields['interview_num_ssi'].solr_params = { 'facet.mincount' => 1 }
    config.add_facet_field 'session_num_isi',
     sort: 'index', after:'interview_num_ssi', limit: false, label: 'Session',
     solr_params: { 'facet.mincount' => 1 }
    #config.add_facet_field 'interviewee', pivot: ['author_ssi', 'interview_num_ssi'],
    #  label: 'Interviewee', sort: 'index'
    config.index_fields['author_ssi'].label = 'Interviewee'
  end
end