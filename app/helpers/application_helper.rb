module ApplicationHelper
  def rouge(text, language)
    # formatter = Rouge::Formatters::HTML.new(css_class: 'highlight')
    # lexer = Rouge::Lexer.find(language)
    # formatter.format(lexer.lex(text))

    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
    # lexer = Rouge::Lexers::Shell.new
    # formatter.format(lexer.lex(source))
  end
end
