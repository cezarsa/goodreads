module Goodreads
  module Users
    # Get user details
    #
    def user(id)
      data = request("/user/show", id: id)
      Hashie::Mash.new(data["user"])
    end

    def compare(id)
      data = oauth_request('/user/compare', :id => id)
      Hashie::Mash.new(data['compare'])
    end
  end
end
