// screens/cart_screen.dart
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/cart_item_tile.dart';
import 'order_confirmation_screen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final Function(List<CartItem>) onCartUpdated;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onCartUpdated,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    // Make a deep copy of the cart items
    _cartItems = List.from(widget.cartItems);
  }

  double get _subtotal => _cartItems.fold(
      0, (sum, item) => sum + item.totalPrice);

  double get _deliveryFee => _subtotal > 0 ? 2.99 : 0;

  double get _tax => _subtotal * 0.1; // 10% tax

  double get _total => _subtotal + _deliveryFee + _tax;

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity = newQuantity;
      }
    });
    widget.onCartUpdated(_cartItems);
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
    widget.onCartUpdated(_cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: _cartItems.isEmpty
          ? _buildEmptyCart()
          : _buildCartItems(),
      bottomNavigationBar: _cartItems.isEmpty
          ? null
          : _buildCheckoutBar(),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items to get started',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Browse Menu'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Column(
      children: [
        // Cart items list
        Expanded(
          child: ListView.builder(
            itemCount: _cartItems.length,
            itemBuilder: (context, index) {
              return CartItemTile(
                cartItem: _cartItems[index],
                onQuantityChanged: (newQuantity) {
                  _updateQuantity(index, newQuantity);
                },
                onRemove: () {
                  _removeItem(index);
                },
              );
            },
          ),
        ),

        // Order summary
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildSummaryRow('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
              _buildSummaryRow('Delivery Fee', '\$${_deliveryFee.toStringAsFixed(2)}'),
              _buildSummaryRow('Tax (10%)', '\$${_tax.toStringAsFixed(2)}'),
              const SizedBox(height: 8),
              const Divider(),
              _buildSummaryRow(
                'Total',
                '\$${_total.toStringAsFixed(2)}',
                isBold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Theme.of(context).colorScheme.primary : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutBar() {
    return Container(
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
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderConfirmationScreen(
                  cartItems: _cartItems,
                  total: _total,
                  onPlaceOrder: () {
                    setState(() {
                      _cartItems.clear();
                    });
                    widget.onCartUpdated(_cartItems);
                  },
                ),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'PROCEED TO CHECKOUT',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}