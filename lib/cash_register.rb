require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(employee_discount=0)
    @total = 0
    @employee_discount = employee_discount
    @items = []
  end

  def discount
    @employee_discount
  end

  def total
    @total
  end

  def add_item(name, price, quantity=0)
    if quantity != 0
      count = quantity
      while count > 0
        @items << name
      end
      adjusted_for_quantity = price * quantity
      @total += adjusted_for_quantity
    else
      @items << name
      @total += price
    end
  end

  def apply_discount
    if @employee_discount == 0
      return "There is no discount to apply."
    else
      discount_by = 1.to_f - (@employee_discount.to_f/100.to_f)
      @total = @total * discount_by
      return "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
    @items
  end

end
