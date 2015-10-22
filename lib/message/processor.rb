class Message::Processor

  class << self

    def process(message)
      parsed_message = message(message)
      parsed_message.user = Message::UserParser.parse(message.from)

      links = Message::LinkParser.parse(message.text)

      # check links on accordion alert and save them if all is safe
      check_links(links, message.from)

      # attach links to parsed message in db
      parsed_message.links << links
      parsed_message.save
    end

    private

    def message(message)
      Message.new(content: message.text, posted_at: message.date)
    end

    # todo : move save to another place
    def check_links(links, user)
      links.each do |link|
        matches = Link::AccordionChecker.find_matches(link)
        unless matches.empty?
          Link::AccordionMessenger.send(link, user, matches)
        end
        link.save
      end
    end

  end

end