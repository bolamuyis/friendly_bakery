require "sinatra"
require 'sendgrid-ruby'
include SendGrid

get "/" do
    erb :index
end

get "/cakes" do
    erb :cakes, :layout => :cakes_main
end

get "/cookies" do
    erb :cookies, :layout => :cookies_main
end

get "/muffins" do
    erb :muffins, :layout => :muffins_main
end

get "/form" do
    erb :form
end

post "/" do
  from = SendGrid::Email.new(email: 'bolamuyis@gmail.com')
  to = SendGrid::Email.new(email: params[:email])
  subject = params[:name]
  content = SendGrid::Content.new(
    type: 'text/html',
    value: 
  "<p><strong>Ma BAKERY CATALOG</strong><br>
  Feel free to reach out with any questions or for quotes for your upcoming event.</p>

<p><strong>CAKES</stong></p>
  <p><a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/0D7UkmV.jpg\" alt=\"Apple Cake\"/></a><br>
    Name: Apple Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/VvR5xrz.jpg\" alt=\"Strawberry Cake\"/></a><br>
    Name: Strawberry Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/GdGuuBA.jpg\" alt=\"Red Wine Chocolate Cake\"/></a><br>
    Name: Red Wine Chocolate Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/SE8tV2O.jpg\" alt=\"Strawberry and Chocolate Cake\"/></a><br>
    Name: Strawberry and Chocolate Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/oKDN4tA.jpg\" alt=\"Assorted Cupcakes with Icing\"/></a><br>
    Name: Assorted Cupcakes with Icing, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/qjB9D1s.jpg\" alt=\"Cakes and Cupcakes\"/></a><br>
    Name: Cakes and Cupcakes, Price: $42
  </p>
  <p><strong>COOKIES</stong></p>
  <p><a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/0D7UkmV.jpg\" alt=\"Apple Cake\"/></a><br>
    Name: Apple Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/VvR5xrz.jpg\" alt=\"Strawberry Cake\"/></a><br>
    Name: Strawberry Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/GdGuuBA.jpg\" alt=\"Red Wine Chocolate Cake\"/></a><br>
    Name: Red Wine Chocolate Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/SE8tV2O.jpg\" alt=\"Strawberry and Chocolate Cake\"/></a><br>
    Name: Strawberry and Chocolate Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/oKDN4tA.jpg\" alt=\"Assorted Cupcakes with Icing\"/></a><br>
    Name: Assorted Cupcakes with Icing, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/qjB9D1s.jpg\" alt=\"Cakes and Cupcakes\"/></a><br>
    Name: Cakes and Cupcakes, Price: $42
  </p>
  <p><strong>MUFFINS</stong></p>
  <p><a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/0D7UkmV.jpg\" alt=\"Apple Cake\"/></a><br>
    Name: Apple Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/VvR5xrz.jpg\" alt=\"Strawberry Cake\"/></a><br>
    Name: Strawberry Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/GdGuuBA.jpg\" alt=\"Red Wine Chocolate Cake\"/></a><br>
    Name: Red Wine Chocolate Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/SE8tV2O.jpg\" alt=\"Strawberry and Chocolate Cake\"/></a><br>
    Name: Strawberry and Chocolate Cake, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/oKDN4tA.jpg\" alt=\"Assorted Cupcakes with Icing\"/></a><br>
    Name: Assorted Cupcakes with Icing, Price: $12 <br>
    <a href=\"http://localhost:4567/cakes\" target=\"_blank\"><img src=\"https://i.imgur.com/qjB9D1s.jpg\" alt=\"Cakes and Cupcakes\"/></a><br>
    Name: Cakes and Cupcakes, Price: $42
  </p>
  "
  )

  # create mail object with from, subject, to and content
  mail = SendGrid::Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
  # sends the email
  response = sg.client.mail._('send').post(request_body: mail.to_json)

  # display http response code
  puts response.status_code

  # display http response body
  puts response.body

  # display http response headers
  puts response.headers

  redirect "/"
end
