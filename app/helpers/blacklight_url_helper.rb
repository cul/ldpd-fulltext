# frozen_string_literal: true
module BlacklightUrlHelper
  include Blacklight::UrlHelperBehavior

  def link_to_nny(name,ny)
    link_to name, "http://www.columbia.edu/cu/lweb/digital/collections/nny/#{ny}/index.html"
  end

  # Override to remove session intercepts since links aren't local
  def document_link_params(doc, opts)
    params = session_tracking_params(doc, opts[:counter]).deep_merge(opts.except(:label, :counter))
    params[:data].delete(:'context-href')
    params
  end
end