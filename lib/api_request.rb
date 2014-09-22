class ApiRequest

  attr_reader    :base_url, :api_key, :user_agent, :api_key_name, :shared_secret_name, :shared_secret, :app_name
  attr_accessor  :request

  require 'byebug'
  require 'faraday'
  require 'faraday_middleware'

  def initialize(base_url:, api_key:, api_key_name:, **secret_and_names)
    @base_url = base_url
    @api_key  = api_key
    @api_key_name = api_key_name
    valid_keys = %i(user_agent shared_secret shared_secret_name app_name)
    secret_and_names.select{|k| valid_keys.include? k}.each_pair do |k,v|
      self.instance_variable_set('@'+k.to_s, v)
    end
    @request = request_object
  end

  ## attr_accessor not possible here, cached request_object must be remade
  def base_url= new_base_url
    @base_url = new_base_url
    @request = request_object
  end

  def api_key= new_api_key
    @api_key = new_api_key
    @request = request_object
  end

  private

  def request_object
    f = Faraday.new(url: base_url)
    f.headers['User-Agent'] = app_name if app_name
    f.headers.merge!({'Authorization' => api_key_name + ': ' + api_key})
    f.builder.swap(1, Faraday::Adapter::NetHttpPersistent)
    f.response :json, :content_type => 'application/json'
    f
  end

end
