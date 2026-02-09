require "open-uri"

puts "Cleaning up existing products..."
Product.destroy_all

products_data = [
  {
    name: "Horizon Headphones",
    description: "Experience pure sound with industry-leading active noise cancellation. Features a sleek matte black finish and 40-hour battery life.",
    price: 299.99,
    stock: 25,
    image_url: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=2070&auto=format&fit=crop"
  },
  {
    name: "Luna Smartwatch",
    description: "A minimalist timepiece that keeps you connected without the clutter. Brushed silver casing with a premium brown leather strap.",
    price: 199.50,
    stock: 50,
    image_url: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1999&auto=format&fit=crop"
  },
  {
    name: "Arc Desk Lamp",
    description: "Precision lighting for the modern workspace. Minimalist curved design made of aluminum with adjustable color temperatures.",
    price: 89.00,
    stock: 40,
    image_url: "https://images.unsplash.com/photo-1534073828943-f801091bb18c?q=80&w=2052&auto=format&fit=crop"
  },
  {
    name: "Slate Keyboard",
    description: "Tactile feedback meets acoustic perfection. Mechanical keys in a dark walnut case with cream-colored keycaps.",
    price: 159.99,
    stock: 15,
    image_url: "https://images.unsplash.com/photo-1511467687858-23d96c32e4ae?q=80&w=2070&auto=format&fit=crop"
  },
  {
    name: "Voyager Backpack",
    description: "Water-resistant canvas and leather accents for the urban explorer. Includes a padded laptop sleeve and hidden security pockets.",
    price: 129.00,
    stock: 30,
    image_url: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=1887&auto=format&fit=crop"
  }
]

puts "Seeding products..."
products_data.each do |data|
  image_url = data.delete(:image_url)
  product = Product.create!(data)
  
  begin
    file = URI.open(image_url)
    product.image.attach(io: file, filename: "#{product.name.parameterize}.jpg", content_type: "image/jpeg")
    puts "Created #{product.name} with image."
  rescue => e
    puts "Successfully created #{product.name}, but failed to attach image: #{e.message}"
  end
end

puts "Seeding complete! Created #{Product.count} products."
