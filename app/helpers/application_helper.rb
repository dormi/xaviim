module ApplicationHelper
  def snippet(file, language: 'ruby')
    text = File.read(Rails.root.join('app', 'views', 'snippets', file))    
    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexer.find(language)

    tag.pre formatter.format(lexer.lex(text)).html_safe, class: 'highlight'
  end
end
