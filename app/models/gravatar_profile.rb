class GravatarProfile
  attr_accessor :name, :photo, :url
  def initialize(email)
    email_hash = Digest::MD5.hexdigest(email)
    puts RestClient.get("http://gravatar.com/#{email_hash}.json")
    response = JSON.parse(RestClient.get("http://gravatar.com/#{email_hash}.json"))
    puts response.inspect
    profile = response['entry'].first
    @name, @photo, @url = profile['displayName'], profile['photos'].first['value'], profile['profileUrl']
  end
end
