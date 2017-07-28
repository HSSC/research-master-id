module ApplicationHelper

  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", alert: "alert-danger", notice: "alert-success" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def display_research_type(type, billable)
    if type == 'basic_science_research'
      return 'Basic Science Research'
    elsif billable && (type == 'clinical_research')
      return 'Clinical Science (Billable)'
    elsif !billable && (type == 'clinical_research')
      return 'Clinical Science (Non-billable)'
    end
  end

  def display_musc_health_services(type)
    if type == 'clinical_research'
      return { style: 'display:block' }
    else
      return { style: 'display:none;' }
    end
  end
end
