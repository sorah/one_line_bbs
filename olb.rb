require 'sinatra'
require 'cgi'

class String
  def escape_html
    CGI.escapeHTML(self)
  end
end

$data = []

get '/' do
  erb :index
end

post '/' do
  if params[:name] && params[:message]
    $data << ({
      :name    => params[:name],
      :message => params[:message],
      :date    => Time.now
    })
  end
  redirect "/"
end

