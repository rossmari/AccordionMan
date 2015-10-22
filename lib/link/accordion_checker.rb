class Link::AccordionChecker

  class << self

    def find_matches(link)
      result = {}
      Link.where(url: link.url).each do |link|
        result[link.message.posted_at] = link.message.user.first_name
      end
      return result
    end

  end

end