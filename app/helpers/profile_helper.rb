module ProfileHelper
  def clean_file(file)
    return file if file.length < 30
    file.split(File::SEPARATOR).last(4).unshift("...").join("/")
  end

  def clean_method(method)
    return method if method.length < 30
    method[0,10] + "..." + method[-10,10]
  end

  def toggle_link(param)
    u = URI.parse(request.url)
    p = request.query_parameters.dup
    if p[param].nil?
      p[param] = "1"
      prefix = "hide"
    else
      p.delete(param)
      prefix = "show"
    end

    u.query = p.to_query
    link_to "#{prefix} #{param}", u.to_s, :class => "btn"
  end
end
