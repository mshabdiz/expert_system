module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Expert System"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  # Returns the expert system title on a per-action basis.
  def expert_system_title(action)
    base_title = "Expert system"
    if action.empty?
      base_title
    else
      "#{action} #{base_title}"
    end
  end
  # for twi boots flash
  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end
end
