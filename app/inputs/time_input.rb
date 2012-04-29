class TimeInput < SimpleForm::Inputs::TimeInput
  def input
    "<div>#{super}</div>".html_safe
  end
end