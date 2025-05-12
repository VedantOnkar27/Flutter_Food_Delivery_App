// widgets/cart_item_tile.dart
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import 'counter_button.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;
  final Function() onRemove;

  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Food image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cartItem.foodItem.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 24),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            // Food details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.foodItem.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${cartItem.foodItem.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Counter
            CounterButton(
              count: cartItem.quantity,
              onIncrement: () => onQuantityChanged(cartItem.quantity + 1),
              onDecrement: () => onQuantityChanged(cartItem.quantity - 1),
            ),

            // Remove button
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
