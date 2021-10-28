require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "tony") }
  subject(:donut) { Dessert.new("donut", 12, chef) }
  let(:ingredients) { donut.ingredients }

  describe "#initialize" do
    it "sets a type" do
      expect(donut.type).to eq('donut')
    end

    it "sets a quantity" do
      expect(donut.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(donut.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pie", "one", "tony") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(donut.add_ingredient("apple")).to eq(["apple"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "flour", "bread"]
      ingredients.each do |ingredient|
        donut.add_ingredient(ingredient)
      end

      expect(donut.ingredients).to eq(ingredients)
      donut.mix! 
      expect(donut.ingredients).not_to eq(ingredients)
      expect(donut.ingredients.sort). to eq(ingredients.sort)

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(donut.eat(2)).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { donut.eat(16) }.to raise_error 
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tony the Great Baker")
      expect(donut.serve).to eq("Chef Tony the Great Baker has made 12 donuts!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(donut)
      donut.make_more
    end
  end
end
