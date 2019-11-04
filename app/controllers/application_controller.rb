class ApplicationController < ActionController::Base
  def hello
    render html: "Luke's test!"
    render html: "Druga linia"
  end
end
