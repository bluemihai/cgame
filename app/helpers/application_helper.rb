module ApplicationHelper
  def show_bool(value)
    value ? image_tag('checkmark.png') : image_tag('warning.png')
  end

  def simpler_format(txt)
    return '' if txt.nil?
    txt.gsub(/\n/, '<br>').html_safe
  end

  def default_time(time)
    return '' if time.nil?
    time.strftime('%a %b-%d, %-I:%M %p')
  end

end
