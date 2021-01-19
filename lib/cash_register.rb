require 'pry'
class CashRegister

        attr_reader :discount, :items
        attr_accessor :total, :last_item_amount, :last_item_qty

        def initialize(discount = 0)
            @total = 0
            @discount = discount
            @items = []
        end

        def add_item(title, price, quantity = 1)
            self.total += (price * quantity)
            self.last_item_amount = (price * quantity)
            self.last_item_qty = quantity
            quantity.times { self.items << title }
        end

        def apply_discount
            if self.discount == 0 
                "There is no discount to apply."
            else
                self.total  = (self.total - (self.total.to_f * (self.discount.to_f/100))).to_i
                "After the discount, the total comes to $#{self.total}."
            end
        end

        def void_last_transaction
            self.last_item_qty.times { @items.pop }
            self.total -= self.last_item_amount
        end
end