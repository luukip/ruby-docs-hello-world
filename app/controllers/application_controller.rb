class ApplicationController < ActionController::Base
  def hello
    render html: "Luke's test!\n"
    render html: "Druga linia"
  end
end
