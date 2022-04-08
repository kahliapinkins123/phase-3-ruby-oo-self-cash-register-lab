class CashRegister
    #attr_reader 
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(employee_discount = 0)
        @total = 0
        @discount = employee_discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.last_transaction = price * quantity
        @total = self.total + price * quantity
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if @discount != 0
            percent = (100.0 - self.discount.to_f)/100
            @total = (self.total * percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end
