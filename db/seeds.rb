# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
brand_list = [
	["DELL", "From United State"],#1
	["Asus", "From Taipei"],#2
	["SAMSUNG", "From Korea"],#3
	["BlackBerry", "From Canada"],#4
	["Apple", "All hail Steve Wozniak"],#5
	["HP", "From California U.S"],#6
	["Sony", "From Japan"],#7
	["Oppo", "From VietNam"],#8
	["ACER", "From Taipei"],#9
	["MSI", "From Taipei"],#10
	["GIGABYTE", "From Taipei"]#11
]

category_list = [
	["All Category"], #1
	["Laptop", 1],#2	
	["Gaming Laptop", 2],#3
	["Business Laptop", 2],#4
	["Workstation Laptop", 2],#5
	["Desktop", 1],#6
	["All-in-one Computer", 6],#7
	["Desktop Computer", 6],#8
	["Tablets", 1],#9
	["Android Tablets", 9],#10
	["Window Tablets", 9],#11
	["Ipads", 9],#12
	["Phone", 1]#13
]

product_list = [
	#GAMING
	[2,11,"GIGABYTE Aero", 2299, 4, 100, "15X v8-BK4 15.6' Thin Bezel 144 Hz Intel Core i7 8th Gen 8750H (2.20 GHz) NVIDIA GeForce GTX 1070 16 GB DDR4-2666 Memory 512 GB SSD Windows 10 Home 64-Bit Gaming Laptop 94.24Wh Huge Battery Capacity X-Rite Pantone Certified", "Sieu dep","Intel® Core™ i7-8750H", "16GB DDR4-2666 Memory", "1TB HDD + 256GB SSD","14.0 (W) x 9.8(D) x 0.78(H) inch", "NVIDIA® GeForce® GTX 1070 Max-Q Design GDDR5 6GB"],
	[5,11,"GIGABYTE P56Xv7-KL4K3", 1890, 4.5, 200,"15.6' 4K/UHD Intel Core i7 7th Gen 7700HQ (2.80 GHz) NVIDIA GeForce GTX 1070 16 GB Memory 256 GB SSD 1 TB HDD Windows 10 Home 64-Bit Gaming Laptop", "Good for gaming","Intel Core i7 7th Gen 7700HQ (2.80 GHz)", "16 GB", "Memory 1 TB HDD 256 GB SSD", "15.6' 4K/UHD 3840 x 2160 Wide viewing angle anti-glare display LCD", "GeForce GTX 1070 8 GB GDDR5" ],
	[2,10,"MSI GF62 7RE-2025", 1098, 5, 50, "15.6' FHD Intel Core i7-7700HQ 16 GB DDR4 SDRAM 1 TB HDD NVIDIA GeForce GTX 1050 Ti Windows 10 Gaming Laptop", "Gaming dang cap", "Intel Core i7-7700HQ 2.80 GHz", 	"16 GB", "Memory 1 TB HDD", "15.6' FHD (1920 x 1080) Display w/ True Color Tech" , "NVIDIA GeForce GTX 1050Ti"],
	[4,2,"ASUS FX502VM-AS73", 1049, 5, 15, "Gaming Laptop Intel Core i7 7th Gen 7700HQ (2.80 GHz) 16 GB DDR4 Memory 1 TB HDD 128 GB SSD NVIDIA GeForce GTX 1060 3 GB GDDR5 VR Ready 15.6' Windows 10 Home 64-Bit", "Asus dang cap", "Intel Core i7-7700HQ 2.8 GHz (Turbo up to 3.8 GHz)", "16GB", "Fast 128 GB SSD combined with Large 1 TB 5400 RPM HDD", "15.6 Inch Full HD Displas", "Powerful NVIDIA GeForce GTX 1060 3 GB discrete graphics"],
	[5,1,"Alienware 17 R4 AW17R4-7345SLV", 1749, 4.5, 20, "17.3' Intel Core i7 7th Gen 7700HQ (2.80 GHz) NVIDIA GeForce GTX 1070 16 GB Memory 1 TB HDD Windows 10 Home 64-Bit Gaming Laptop", "Nguoi ngoai hanh tinh","Intel Core i7 7th Gen 7700HQ (2.80 GHz)", "16BG", "Memory 1 TB HDD", "17.3' 1920 x 1080 IPS Anti-Glare 300-nits Display","GeForce GTX 1070 8 GB GDDR5"],
	[4,1,"DELL Laptop XPS XPS9370-7040SLV", 1999, 1, 25, "Intel Core i7 8th Gen 8550U (1.80 GHz) 16 GB Memory 1 TB PCIe SSD Intel UHD Graphics 620 13.3' Touchscreen Windows 10 Home 64-Bit", "So 1 the gioi", "Intel Core i7 8th Gen 8550U (1.80 GHz)", "16GB", "Memory 1 TB PCIe SSD", "3840 x 2160 Touchscreen", "Intel UHD Graphics 620"],
	[4,6,"HP Laptop ProBook 450 G5", 758, 2.3, 10, "Intel Core i5 8th Gen 8250U (1.60 GHz) 8 GB Memory 256 GB SSD Intel UHD Graphics 620 15.6' Windows 10 Pro 64-Bit", "HP probook do may pa", "Intel Core i5 8th Gen 8250U (1.60 GHz)", "8GB", "Memory 256 GB SSD", "1920 x 1080", "Intel UHD Graphics 620"],
	[5,2,"ASUS VivoBook S510", 865, 2, 15, "15.6' Full HD Thin and Portable Laptop, Intel Core i7-8550U 1.8 GHz Processor, NVIDIA GeForce MX150 2 GB, 8 GB DDR4 RAM, 256 GB M.2 SSD + 1 TB HDD, Windows 10 Signature Edition, ASUS NanoEdge Display", "Vivu vivu hihi", "Intel Core i7-8550U 1.8 GHz (Turbo up to 4.0 GHz) Processor", "8GB DDR4", "256 GB M.2 SSD + 1 TB HDD combo", "15.6' Full HD WideView color rich display with up to 178 degree viewing angle optimized for entertainment", "NVIDIA GeForce MX150 graphics" ]
]

user_list = [
	["user01","user01@gmail.com", "01234567891", "user1 city", "user1 address", "user01"],
	["user02","user02@gmail.com", "01234567892", "user2 city", "user2 address", "user02"],
	["user03","user03@gmail.com", "01234567893", "user3 city", "user3 address", "user03"],
	["user04","user04@gmail.com", "01234567894", "user4 city", "user4 address", "user04"]
]

admin_list = [
	["admin01","admin01@gmail.com", "01234567891", "admin1 company", "admin1 address", "admin01"],
	["admin02","admin02@gmail.com", "01234567892", "admin2 company", "admin2 address", "admin02"],
	["admin03","admin03@gmail.com", "01234567893", "admin3 company", "admin3 address", "admin03"],
]

existing_nameBrand = Brand.all.map { |b| b.name }
existing_nameCategory = Category.all.map { |c| c.name }
existing_nameProduct = Product.all.map {|p| p.name}
existing_nameUser = User.all.map {|u| u.name}
existing_nameAdmin = Admin.all.map {|a| a.name}

def seed_product_image(file_name)
	File.open(File.join(Rails.root, "/AllECMImage/Product/#{file_name}.jpg"))
end

def seed_brand_image(file_name)
	File.open(File.join(Rails.root, "/AllECMImage/Brand/#{file_name}.jpg"))
end

admin_list.each do |n, e, ph, c, a, pass|
	unless existing_nameAdmin.include?(n)
		Admin.create(name: n, email: e, phone: ph, company: c, address: a, password: pass)
	end
end

user_list.each do |n, e, ph, c, a, pass|
	unless existing_nameUser.include?(n)
		User.create(name: n, email: e, phone: ph, city: c, address: a, password: pass)
	end
end

product_list.each do |categoryID, brandID, n, pr, w, s, det, des, chip, r, memo, dis, gpu | 
	unless existing_nameProduct.include?(n)
		Product.create(category_id: categoryID, brand_id: brandID, name: n, price: pr , weight: w, stock: s, detail: det, description: des, cpu: chip, ram: r, memory: memo, display: dis, gpu: gpu, view: rand(1..10000))
	end
end

listProduct = Product.all
listProduct.each do |p|
	p.update(image: seed_product_image(p.id.to_s))
end


brand_list.each do |n, d|
	unless existing_nameBrand.include?(n)
		Brand.create(name: n, description: d)
	end
end

listBrand = Brand.all
listBrand.each do |b|
	b.update(image: seed_brand_image(b.id.to_s))
end


category_list.each do |n, co|
	unless existing_nameCategory.include?(n)
		Category.create(name: n, childof: co)
	end
end