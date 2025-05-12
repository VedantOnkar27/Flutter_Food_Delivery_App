// screens/food_details_screen.dart
import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../widgets/counter_button.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodItem foodItem;
  final Function(FoodItem) onAddToCart;

  const FoodDetailsScreen({
    super.key,
    required this.foodItem,
    required this.onAddToCart,
  });

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App bar with food image
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.foodItem.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 80),
                  );
                },
              ),
            ),
          ),

          // Food details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.foodItem.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '\$${widget.foodItem.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Rating and prep time
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(
                        ' ${widget.foodItem.rating}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, color: Colors.grey),
                      Text(
                        ' ${widget.foodItem.prepTimeMinutes} min',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Tags
                  Wrap(
                    spacing: 8,
                    children: widget.foodItem.tags.map((tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.grey[200],
                    )).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.foodItem.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Ingredients (mock data)
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Premium ingredients used to ensure the best taste and quality.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Quantity counter
            CounterButton(
              count: _quantity,
              onIncrement: () {
                setState(() {
                  _quantity++;
                });
              },
              onDecrement: () {
                if (_quantity > 1) {
                  setState(() {
                    _quantity--;
                  });
                }
              },
            ),
            const SizedBox(width: 16),

            // Add to cart button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart and notify user
                  for (var i = 0; i < _quantity; i++) {
                    widget.onAddToCart(widget.foodItem);
                  }
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'ADD TO CART - \$${(widget.foodItem.price * _quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}