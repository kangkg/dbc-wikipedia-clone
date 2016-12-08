module RevisionHelper
  def body_with_links(revision)
    p revision.body
    body_str = h(revision.body.dup)
    p body_str
    links = Link.all
    links.each do |link|
      body_str.gsub!(/#{link.word}/, link_to(link.word, article_path(Article.find(link.article_id))))
    end
    body_str.html_safe
  end
end
