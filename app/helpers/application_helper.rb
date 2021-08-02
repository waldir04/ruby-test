module ApplicationHelper
  def title(string_value)
    string_value.split.map(&:capitalize).join(' ')
  end
end
