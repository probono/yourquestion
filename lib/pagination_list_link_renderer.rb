class PaginationListLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer

  def to_html
    links = @options[:page_links] ? windowed_links : []

    links.unshift(page_link_or_span(@collection.previous_page, 'graphic prev', "anterior"))
    links.push(page_link_or_span(@collection.next_page, 'graphic next', "siguiente"))

    html = links.join(@options[:separator]).html_safe
    container_attributes[:class] = nil
    @options[:container] ? @template.content_tag(:ul, html, container_attributes) : html
  end

protected

  def windowed_links
    windowed_page_numbers.map { |n| page_link_or_span(n, (n == current_page ? 'active' : nil)) }
  end

  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    #mostrar siempre como link, cosas de los estilos
    if page #&& page != current_page   
      page_link(page, text, :class => span_class)
    else
      page_span(page, text, :class => span_class)
    end
  end

  def page_link(page, text, attributes = {})
    @template.content_tag(:li, link(text, page, attributes).html_safe, attributes)
  end

  def page_span(page, text, attributes = {})
    @template.content_tag(:li, text, attributes)
  end

end
