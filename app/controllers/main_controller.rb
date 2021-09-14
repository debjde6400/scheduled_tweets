class MainController < ApplicationController
  def index
  end

  def notice_flash
    flash[:notice] = "Logged in successfully"
  end

  def alert_flash
    flash[:alert] = "Invalid email or password"
  end

end