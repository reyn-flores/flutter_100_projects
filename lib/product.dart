import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final String category;
  final String description;

  const Product({
    required this.id,
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
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHxwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    name: 'Wireless Bluetooth Earbuds',
    price: 59.99,
    category: 'Electronics',
    description:
        'High-quality wireless earbuds with noise-cancellation and long battery life',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
    name: 'Smartphone',
    price: 699.99,
    category: 'Electronics',
    description:
        'Latest model smartphone with advanced features and high resolution display',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1549049950-48d5887197a0?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D',
    name: 'Running Shoes',
    price: 89.99,
    category: 'Footwear',
    description: 'Comfortable and durable running shoes for all terrains',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1547887537-6158d64c35b3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D',
    name: 'Water Bottle',
    price: 14.99,
    category: 'Accessories',
    description: 'Eco-friendly reusable water bottle with 1-liter capacity',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1519669011783-4eaa95fa1b7d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D',
    name: 'Laptop Backpack',
    price: 49.99,
    category: 'Accessories',
    description:
        'Stylish and spacious backpack with padded compartment for laptops up to 15 inches',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1670984222499-b566bf5cef69?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTN8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D',
    name: 'Digital Camera',
    price: 399.99,
    category: 'Electronics',
    description:
        'Compact digital camera with high resolution and multiple shooting modes',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjB8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D',
    name: 'Yoga Mat',
    price: 29.99,
    category: 'Fitness',
    description: 'Non-slip yoga mat with extra thickness for added comfort',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1682470064830-4fcc743a7f64?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTd8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D',
    name: 'Electric Toothbrush',
    price: 39.99,
    category: 'Personal Care',
    description:
        'Rechargeable electric toothbrush with multiple brushing modes',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1680103221195-ccace68bcd75?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fHNwb3J0cyUyMGNhcnN8ZW58MHx8MHx8fDA%3D',
    name: 'Gaming Headset',
    price: 79.99,
    category: 'Electronics',
    description:
        'High-quality gaming headset with surround sound and noise-cancelling microphone',
  ),
  Product(
    id: const Uuid().v4(),
    imageUrl:
        'https://images.unsplash.com/photo-1642242413390-baee2aed04d6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fHNwb3J0cyUyMGNhcnN8ZW58MHx8MHx8fDA%3D',
    name: 'Bluetooth Speaker',
    price: 49.99,
    category: 'Electronics',
    description:
        'Portable Bluetooth speaker with powerful sound and long battery life',
  ),
];
