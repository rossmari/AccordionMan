class Message::UserParser

  class << self

    def parse(user)
      find_user(user.id) || create_user(user)
    end

    private

    def find_user(t_id)
      User.find_by_t_id(t_id)
    end

    def create_user(user)
      User.create(first_name: user.first_name, last_name: user.last_name,
                  t_id: user.id, t_name: user.username)
    end

  end

end