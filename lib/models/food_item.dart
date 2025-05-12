// models/food_item.dart
class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String> tags;
  final double rating;
  final int prepTimeMinutes;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.tags = const [],
    this.rating = 0.0,
    this.prepTimeMinutes = 15,
  });

  // Static food data
  static List<FoodItem> sampleItems = [
    FoodItem(
      id: '1',
      name: 'Classic Burger',
      description: 'Juicy beef patty with cheese, lettuce, tomato, and our special sauce',
      price: 8.99,
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Burgers',
      tags: ['Beef', 'Popular'],
      rating: 4.5,
      prepTimeMinutes: 15,
    ),
    FoodItem(
      id: '2',
      name: 'Chicken Wrap',
      description: 'Grilled chicken with fresh veggies and creamy sauce in a tortilla wrap',
      price: 7.49,
      imageUrl: 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Wraps',
      tags: ['Chicken', 'Healthy'],
      rating: 4.2,
      prepTimeMinutes: 10,
    ),
    FoodItem(
      id: '3',
      name: 'Margherita Pizza',
      description: 'Traditional Italian pizza with tomato sauce, mozzarella, and fresh basil',
      price: 12.99,
      imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Pizza',
      tags: ['Vegetarian', 'Italian'],
      rating: 4.8,
      prepTimeMinutes: 20,
    ),
    FoodItem(
      id: '4',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with Caesar dressing, croutons, and parmesan cheese',
      price: 6.99,
      imageUrl: 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Salads',
      tags: ['Healthy', 'Fresh'],
      rating: 4.0,
      prepTimeMinutes: 5,
    ),
    FoodItem(
      id: '5',
      name: 'French Fries',
      description: 'Crispy golden fries seasoned with our special spice blend',
      price: 3.49,
      imageUrl: 'https://images.unsplash.com/photo-1576107232684-1279f390859f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Sides',
      tags: ['Vegetarian', 'Popular'],
      rating: 4.7,
      prepTimeMinutes: 8,
    ),
    FoodItem(
      id: '6',
      name: 'Chocolate Milkshake',
      description: 'Rich and creamy chocolate milkshake topped with whipped cream',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Drinks',
      tags: ['Sweet', 'Cold'],
      rating: 4.6,
      prepTimeMinutes: 5,
    ),
    FoodItem(
      id: '7',
      name: 'Chicken Biryani',
      description: 'Fragrant rice dish with marinated chicken, herbs, and spices',
      price: 10.99,
      imageUrl: 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Main Course',
      tags: ['Chicken', 'Spicy'],
      rating: 4.9,
      prepTimeMinutes: 25,
    ),
    FoodItem(
      id: '8',
      name: 'Veggie Bowl',
      description: 'Healthy mix of fresh vegetables, quinoa, and avocado with light dressing',
      price: 9.49,
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1202&q=80',
      category: 'Healthy',
      tags: ['Vegetarian', 'Vegan', 'Gluten-Free'],
      rating: 4.3,
      prepTimeMinutes: 12,
    ),
  ];

  // Get all food categories
  static List<String> getCategories() {
    return sampleItems
        .map((item) => item.category)
        .toSet()
        .toList();
  }

  // Get food items by category
  static List<FoodItem> getItemsByCategory(String category) {
    return category == 'All'
        ? sampleItems
        : sampleItems.where((item) => item.category == category).toList();
  }
}
