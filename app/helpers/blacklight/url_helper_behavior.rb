require 'deprecation'
##
# URL helper methods
module Blacklight::UrlHelperBehavior
  extend Deprecation
  self.deprecation_horizon = 'blacklight 6.0'

  ##
  # Link to the previous document in the current search context
  def link_to_previous_document(previous_document)
    link_opts = session_tracking_params(previous_document, search_session['counter'].to_i - 1).merge(:class => "previous", :rel => 'prev')
    link_to_unless previous_document.nil?, raw(t('views.pagination.previous')), url_for_document(previous_document), link_opts do
      #byebug
      dtype = previous_document ? previous_document[:doctype] : "bib"
      sfx = dtype == "cres" ? " Course" : ""
      content_tag :span, raw(t('views.pagination.previous') + sfx), :class => 'previous'
    end
  end

  ##
  # Link to the next document in the current search context
  def link_to_next_document(next_document)
    link_opts = session_tracking_params(next_document, search_session['counter'].to_i + 1).merge(:class => "next", :rel => 'next')
    link_to_unless next_document.nil?, raw(t('views.pagination.next')), url_for_document(next_document), link_opts do
      #byebug
      dtype = next_document ? next_document[:doctype] : "bib"
      sfx = dtype == "cres" ? " Course" : ""
      content_tag :span, raw(t('views.pagination.next') + sfx), :class => 'next'
    end
  end

end
