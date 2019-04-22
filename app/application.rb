class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      #binding.pry
      # get_item_price(selected_item)
      if check_item_route(item_name)
        #binding.pry
        item_select = @@items.find{|ind_item| ind_item.name == item_name}
        resp.write "#{item_select.price}"
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

  def check_item_route(item_query)
    status = false
    @@items.each {|item|
      if item.name == item_query
        return status = true
      end
    }
    status
  end
end
