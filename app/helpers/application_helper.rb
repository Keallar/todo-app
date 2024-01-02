module ApplicationHelper
  def notice_type(type)
    case type
    when 'error'
      'danger'
    when 'success'
      'success'
    else
      'primary'
    end
  end
end
