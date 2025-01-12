require_relative 'order'

class OrderRepository
  def all
    sql = 'SELECT * FROM orders;'
    result = DatabaseConnection.exec_params(sql, [])

    orders = []

    result.each do |record|
      order = Order.new
      order.id = record['id']
      order.customer = record['customer']
      order.date = record['date']
      orders << order
    end

    return orders
  end

  def create(order)
    sql = 'INSERT INTO orders (customer, date) VALUES ($1, $2);'
    params = [order.customer, order.date]
    DatabaseConnection.exec_params(sql, params)
  end
end