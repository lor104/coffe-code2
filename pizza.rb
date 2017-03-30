class Pizza

  def initialize (toppings)
    @toppings = toppings #array
    @cooked = false
    @slices = 0
    @cuts_remaining = 0
  end

  def bake
    if @cooked == true
      puts "You've already cooked the pizza"
    else
      @cooked = true
      @slices = 1
      @cuts_remaining = 3
      return @cooked
    end
  end

  def cut
    unless @cooked
      puts "You cant cut an uncooked pizza"
      return
    end

    if @cuts_remaining == 3
      @slices += 1
      @cuts_remaining -=1
    elsif @cuts_remaining == 2 || if @cuts_remaining == 1
      @slices += 2
      @cuts_remaining -=1
    elsif @cuts_remaining == 0
      puts "You cannot cut any more"
      return
    end
    return @slices
  end

  def eat
    unless @cooked
      puts "You cant eat an uncooked pizza"
      return
    end

    if @slices > 0
      @slices -= 1
      puts "Enjoy!"
    else
      puts "No more pizza to eat!"
    end

    return @slices

  end
end
end
pepperoni = Pizza.new(["pepperoni", "cheese", "mushroom"])


class Pizzeria

  def initialize
    @open = false
    @stock = 0
  end

  def order(toppings)
    if @open && @supplies > 0
      @supplies -= 1
      p = Pizza.new(toppings)
      p.bake
      3.times {p.cut}
      return p
    else
      return "Can't make a pizza"
    end
  end

  def restock
    @supplies = 5 unless @open
  end

  def close
    @open = false
  end

  def open
    @open = true
  end
end
