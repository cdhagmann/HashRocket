# frozen_string_literal: true

module ApplicationHelper
  include ActionView::Helpers::Tags
  include ActionView::Helpers::TagHelper

  def timestamp_to_words(timestamp)
    "#{time_ago_in_words(timestamp).gsub('about', '')} ago"
  end

  def fa_icon(icon)
    tag.i(class: icon)
  end
end
