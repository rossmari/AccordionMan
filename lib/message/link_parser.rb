class Message::LinkParser

  class << self

    LINK_REGEXP = /https?:\/\/[\da-z\.-]+\.[a-z\.]{2,6}[\/\w \.-]*\/?/

    def parse(content)
      if content =~ LINK_REGEXP
        extract_links(content)
      else
        []
      end
    end

    private

    def extract_links(content)
      result = []
      links = content.scan(LINK_REGEXP)
      links.each do |link|
        result << construct_link(link)
        end
      return result
    end

    def construct_link(content)
      Link.new(url: content)
    end

  end

end