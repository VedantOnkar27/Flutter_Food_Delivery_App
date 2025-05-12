// widgets/counter_button.dart
import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final int count;
  final Function() onIncrement;
  final Function() onDecrement;

  const CounterButton({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Decrement button
          InkWell(
            onTap: count > 1 ? onDecrement : null,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: count > 1 ? Colors.grey[200] : Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Icon(
                Icons.remove,
                color: count > 1 ? Colors.black : Colors.grey,
                size: 16,
              ),
            ),
          ),

          // Count display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Increment button
          InkWell(
            onTap: onIncrement,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
