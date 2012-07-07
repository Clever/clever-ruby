module CleverRuby
  @@api_key = nil
  @@api_base = 'https://api.getclever.com/v1.1'

  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end
end