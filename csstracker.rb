require 'sinatra'

get '/' do
  <<-HTML.gsub(/^ {4}/, '')
    <!DOCTYPE html>
    <html>
    <head>
      <link rel="stylesheet" href="track.css" type="text/css" media="all" />
    </head>
    <body>
      <p>#{request.cookies['css'] ? request.cookies['css'] : 'Try to reload the webpage'}</p>
    </body>
    </html>
  HTML
end

get '/track.css' do
  response.set_cookie 'css', :value => 'It works!', :path => '/', :expires => Time.now + (60 * 60 * 24 * 30)
end
