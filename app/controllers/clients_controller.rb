class ClientsController < ApplicationController
  def new
    @client = Client.new
    @client.login = Login.new
    @client.listings.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      sign_in @client.login
      flash.notice = 'Succesfully created account. Welcome to Front Door!'
      redirect_to root_path
    else
      flash.now.alert = 'There were some errors with your submission.'
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit!
  end
end
