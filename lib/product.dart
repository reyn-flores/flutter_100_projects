import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String imageUrl;
  final String name;
  final double price;
  final String category;
  final String description;

  const Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
  });

  @override
  List<Object?> get props => [name];
}

List<Product> mockProductList = [
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Wireless Bluetooth Earbuds',
    price: 59.99,
    category: 'Electronics',
    description:
        'High-quality wireless earbuds with noise-cancellation and long battery life',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Smartphone',
    price: 699.99,
    category: 'Electronics',
    description:
        'Latest model smartphone with advanced features and high resolution display',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Running Shoes',
    price: 89.99,
    category: 'Footwear',
    description: 'Comfortable and durable running shoes for all terrains',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Water Bottle',
    price: 14.99,
    category: 'Accessories',
    description: 'Eco-friendly reusable water bottle with 1-liter capacity',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Laptop Backpack',
    price: 49.99,
    category: 'Accessories',
    description:
        'Stylish and spacious backpack with padded compartment for laptops up to 15 inches',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Digital Camera',
    price: 399.99,
    category: 'Electronics',
    description:
        'Compact digital camera with high resolution and multiple shooting modes',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Yoga Mat',
    price: 29.99,
    category: 'Fitness',
    description: 'Non-slip yoga mat with extra thickness for added comfort',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Electric Toothbrush',
    price: 39.99,
    category: 'Personal Care',
    description:
        'Rechargeable electric toothbrush with multiple brushing modes',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Gaming Headset',
    price: 79.99,
    category: 'Electronics',
    description:
        'High-quality gaming headset with surround sound and noise-cancelling microphone',
  ),
  const Product(
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Bluetooth Speaker',
    price: 49.99,
    category: 'Electronics',
    description:
        'Portable Bluetooth speaker with powerful sound and long battery life',
  ),
];
