class DatePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group date datepicker') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_table
    end
  end

  def input_html_options
    value = @builder.object.send(attribute_name)  if object.respond_to? attribute_name
    value = case value
                       when Date, Time, DateTime
                         I18n.localize(value)
                       else
                         value.to_s
                     end
    # I18n.localize(value) if value.present?
    {class: 'form-control', value: value, data: { provide: 'datepicker' }}
  end

  def span_remove
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_remove
    end
  end

  def span_table
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_table
    end
  end

  def icon_remove
    "<i class='glyphicon glyphicon-remove'></i>".html_safe
  end

  def icon_table
    "<i class='glyphicon glyphicon-th'></i>".html_safe
  end

end