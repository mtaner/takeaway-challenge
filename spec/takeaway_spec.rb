# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes


require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:food) {double :food}
  let(:food2) {double :hamburger}

describe "#see_menu" do
  it "shows the list of dishes with prices" do
    expect(takeaway.see_menu).to eq ({margarita:5, mushroom_pizza:6, pepperoni_pizza:7, chips:3, soft_drink:2, alcohol:5})
  end
end

describe "#order"
  it "selects from the available dishes" do
    expect(takeaway.order(2, food)).to eq "2 x #{food}(s) added to the basket."
  end

  it "prompts the user when a food is already in the basket, and adds the food if customer selected 'yes'" do
    takeaway.order(food)
    allow(takeaway).to receive(:gets).and_return "yes"
    expect(takeaway.order(food)).to eq "1 x #{food}(s) added to the basket."
  end

  it "prompts the user when a food is already in the basket, and doesn't add the food if customer selected 'no'" do
    takeaway.order(food)
    allow(takeaway).to receive(:gets).and_return "no"
    expect(takeaway.order(food)).to eq "Thank you for confirming. #{food} is not added to the basket."
  end

  it "raises error if the food requested is not in the menu" do
    expect(takeaway.order(food2)).to raise_error "Unfortunately we do not have #{food2}. Please select from the menu."
  end

end
