require "test_helper"

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test "should set total" do
    order = Order.create!(user_id: @order.user_id, products: [ @product1, @product2 ])
    expected_total = @product1.price + @product2.price
    assert_equal expected_total, order.total
  end
end
