class Application

  @@items = [Item.new("Bread", 3), Item.new("Cheese", 10), Item.new("Avocado", 5)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #grab the content after the /item/ to figure out which Item our user would like
      if item = @@items.find{|i| i.name == item_name} #if a user requests /item/<Item Name> return the price
         resp.write item.price
       else
         resp.status = 400
         resp.write "Item not found"
       end
     else #if the item is not found
         resp.status = 404
         resp.write "Route not found"
      end
        resp.finish
    end

end
