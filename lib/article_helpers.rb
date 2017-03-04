module ArticleHelpers

  def header_for(article)
    summary = "<h2>#{link_to(article.title, article)}</h2>"
    summary += "<small>#{article.data.author}, le "
    summary += "#{I18n.localize(article.date, format: '%a %e %b %R %Y')}</small>"
    summary += "<br/><br/><br/>"
    summary
  end

  def footer_for(article)
    footer = "<p>Tags : <small>"
    footer += article.tags.map{ |t| link_to(t, "/tags/#{t.gsub('\'', '-')}")}.join(', ')
    footer += ".</small></p>"
    footer
  end


  def summary_for(article)
    summary = header_for(article)
    summary += article.summary(250)
    summary
  end

  def summary_for_list_of(articles)
    articles.collect { |a| summary_for a }.join('')
  end
end
