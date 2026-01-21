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

  test "builds 2 placements for the order" do
    @order.build_placements_with_product_ids_and_quantities [
      { product_id: @product1.id, quantity: 2 },
      { product_id: @product2.id, quantity: 3 }
    ]
    assert_difference "Placement.count", 2 do
      @order.save!
    end
  end

  test "an order should not claim too much product than available" do
    @order.placements << Placement.new(product_id: @product1.id, quantity: (@product1.quantity + 1))
    assert_not @order.valid?
  end
end
