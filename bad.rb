require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['bad_item']
  "<html>
    <body>
      <p>品質が悪いもののgoyaの情報は下記になります</p>
      #{get}
    </body>
  </html>"
}
