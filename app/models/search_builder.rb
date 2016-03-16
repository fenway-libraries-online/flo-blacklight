class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior
  def reserves_filter(solr_parameters = {})
    ### solr_parameters[:fq] ||= []
    ### solr_parameters[:fq] << "doctype:cres"
  end
  def nonreserves_filter(solr_parameters = {})
    ### solr_parameters[:fq] ||= []
    ### solr_parameters[:fq].delete("doctype:cres")
  end
end
