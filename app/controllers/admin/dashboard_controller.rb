class Admin::DashboardController < ApplicationController

  def index
    sql = %{
select date(placed_at), count(*), sum(total_amount)
from orders
group by date(placed_at)
order by date(placed_at)}
    @days = Order.connection.select_rows(sql)
  end
end