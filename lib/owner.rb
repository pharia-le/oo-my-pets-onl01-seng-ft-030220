require 'pry'

class Owner
  
  attr_accessor 
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name  
    @species = "human"
    self.save
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    dog = Dog.new(name, self)
  end
  
  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  def save
    @@all << self
  end
  
  def self.count
    self.all.size
  end
  
  def self.reset_all
    self.all.clear  
  end
  
  def self.all
    @@all  
  end
  
end