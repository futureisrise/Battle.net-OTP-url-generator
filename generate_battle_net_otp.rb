# run ruby ./generate_battle_net_otp.rb <BA-tassadar value> <Battle.net authenticator serial> <Battle.net authenticator recovery code>

# Find BA-tassadar value:
# 1. Open Developer tools in browser on Network section
# 2. Open http://account.battle.net
# 3. Sign in # NOTE: You will receive this cookie only once when you sign in. If you signed in, log out and repeat
# 4. Ctrl+F in developer tools and search - BA-tassadar=
# 5. Find in Cookies parameter of queries 
# 6. You are gorgeous


# Serial and recovery of battle.net authenticator:
# 1. Open Battle.net app
# 2. Go to Authenicator
# 3. Open settings > Serial number and recovery key
# 4. You are gorgeous

# used only stdlib
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"

def generate_access_token(ba_tassadar)
  body = {
    "client_id" => 'baedda12fe054e4abdfc3ad7bdea970a',
    "grant_type" => 'client_sso',
    "scope" => "auth.authenticator",
    "token" => ba_tassadar
  }
  url = URI("https://oauth.battle.net/oauth/sso")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Post.new(url)
  request["Content-Type"] = 'application/x-www-form-urlencoded'
  request.body = URI.encode_www_form(body)

  response = http.request(request)

  JSON.parse(response.read_body)["access_token"]
end

def fetch_device_secret(access_token, serial, restoreCode)
  body = {
    serial:serial,
    restoreCode:restoreCode
  }
  url = URI("https://authenticator-rest-api.bnet-identity.blizzard.net/v1/authenticator/device")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Post.new(url)
  request["Authorization"] = "Bearer #{access_token}"
  request["content-type"] = "application/json"
  request["accept"] = "application/json"
  request.body = JSON.dump(body)

  response = http.request(request)

  JSON.parse(response.body.to_s)["deviceSecret"]
end

def base_32_encode(data)
  binary_string = data.unpack1('B*')

  result = ""
  binary_string.scan(/.{1,5}/).each do |bits|
    bits = bits.ljust(5, '0')
    result += ALPHABET[bits.to_i(2)]
  end

  padding_length = (8 - (result.length % 8)) % 8
  result.ljust(result.length + padding_length, '=')
end

def generate_otp_url(device_secret)
  binary_secret = [device_secret].pack('H*')
  secret = base_32_encode(binary_secret)
  "otpauth://totp/Battle.net?secret=#{secret}&digits=8"
end

def process(ba_tassadar, serial, restoreCode)
  access_token = generate_access_token(ba_tassadar)
  device_secret = fetch_device_secret(access_token, serial, restoreCode)
  otp_url = generate_otp_url(device_secret)
  puts otp_url
end

process(ARGV[0], ARGV[1], ARGV[2])
