module ProfileHelper
  def clean_file(file)
    return file if file.length < 30
    file.split(File::SEPARATOR).last(4).unshift("...").join("/")
  end

  def clean_method(method)
    return method if method.length < 30
    method[0,10] + "..." + method[-10,10]
  end
end
