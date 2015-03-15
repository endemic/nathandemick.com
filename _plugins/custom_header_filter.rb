module Jekyll
  module CustomHeaderFilter
    MAX_TITLE_LENGTH = 40

    def custom_header(post)

      title = post['title']
      title_attributes = ''

      if title.length > MAX_TITLE_LENGTH
        title_attributes = ' class="long"'
        words = title.split(' ')
        word_count = words.length
        halfway = word_count / 2
        title = [
          words[0 .. halfway].join(' '), 
          words[halfway + 1 .. word_count].join(' ')
        ].join('<br>')
      end

      return <<-END
      <h2#{title_attributes}>
        <a href="#{post['url']}" title="#{post['title']}" rel="bookmark">
          #{title}
        </a>
      </h2>
      END
    end
  end
end

Liquid::Template.register_filter(Jekyll::CustomHeaderFilter)
