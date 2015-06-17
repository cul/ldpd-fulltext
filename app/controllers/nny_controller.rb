# -*- encoding : utf-8 -*-
class NnyController < FullTextController
  self.search_params_logic << :controller_fq

  configure_blacklight do |config|
    config.facet_fields['author_ssi'].label = 'Interviewee'
    config.facet_fields.delete('collection_ssim')
    config.add_facet_field 'interview_num_ssi',
     sort: 'index', after:'author_ssi', limit: true, label: 'Interview',
     solr_params: { 'facet.mincount' => 1 }
    config.add_facet_field 'session_num_isi',
     sort: 'index', after:'interview_num_isi', limit: false, label: 'Session',
     solr_params: { 'facet.mincount' => 1 }
    #config.add_facet_field 'interviewee', pivot: ['author_ssi', 'interview_num_ssi'],
    #  label: 'Interviewee', sort: 'index'
    config.index_fields['author_ssi'].label = 'Interviewee'
  end
end