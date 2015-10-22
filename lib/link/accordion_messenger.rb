class Link::AccordionMessenger

  class << self
    def send(link, user, matches)
      # todo : show link that raise accordion alert
      RT_BOT.send_message(chat_id: CHAT_ID, text: message(user, matches))
    end


    private

    def message(user, matches)
      msg = "#{user.first_name}, вы запостили баян! Как же так? До вас это постили уже #{matches.keys.count} раз.. "
      msg += additional_msg(matches.keys.count)

      return msg
    end

    def additional_msg(count)
      (LinkAccordionWarning.where(count: count).first || LinkAccordionWarning.last).message
    rescue
      Error.create(content: 'Add at least 1 default additional link to Accordion Link Warnings')
      return ''
    end

  end



end