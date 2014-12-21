module Goodreads
  module Groups
    # Get group details
    def group(group_id)
      data = request("/group/show", id: group_id)
      Hashie::Mash.new(data["group"])
    end

    # Get list of groups a given user is a member of
    def group_list(user_id, sort = "my_activity")
      data = request("/group/list", id: user_id, sort: sort)
      Hashie::Mash.new(data["groups"]["list"])
    end

    def group_members(group_id, options={})
      options = {
        :id => group_id,
        :sort => 'last_online',
        :page => 1
      }.merge(options)
      data = request('/group/members', options)
      Hashie::Mash.new(data)
    end
  end
end
