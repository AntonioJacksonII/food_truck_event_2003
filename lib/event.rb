class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory[item] > 0
    end
  end

  def total_inventory
    inventory_total = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |items|
        items.each do |item|
          if inventory_total[items[0]].nil?
            inventory_total[items[0]] = {quantity: @food_trucks.sum {|truck| truck.check_stock(items[0])},
                                        food_trucks: [truck]}
          else
            inventory_total[items[0]] = {quantity: @food_trucks.sum {|truck| truck.check_stock(items[0])},
                                          food_trucks: [truck]}
          end
        end
      end
    end
    inventory_total
  end
end
