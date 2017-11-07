require 'net/http'
require 'json'

class Geocoder
  attr_reader :location, :result

  def initialize(location)
    @location = location || ''
    request
  end

  def request
    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + location
    url += '&components=country:DE'
    url += '&key=' + ENV['api_key']
    uri = URI(url)
    data = Net::HTTP.get(uri)
    @result = JSON.parse(data)
  end

  def response
    unless result['results'].nil?
      body = result['results'][0]
      if body['formatted_address'] == 'Germany'
        { status: 'error', message: 'location not found' }
      else
        lat = body['geometry']['location']['lat']
        lng = body['geometry']['location']['lng']
        { status: 'ok', latitude: lat, longitude: lng }
      end
    else
      { status: 'error', message: 'geolcation service is temporary unavailable' }
    end
  end
end