require "sendgrid-ruby"
require_relative "./class.rb"
require_relative "./app.rb"

# include Muffin
# include Cupcake
# include Cakes
# includes SendGrid mixin code
# Class SGMail
include SendGrid

# def initialize (from, to, catalog)
#   from = Email.new (email: from)
#   to = Email.new (email: to)
#   subject = "Sam's Pastries Catalog"
#   content = Content.new(
#     type: 'text/html',
#     value: catalog
#   )

# def send_mail(email)
#   this_from = Email.new(email: "faustrosado@gmail.com")
#   this_to = Email.new(email: email)
#   this_subject = "Sam's Pastries catalog!"
#   this_content = Content.new(
#     type: "text/html",
#     value: (erb :catalog)

#   )
#   # create mail object with from, subject, to and content
#   mail = Mail.new(this_from, this_subject, this_to, this_content)
#   # mail = Mail.new(from, subject, to, content)
#   # sets up the api key
#   sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])

#   # sends the email
#   response = sg.client.mail._("send").post(request_body: mail.to_json)

#   # display http response code
#   puts response.status_code

#   # display http response body
#   puts response.body

#   # display http response headers
#   puts response.headers
# end
