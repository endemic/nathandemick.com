module Jekyll
  module CommentAuthorFilter
    def comment_author(comment)
      author = comment['author']

      unless comment['author_url'].nil? || comment['author_url'].empty?
        author = "<a href=\"#{comment['author_url']}\" rel=\"nofollow\">#{comment['author']}</a>"
      end

      author
    end
  end
end

Liquid::Template.register_filter(Jekyll::CommentAuthorFilter)
