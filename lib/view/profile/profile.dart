import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Center(
            child: Text('john.doe@example.com'),
          ),
          const SizedBox(height: 32),
          const ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Personal Information',
          ),
          const Divider(),
          const ProfileMenuItem(
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
          ),
          const Divider(),
          const ProfileMenuItem(
            icon: Icons.favorite_border,
            title: 'Wishlist',
          ),
          const Divider(),
          const ProfileMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Address',
          ),
          const Divider(),
          const ProfileMenuItem(
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
          ),
          const Divider(),
          const ProfileMenuItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      contentPadding: EdgeInsets.zero,
      onTap: () {},
    );
  }
}