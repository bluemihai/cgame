module ApplicationHelper
  def show_bool(value)
    value ? image_tag('checkmark_png') : image_tag('warning.png')
  end

end
