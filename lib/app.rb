require "erb"

class App
    def call(env)
        homePage = render("index.html.erb")
        signUp = render("signup.html.erb")
        landingPage = render("landing.html.erb")
        req = Rack::Request.new(env)
        case req.path_info
        when /login/
            [200, {"Content-Type" => "text/html; charset=utf-8"}, ["#{homePage}"]]
        when /signup/
            [200, {"Content-Type" => "text/html; charset=utf-8"}, ["#{signUp}"]]
        else
            [404, {"Content-Type" => "text/html"}, ["#{landingPage}"]]
        end
    end
    def render(template)
        path = File.expand_path("../views/#{template}", __FILE__)
        ERB.new(File.read(path)).result(binding)
    end
end