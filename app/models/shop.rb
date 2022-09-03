class Shop < ActiveRecord::Base


    def self.create_with_title(title)
        Shop.create(title: "This is a title.")
    end

    def self.first_shop
        Shop.first
    end

    def self.last_shop
        Shop.last
    end

    def self.shop_count
        Shop.count
    end

    def self.find_shop_with_id(id)
        Shop.find(id)
    end

    def self.find_shop_with_attributes(title)
        Shop.find_by(title: title)
    end

    def self.find_shops_after_2002
        Shop.where("opening_date > ?", 2002)
    end

    def update_with_attributes(title)
        self.update(title: title)
    end

    def self.update_all_titles(title)
        Shop.update(title: title)
    end

    def self.delete_by_id(id)
        Shop.find(id).destroy
    end

    def self.delete_all_shops
        Shop.destroy_all
    end
end