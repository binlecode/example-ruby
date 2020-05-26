# decorator on each concrete class from same interface will likely
# create duplicated and out-of-control code
# it is preferred to have decoration logic on the interface defined
# functionality

# in ruby the interface is implicit and coupled with duck typing

class Car
  def run
    start_engine
    puts 'ready to roll'
  end

  def start_engine
  end
end

class Crv < Car
  def start_engine
    puts 'CRV starting 2.0L 4-cylinder engine'
  end
end

class Highlander < Car
  def start_engine
    puts 'Highlander starting 3.5L V-6 engine'
  end
end

class RentalCar
  def initialize(car)
    @car = car
  end

  def drive_car
    puts 'Rented a car and start driving it'
    @car.run # the decoration interface is on Car#run
  end
end

rc1 = RentalCar.new(Crv.new)
rc1.drive_car

rc2 = RentalCar.new(Highlander.new)
rc2.drive_car


# now let's extend this interface based decoration to one more level
# note this time the decorated method RentalCar#drive_car becomes
# the interface to decorate

class MiniVan < Car
  def start_engine
    puts 'MiniVan starting 4.0 V-8 engine'
  end
end

class ShuttleCar < RentalCar
  def drive_car
    puts 'Boarded a shttle car and start riding it'
    @car.run
  end
end

class HotelCarService
  def initialize(rentalCar)
    @rentalCar = rentalCar
  end

  def rent_car
    puts 'Booked a car and start using it'
    @rentalCar.drive_car
  end
end

hcs = HotelCarService.new(RentalCar.new(MiniVan.new))
hcs.rent_car

# we could keep going to produce a decoration chain






