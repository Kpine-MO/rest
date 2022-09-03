describe Shop do
  let(:shop) { Shop.new }
  let(:attributes) do 
    {
      title: "Barber",
      opening_date: 1973,
      owner: "George Omondi",
      
    }
  end

  it 'inherits from ActiveRecord::Base' do
    expect(Shop.superclass).to eq(ActiveRecord::Base)
  end

  it 'has a title' do
    shop.title = "The Shop"
    expect(shop.title).to eq("The Shop")
  end

  it 'has a opening date' do
    shop.opening_date = 1999
    expect(shop.opening_date).to eq(1999)
  end

  it 'has a owner' do
    shop.owner = "The Wachowski Sisters"
    expect(shop.owner).to eq("The Wachowski Sisters")
  end


  it 'can be instantiated with a hash of attributes' do
    expect { Shop.new(attributes) }.not_to raise_error
  end

  describe 'Create' do

    describe '.create_with_title' do
      it 'saves the title to the sjop' do
        titled_shop = Shop.create_with_title("This is a title.")
        expect(titled_shop.title).to eq("This is a title.")
      end
  
      it 'creates a new record in the database' do
        expect { Shop.create_with_title("This is a title.") }.to change(Shop, :count).by(1)
      end
    end

  end

  describe 'Read' do

    before do

      Shop.create(title: "Electronics", opening_date: 1983, owner: "John Doe")

      Shop.create(title: "Books", opening_date: 2004, owner: "Jane Doe")

      Shop.create(title: "Cosmetics", opening_date: 1983, owner: "John Badham")

      
    end
     
    describe '.first_shop' do 
      it 'returns the first shop' do
      #  expect(Shop.first_shop).to eq(Shop.first)
       expect(Shop.first_shop.owner).to eq('John Doe')
      end
    end

    describe '.last_shop' do 
      it 'returns the last shop' do
      #  expect(Shop.last_shop).to eq(Shop.last)
       expect(Shop.last_shop.owner).to eq('John Badham')
      end
    end
    
    describe '.shop_count' do 
      it 'returns the number of shops' do
       expect(Shop.shop_count).to eq(Shop.count)
      end
    end

    describe '.find_shop_with_id(id)' do 
      it 'returns the shop with the provided id' do
       expect(Shop.find_shop_with_id(2).owner).to eq('Jane Doe')
      end
    end

    describe '.find_shop_with_attributes(title)' do 
      it 'returns shop with attribute provided' do


        shop = Shop.all

        filtered = shop.map do |f|
             f.title
        end

        expect(filtered.include?("Cosmetics")).to eq(true) 
      end
    end

    describe '.find_shops_after_2002' do
     it 'returns shop opened after 2002' do

      opening = Shop.find_shops_after_2002

      expect(opening).to match_array([
        have_attributes(title: "Books", opening_date: 2004, owner: "Jane Doe"),
      ])

      end
    end
    
  end

 

end
