class Application



@@items = Item.new("Apples", 5.23), Item.new("Oranges", 2.43)


  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = item.split("/items/").last
      if item = @@items.find{ |i| i.name == item_name }
        resp.write item.price
      else
        resp.status = 400
        resp.wrtie = "Item not found"
      end
      else
        resp.staus = 404
        resp.write "Path not found"
      end
      resp.finish
    end
  end



#   if req.path.match(/items/name)
#     resp.write "#{@price}"
#     resp.status 200
#   else
#     "Route not found"
#     resp.staus 404
#   end
# if Item.find == nil
#   resp.write "Item not found"
#   resp.staus 400
# end
#
# end
