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
  
  # def buy_dog(name)
  #   Dog.all.find {|dog| dog.name == name}.owner = self
  # end
  
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