class ApplicationController < ActionController::Base

  def hello
    render plain: "Yayy!"
  end
end
