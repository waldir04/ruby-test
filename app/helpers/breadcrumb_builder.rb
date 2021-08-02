class BreadcrumbBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder

  def render
    @elements.collect do |element|
      render_element(element)
    end.join('')
  end

  def render_element(element)
    content = @context.link_to_unless_current(compute_name(element), compute_path(element))

    if @elements.last == element
      @context.content_tag(@options[:tag], content, class: 'breadcrumb-item active')
    else
      @context.content_tag(@options[:tag], content, class: 'breadcrumb-item')
    end
  end
end
