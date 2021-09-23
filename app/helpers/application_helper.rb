module ApplicationHelper
  def header_link_item(name, path)
    class_name = 'nav-item navbar-brand mb-0 h1 font-weight-bold mr-auto'
    class_name << ' active' if current_page?(path)

    link_to name, path, class: class_name
  end
end
