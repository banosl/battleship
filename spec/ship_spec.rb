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

    #Test 6
        it 'Cruisers health dropped by 1' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.hit

            cruiser.health

            expect(cruiser.health).to eq(2)

        end
    
    #Test 7
        it 'Cruisers health dropped by 2' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.hit
            cruiser.hit

            cruiser.health

            expect(cruiser.health).to eq(1)
        end

    #Test 8
        it 'The ship is not sunk after being hit twice' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.hit
            cruiser.hit

            cruiser.health

            cruiser.sunk?

            expect(cruiser.sunk?).to be false

        end

    #Test 9
        it 'Cruiser is sunk after being hit 3 times' do

            cruiser = Ship.new("Cruiser", 3)

            cruiser.hit
            cruiser.hit
            cruiser.hit

            cruiser.sunk?

            expect(cruiser.sunk?).to be true
            
        end

end