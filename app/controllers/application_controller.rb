class ApplicationController < ActionController::Base
  def hello
    render html: "Luke's test!\n"
    print "Druga linia"
  end
end
