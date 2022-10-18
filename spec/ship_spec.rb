require './lib/ship'

RSpec.describe Ship do

    #Test 1
        it 'cruiser exists' do

            cruiser = Ship.new("Cruiser", 3)

            expect(cruiser).to be_instance_of(Ship)

    end

    #Test 2
        it 'cruisers name is Cruiser' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.name

            expect(cruiser.name).to eq("Cruiser")

        end

    #Test 3
        it 'cruisers length is 3' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.length

            expect(cruiser.length).to eq(3)

        end 

    #Test 4
        it 'cruisers health is 3' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.health

            expect(cruiser.health).to eq(3)

        end

    #Test 5
        it 'Was cruiser sunken?' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.sunk?

            expect(cruiser.sunk?).to be false

        end

end