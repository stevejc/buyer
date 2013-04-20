class AccountsController < ApplicationController
  
  def new
    @account = Account.new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def index
    @accounts = Account.all
  end

  
end