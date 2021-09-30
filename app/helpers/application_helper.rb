module ApplicationHelper
  def timestamp_to_words(timestamp)
    "#{time_ago_in_words(timestamp).gsub('about', '')} ago"
  end
end
