module ApplicationHelper
  def show_nav_link(models)
    link_params = [models.titleize, send("#{models}_path")]
    link_params << { :id => 'active-nav-link' } if controller_name == models
    link_to(*link_params)
  end

  def prop(key)
    Property.find_by_key(key).try(:value)
  end

  def to_textile(text)
    content = RedCloth.new(text.to_s)
    content.filter_html = true
    content.to_html.html_safe
  end
end
