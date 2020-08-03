
class Application
    @@items = []
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            searched_item = req.path.split("/items/").last
            item = @@items.find{|i|i.name == searched_item}
            
            if @@items.include?(item)
                resp.write "Item price is #{item.price}"
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end


