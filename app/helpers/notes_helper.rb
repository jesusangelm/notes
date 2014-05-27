module NotesHelper
  def to_markdown(text)
    sanitize Kramdown::Document.new(text).to_html
  end
end
