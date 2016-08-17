module ApplicationHelper
  def show_nav_link(models)
    style = 'font-weight: bold; font-size: medium; text-decoration: none;'
    if controller_name == models
      link_to models.titleize, send("#{models}_path"), :style => style
    else
      link_to models.titleize, send("#{models}_path")
    end
  end

  def property(property)
    Property.find_by_key(property).try(:value) || property
  end
end
