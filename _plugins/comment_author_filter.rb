module Jekyll
  module CommentAuthorFilter
    def comment_author(comment)
      if comment['author_url'] && !comment['author_url'].empty?
        author = "<a href=\"#{comment['author_url']}\" rel=\"nofollow\">#{author}</a>"
      else
        author = comment['author']
      end

      return author
    end
  end
end

Liquid::Template.register_filter(Jekyll::CommentAuthorFilter)
