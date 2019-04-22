class Item
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end
end


def app()
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/name)
    resp.write "#{@price}"
    resp.status 200
  else
    "Route not found"
    resp.staus 404
  end
if Item.find == nil
  resp.write "Item not found"
  resp.staus 400
end

end
