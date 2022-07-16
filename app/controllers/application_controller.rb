class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # user CRUD

  get '/users' do
    users = Users.all.order(:created_at)
    users.to_json
  end

  post '/users' do
    user = User.create(username: params[:username], displayname: params[:displayname])
    user.to_json
  end

  get '/user/:id' do
    user = User.find(params[:id])
    user.update(displayname: params[:displayname])
    user.to_json
  end

  get '/user/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  # product CRUD

  get '/products' do
    products = products.all.order(:created_at)
    products.to_json
  end

  post '/products' do
    product = product.create(
      productname: params[:productname]
      description: params[:description]
      available: params[:available]
      cost: params[:cost]
      price: params[:price]
      category: params[:category]
      img_url: params[:img_url])
    product.to_json
  end

  get '/product/:id' do
    product = product.find(params[:id])
    product.update( 
      productname: params[:productname]
      description: params[:description]
      available: params[:available]
      cost: params[:cost]
      price: params[:price]
      category: params[:category]
      img_url: params[:img_url])
    product.to_json
  end

  get '/product/:id' do
    product = product.find(params[:id])
    product.destroy
    product.to_json
  end

  # login

  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

end
