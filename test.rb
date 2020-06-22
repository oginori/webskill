require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
  })
  ['INT', 'TERM'].each {|signal|
    Signal.trap(signal){ server.shutdown}
  }
  server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'workbook.html.erb')
  server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
  server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
  server.mount('/others.cgi', WEBrick::HTTPServlet::CGIHandler, 'others.rb')
  server.mount('/bad.cgi', WEBrick::HTTPServlet::CGIHandler, 'bad.rb')
  server.start
