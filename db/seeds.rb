# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(
   first_name: "Richard",
   last_name: "Adule",
   username: "BigRichi",
   password: "abc123"
)

User.create(
    first_name: "Yehudis",
    last_name: "Raitman",
    username: "BigYehudis",
    password: "abc123"
 )

# require 'uri'
# require 'net/http'
# require 'openssl'

# url = URI("https://healthruwords.p.rapidapi.com/v1/quotes/?id=731&t=Wisdom&maxR=1&size=medium")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = 'SIGN-UP-FOR-KEY'
# request["x-rapidapi-host"] = 'healthruwords.p.rapidapi.com'

# response = http.request(request)
# puts response.read_body
