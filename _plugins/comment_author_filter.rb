module Jekyll
  module CommentAuthorFilter
    def comment_author(comment)
      author = comment['author']
      author_email = comment['author_email']
      author_url = comment['author_url']

      author = "<a href=\"mailto: #{author_email}\">#{author}</a>" if author_email
      author << " (<a href=\"#{author_url}\">#{author_url}</a>)" if author_url

      return author
    end
  end
end

Liquid::Template.register_filter(Jekyll::CommentAuthorFilter)
