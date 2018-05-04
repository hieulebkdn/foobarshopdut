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
	["All-in-one Desktop", 6],#7
	["Gaming Desktop", 6],#8
	["Tablets", 1],#9
	["Ipad", 9],#10
	["Android Tablets", 9],#11
	["Other Tablets", 9],#12
	["Phone", 1]#13
]

20.times do |n|
	content = Faker::Lorem.sentence(5)
	rating = rand(2..4)
	product_id = rand(1..7)
	reviewer_name = Faker::Name.name
	Review.create(content: content, rating: rating, product_id: product_id, reviewer_name: reviewer_name)
end

30.times do |n|
	id = n
	product_id = rand(1..14)
	quantity = rand(1..10)
	order_id = 1
	LineItem.create(id: id, product_id: product_id, quantity: quantity, order_id: order_id)

end

product_list = [
	[2,11,"GIGABYTE Aero", 2299, 4, 100, "15X v8-BK4 15.6' Thin Bezel 144 Hz Intel Core i7 8th Gen 8750H (2.20 GHz) NVIDIA GeForce GTX 1070 16 GB DDR4-2666 Memory 512 GB SSD Windows 10 Home 64-Bit Gaming Laptop 94.24Wh Huge Battery Capacity X-Rite Pantone Certified", "Sieu dep","Intel® Core™ i7-8750H", "16GB DDR4-2666 Memory", "1TB HDD + 256GB SSD","14.0 (W) x 9.8(D) x 0.78(H) inch", "NVIDIA® GeForce® GTX 1070 Max-Q Design GDDR5 6GB"],
	[5,11,"GIGABYTE P56Xv7-KL4K3", 1890, 4.5, 200,"15.6' 4K/UHD Intel Core i7 7th Gen 7700HQ (2.80 GHz) NVIDIA GeForce GTX 1070 16 GB Memory 256 GB SSD 1 TB HDD Windows 10 Home 64-Bit Gaming Laptop", "Good for gaming","Intel Core i7 7th Gen 7700HQ (2.80 GHz)", "16 GB", "Memory 1 TB HDD 256 GB SSD", "15.6' 4K/UHD 3840 x 2160 Wide viewing angle anti-glare display LCD", "GeForce GTX 1070 8 GB GDDR5" ],
	[2,10,"MSI GF62 7RE-2025", 1098, 5, 50, "15.6' FHD Intel Core i7-7700HQ 16 GB DDR4 SDRAM 1 TB HDD NVIDIA GeForce GTX 1050 Ti Windows 10 Gaming Laptop", "Gaming dang cap", "Intel Core i7-7700HQ 2.80 GHz", 	"16 GB", "Memory 1 TB HDD", "15.6' FHD (1920 x 1080) Display w/ True Color Tech" , "NVIDIA GeForce GTX 1050Ti"],
	[4,2,"ASUS FX502VM-AS73", 1049, 5, 15, "Gaming Laptop Intel Core i7 7th Gen 7700HQ (2.80 GHz) 16 GB DDR4 Memory 1 TB HDD 128 GB SSD NVIDIA GeForce GTX 1060 3 GB GDDR5 VR Ready 15.6' Windows 10 Home 64-Bit", "Asus dang cap", "Intel Core i7-7700HQ 2.8 GHz (Turbo up to 3.8 GHz)", "16GB", "Fast 128 GB SSD combined with Large 1 TB 5400 RPM HDD", "15.6 Inch Full HD Displas", "Powerful NVIDIA GeForce GTX 1060 3 GB discrete graphics"],
	[5,1,"Alienware 17 R4 AW17R4-7345SLV", 1749, 4.5, 20, "17.3' Intel Core i7 7th Gen 7700HQ (2.80 GHz) NVIDIA GeForce GTX 1070 16 GB Memory 1 TB HDD Windows 10 Home 64-Bit Gaming Laptop", "Nguoi ngoai hanh tinh","Intel Core i7 7th Gen 7700HQ (2.80 GHz)", "16BG", "Memory 1 TB HDD", "17.3' 1920 x 1080 IPS Anti-Glare 300-nits Display","GeForce GTX 1070 8 GB GDDR5"],
	[4,1,"DELL Laptop XPS XPS9370-7040SLV", 1999, 1, 25, "Intel Core i7 8th Gen 8550U (1.80 GHz) 16 GB Memory 1 TB PCIe SSD Intel UHD Graphics 620 13.3' Touchscreen Windows 10 Home 64-Bit", "So 1 the gioi", "Intel Core i7 8th Gen 8550U (1.80 GHz)", "16GB", "Memory 1 TB PCIe SSD", "3840 x 2160 Touchscreen", "Intel UHD Graphics 620"],
	[4,6,"HP Laptop ProBook 450 G5", 758, 2.3, 10, "Intel Core i5 8th Gen 8250U (1.60 GHz) 8 GB Memory 256 GB SSD Intel UHD Graphics 620 15.6' Windows 10 Pro 64-Bit", "HP probook do may pa", "Intel Core i5 8th Gen 8250U (1.60 GHz)", "8GB", "Memory 256 GB SSD", "1920 x 1080", "Intel UHD Graphics 620"],
	[5,2,"ASUS VivoBook S510", 865, 2, 15, "15.6' Full HD Thin and Portable Laptop, Intel Core i7-8550U 1.8 GHz Processor, NVIDIA GeForce MX150 2 GB, 8 GB DDR4 RAM, 256 GB M.2 SSD + 1 TB HDD, Windows 10 Signature Edition, ASUS NanoEdge Display", "Vivu vivu hihi", "Intel Core i7-8550U 1.8 GHz (Turbo up to 4.0 GHz) Processor", "8GB DDR4", "256 GB M.2 SSD + 1 TB HDD combo", "15.6' Full HD WideView color rich display with up to 178 degree viewing angle optimized for entertainment", "NVIDIA GeForce MX150 graphics" ],
	[2,10,"MSI GT83 Titan 8RG",4999,5.5,10,"Up to 8th Gen. Intel® Core™ i9 Processor, GeForce® GTX 1080 with 8GB GDDR5X SLI","Best Gaming Laptop","Intel® Core™ i9 Processor","32GB DDR5 RAM","512GB M.2 SSD + 1 TB HDD","18.4\"\ FHD (1920x1080), IPS-Level","GeForce® GTX 1080 with 8GB GDDR5X SLI"],
	[2,10,"MSI GS65 Stealth Thin 8RF",2399,1.9,10,"Up to 8th Gen. Intel® Core™ i7 Processor, GeForce® GTX 1070 with 8GB GDDR5","Best Gaming Laptop","Intel® HM370","DDR4-2400 DDR4-2666, 2 Slots, Max 32GB,","1x M.2 SSD slot (NVMe PCIe Gen3), 1x M.2 SSD Combo (NVMe PCIe Gen3 / SATA )","15.6\"\ FHD (1920x1080), 144Hz, 7ms, IPS-Level","GeForce® GTX 1070 with 8GB GDDR5"],
	[2,10,"GP73 Leopard 8RE",2199,2.7,15,"Up to 8th Gen. Intel® Core™ i7 Processor, GeForce® GTX 1060 with 6GB GDDR5", "Gaming Laptop","Intel® HM370","DDR4-2400, DDR4-2666 2 Slots Max 32GB","1x M.2 SSD slot (NVMe PCIe Gen3), 1x M.2 SSD Combo (NVMe PCIe Gen3 / SATA ), 1x 2.5\"\ SATA HDD","17.3\"\ FHD (1920x1080), 120Hz, 3ms, Wide-View","GeForce® GTX 1060 with 6GB GDDR5"],
	[2,2,"ASUS ROG-GL553VD",2000,2.5,9,"Intel® Core™ i7 7700HQ Processor, NVIDIA GeForce GTX 1050 , with 2GB/4GB GDDR5 VRAM","ASUS Gaming Laptop","Intel® HM175 Express Chipset","up to 32 GB SDRAM, 2 x SO-DIMM socket","128GB/256GB/512GB SSD SATA3, 1TB 5400RPM SSH", "FHD (16:9) (1920x1080) 15.6\"\ Anti-Glare with 45% NTSC LED backlit Panel 60Hz","NVIDIA GeForce GTX 1050 , with 2GB/4GB GDDR5 VRAM"],
	[2,2,"ASUS ROG-G752VM",2499,4.06,8,"Intel® Core™ i7 6700HQ Processor, NVIDIA GeForce GTX 1060 , with 6GB VRAM", "ASUS Gaming Laptop", "Intel® CM236 Express Chipset","DDR4 2400MHz SDRAM, up to 64 GB SDRAM","2TB 5400RPM SATA HDD, 128GB/256GB PCIE Gen3X4 SSD (RAID0)","17.3\"\ (16:9) LED backlit FHD (1920x1080) Anti-Glare Panel with 72% NTSC with G-Sync","NVIDIA GeForce GTX 1060 , with 6GB VRAM"],
	[2,2,"ASUS ROG-Strix-SKT-T1-Hero-Edition",2899,2.3,5,"Intel® Core™ i7 7700HQ Processor, NVIDIA GeForce GTX 1060 , with 6GB GDDR5 VRAM", "ASUS Gaming Laptop","Intel® HM175 Express Chipset", "16 GB","1TB 5400RPM SSH-8GB, 256GB PCIE Gen3X4 SSD","15.6\"\ (16:9) LED backlit FHD (1920x1080) 120Hz Anti-Glare Panel with 72% NTSC with 178˚ wide-viewing angle display","NVIDIA GeForce GTX 1060 , with 6GB GDDR5 VRAM"],
	[2,9,"ACER Predator Triton 700",5199,2.2,5,"Intel® Core™ i7-7700HQ processor Quad-core 2.80 GHz, NVIDIA® GeForce® GTX 1080 with 8 GB Dedicated Memory","ACER Gaming Laptop","Intel® Core™ i7-7700HQ processor Quad-core 2.80 GHz","32 GB, DDR4 SDRAM", "512 GB SSD","15.6\"\ Full HD (1920 x 1080) 16:9","NVIDIA® GeForce® GTX 1080 with 8 GB Dedicated Memory"],
	##### Products for APPLE
	[13,5,"Apple iPhone 8 Plus 4G LTE Unlocked",849.9,0.5,20,"Nano SIM, Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, Apple A11 Bionic","Apple iPhone 8 Plus","Apple A11 Bionic","3GB","64GB","5.5\"\ ","None"],
	[13,5,"Apple iPhone 6s 4G LTE Unlocked",249.9,0.5,20,"4G LTE, Nano SIM, Touch ID fingerprint sensor, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor","IPHONE 6S 16GB","Apple A9","2GB","16GB","4.7\"\ ","None"],
	[13,5,"Apple iPhone 7 PLUS 128GB",940,0.6,20,"IP67 certified - dust and water resistant, Water resistant up to 1 meter and 30 minutes","iPhone 7PLUS 128G","A10 Fusion chip with 64-bit architecture Embedded M10 motion coprocessor","3GB","128GB","5.5\"\ 1080 x 1920","None"],
	[1,5,"Apple 13.3\"\ MacBook Air",1199,1.5,10,"13 inch MacBook Air Laptop (2017 Model) comes with 1.8 GHz Dual-Core Intel Core i5 Processor (Turbo Boost up to 2.9 GHz)","Apple MacBook Air","intel","8 GB","128 GB SSD","1440x900 12 inches","None"],
	[1,5,"Apple MacBook Pro MD101LL/A",509,1.6,10,"Intel HD Graphics 4000, 4 GB DDR3 SDRAM","Apple MacBook Air","Intel HD Graphics 4000","4 GB DDR3 SDRAM","128 GB","1280x800 13.3 inches","None"],
	[1,5,"Apple MacBook Air MJVM2LL/A",755,1.6,10,"1.6 GHz Intel Core i5, 128 GB flash_memory_solid_state","Apple MacBook Air","1.6 GHz Intel Core i5","8 GB DDR3 SDRAM","128 GB flash_memory_solid_state","1366 x 768 11.6 inches","None"],
	[9,5,"Apple iPad 9.7\"\ Retina",299,0.9,10,"iOS 11, 9.7-inch Retina display has the detail and size to really bring them to life","Apple Ipad","A9 chip with 64-bit desktop-class architecture","4GB","32 GB","9.7\"\ ","None"],
	[9,5,"Apple iPad mini 4",359,0.9,10,"Mighty. Small., Ridiculously light. Seriously thin.","Apple IPad","A9 chip","4GB","32GB","7.9\"\ ","None"],
	[9,5,"Apple iPad with WiFi, 32GB, Gold (2017 Model)",279,0.8,10,"9.7-inch Retina display, wide color and true tone, A9 third-generation chip with 64-bit architecture","Apple IPad","A9 chip with 64-bit","3GB","32GB","9.7\"\ ","None"],
	#### Products for SAMSUNG
	[1,3,"Samsung Galaxy J7 Prime G610M",220,0.3,5,"5.5-inch IPS LCD Capacitive Touchscreen, 1080 x 1920 pixel resolution,Android v6.0 Marshmallow, Chipset: Exynos 7870 Octa, Processor: Octa-Core 1.6 GHz Cortex-A53","SAMSUNG Smartphone","Exynos 7870 Octa","3GB","16GB","5.5\"\ 1080 x 1920","None"],
	[1,3,"Samsung Galaxy Note 8 Dual SIM Unlocked",834.9,0.2,10,"Exynos 8895 CPU, Octa-core (4 x 2.3 GHz & 4 x 1.7 GHz), Dual LED Rear Camera (12 MP+12 MP ) + 8 MP Front Camera","Samsung Smartphone","Exynos 8895","6GB","64GB","6.3\"\ 2960 x 1440","None"],
	[1,3,"Samsung Galaxy S9 4G LTE",724.9,0.2,14,"Octa-Core Processor (2.8 GHz + 1.7 GHz), Dual Pixel PDAF Rear Camera (12 MP) + 8 MP Front-Facing Camera","Samsung Smartphone","Octa-core","4GB","64GB","5.8\"\ 2960 x 1440","None"],
	[1,3,"Samsung Galaxy S6 G920V 64GB Unlocked",279.9,0.2,16,"5.1-inch Super AMOLED Capacitive Touchscreen with Corning Gorilla Glass 4, Android OS, Exynos 7420 Octa Chipset, Octa-Core Processor","Samsung Smartphone","Exynos 7420 Octa","3GB","64GB","5.1\"\ 2560 x 1440","None"],
	#### Products for BLACKBERRY
	[1,4,"BlackBerry PRIV STV100-2 32GB Unlocked",219.9,0.2,20,"5.4-inch AMOLED Capacitive Touchscreen, Android v5.1, Qualcomm Snapdragon 808, Hexa-Core (4x1.4 GHz & 2x1.8 GHz) Processor, Adreno 418 GPU, 18 MP Camera + 2 MP Front Camera","BlackBerry Smartphone","Hexa-Core (Quad-Core 1.4 GHz Cortex-A53 & Dual-Core 1.8 GHz Cortex-A57)","3GB","32GB","1440 x 2560 pixels","None"],
	[1,4,"BlackBerry Curve 9320 3G Unlocked",65.9,0.1,30,"3.2 MP Rear Camera, 512MB RAM 512 MB ROM Up to 32GB MicroSD (TF Card), Lithium Ion Battery 1450mAh","BlackBerry Smartphone","TFT","512MB","512MB","2.44\"\ 320 x 240","None"],
	[1,4,"BlackBerry KEYone 64GB",679,0.15,10,"4.5\"\ IPS LCD capacitive touchscreen, Corning Gorilla Glass 4, 64GB Storage, 4GB RAM, microSD slot : up to 2TB","BlackBerry Smartphone","Qualcomm MSM8953 Snapdragon 625","4GB","64GB","4.5\"\ 1620 x 1080","None"],
	#### Products for HP
	[1,6,"HP Laptop 250 G6 (1NW57UT#ABA)",575.9,2,15,"Intel Core i5 7th Gen 7200U (2.50 GHz), 8 GB Memory 256 GB SSD, Intel HD Graphics 620","HP Laptop","Intel HD Graphics 620","8 GB DDR4","256 GB SSD","15.6\"\ ","Intel HD Graphics 620"],
	[1,6,"HP Grade B Laptop 840 G1",316.86,1.8,5,"Intel Core i7 4th Gen 4600U (2.10 GHz),8 GB Memory 128 GB SSD","HP Laptop","Intel Core i7-4600U 2.1 GHz","8 GB","128 GB SSD","14 inch","Intel Core i7 4th Gen"],
	[1,6,"HP Spectre x360 15t Premium Convertible 2-in-1",1549.9,2.1,10,"8th-Gen Intel Core i7-8550U (1.8GHz, 8MB cache) + NVIDIA GeForce MX150 2GB","HP Laptop","Intel Core i7","8 GB","256GB SSD","15.6\"\ UHD","NVIDIA GeForce MX150 Graphics 2GB"],
	[1,6,"HP Pavilion 14-q010nr Chromebook",499.9,2.1,10,"Intel 4th Gen Haswell Celeron 2955U(1.40GHz), 2GB Memory 16GB SSD","HP Laptop","Intel 4th Gen Haswell Celeron 2955U(1.40GHz)","2 GB DDR3","128GB SSD","14\"\ FullHD","Intel HD Graphics"]
	#### Products for SONY
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

# def seed_product_image(file_name)
# 	File.open(File.join(Rails.root, "/AllECMImage/Product/#{file_name}.jpg"))
# end

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