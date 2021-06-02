require "erb"

class Greet
    def call(env)
        homePage = render("index.html.erb")
        [200, {"Content-Type" => "text/html; charset=utf-8"}, ["#{homePage}"]]
    end
    def render(template)
        path = File.expand_path("../views/#{template}", __FILE__)
        ERB.new(File.read(path)).result(binding)
    end
end