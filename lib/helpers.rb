module MyHelpers
  def link_to(name, path)
    <<-HTML
      <a href="#{path}">#{name}</a>
    HTML
  end
end