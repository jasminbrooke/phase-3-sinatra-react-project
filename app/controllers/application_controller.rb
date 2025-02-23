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
    return { error: user.errors.messages }.to_json unless user.valid?

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

  get '/products/:id' do
    products = Product.where(user_id: params[:id])
    results = []
    products.each { |p| results << p.attributes.merge(profit: p.profit) }
    results.to_json
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
    current_user = User.find_by!(username: params[:username])
    if current_user 
      return {
               user: current_user,
               products: current_user.products
             }.to_json
    else
      return { error: {:login=>"User not found"} }.to_json
    end
  end
end
