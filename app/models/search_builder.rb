class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior

  self.default_processor_chain += [:groups_logic, :controller_fq]

  def controller_fq(chain_params)
    puts "blacklight_params[:controller]: #{blacklight_params[:controller]}"
    if blacklight_params[:controller] != 'full_text'
      chain_params[:fq] ||= []
      chain_params[:fq] << "collection_ssim:\"#{blacklight_params[:controller]}\""
    end
  end

  def groups_logic(chain_params)
    collection = blacklight_params.fetch(:f, {}) ['collection_ssim'] || []
    case collection[0]
    when 'columns'
      # Library Columns has no author, so can only group by title
      unless blacklight_params.fetch(:f,[]).include?('title_ssi')
        chain_params[:'group.field'] = 'title_ssi'
      end
    when 'nny'
      # NNY should group by author, then by interview_num? title?
      if blacklight_params.fetch(:f,[]).include?('author_ssi')
        unless blacklight_params.fetch(:f,[]).include?('title_ssi')
          chain_params[:'group.field'] = 'title_ssi'
        end
      else
        chain_params[:'group.field'] = 'author_ssi'
      end
    else
      # generally group by author, then by title_ssi
      if blacklight_params.fetch(:f,[]).include?('author_ssi')
        unless blacklight_params.fetch(:f,[]).include?('title_ssi')
          chain_params[:'group.field'] = 'title_ssi'
        end
      else
        chain_params[:'group.field'] = 'author_ssi'
      end
    end
    if chain_params[:'group.field']
      chain_params[:group] = true
      # set this to true to paginate by groups instead of by items
      chain_params[:'group.ngroups'] = true
    end
  end
end
