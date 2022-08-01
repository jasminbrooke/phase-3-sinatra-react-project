require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # user CRUD

  get '/users' do
    users = User.all.order(:created_at)
    users.to_json
  end

  post '/users' do
    user = User.create(username: params[:username], displayname: params[:displayname])
    user.to_json
  end

  patch '/user/:id' do
    user = User.find(params[:id])
    user.update(displayname: params[:displayname])
    user.to_json
  end

  delete '/user/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  # product CRUD

  get '/products' do
    products = Product.all.order(:created_at)
    products.to_json
  end

  post '/products' do
    product = Product.create(
      productname: params[:productname],
      description: params[:description],
      available: params[:available],
      cost: params[:cost],
      price: params[:price],
      category: params[:category],
      img_url: params[:img_url],
      user: User.find(params[:user_id])
    )
    product.to_json
  end

  patch '/product/:id' do
    product = Product.find(params[:id])
    product.update( 
      productname: params[:productname],
      description: params[:description],
      available: params[:available],
      cost: params[:cost],
      price: params[:price],
      category: params[:category],
      img_url: params[:img_url],
      favorite: params[:favorite]
    )
    product.to_json
  end

  delete '/product/:id' do
    product = Product.find(params[:id])
    product.destroy
    product.to_json
  end

  # login

  post '/login' do
    current_user = User.find_by(username: params[:username])
    {
      user: current_user,
      products: current_user.products
    }.to_json
  end

  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

end
