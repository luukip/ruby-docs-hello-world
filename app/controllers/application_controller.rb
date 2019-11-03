class ApplicationController < ActionController::Base
  def hello
    render html: "Luke's test!"
  end
end
