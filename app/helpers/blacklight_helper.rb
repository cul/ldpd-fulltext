module BlacklightHelper
  include Blacklight::BlacklightHelperBehavior
  def document_has_value? document, field_config
    document.has?(field_config.field) ||
#      (document.has_highlight_field? field_config.field if field_config.highlight) ||
      field_config.accessor
  end
  def only_if_q(config, *args)
    args.each {|arg| puts arg }
    params.include? :q
  end
end