module Web::Views::Articles
  class Test
    include Web::View

    def current_page_as_json
      # TODO: to_json.to_json This is a workaround
      paginated.current_page.shuffle.to_json.to_json
    end

    def paginated
      locals[:articles]
    end

    def next_page
      paginated.current_page_number + 1
    end

    def previous_page
      paginated.current_page_number - 1
    end

    def per_page
      paginated.per_page
    end

    def current_page
      paginated.current_page_number
    end

    def has_previous_page?
      previous_page > 0
    end

    def number_of_pages
      paginated.pages.length
    end

    def link_to_previous_page
      "/articles/test?per_page=#{per_page}&page=#{previous_page}"
    end

    def link_to_next_page
      "/articles/test?per_page=#{per_page}&page=#{next_page}"
    end

    def reload_link
      "/articles/test?per_page=#{per_page}&page=#{current_page}"
    end
  end
end
