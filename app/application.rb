class Application

    @@item = [ Item.new("Apple", 5), Item.new("Pears", 7)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
     
        if req.path.match(/items/)
            search_item = req.path.split("/items/").last
            item = @@items.find{|item| item.name == search_item}
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