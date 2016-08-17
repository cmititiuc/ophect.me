module ApplicationHelper
  def show_nav_link(models)
    style = 'font-weight: bold; font-size: medium; text-decoration: none;'
    link_params = [models.titleize, send("#{models}_path")]
    link_params << { :style => style } if controller_name == models
    link_to(*link_params)
  end

  def property(property)
    Property.find_by_key(property).try(:value)
  end
end
