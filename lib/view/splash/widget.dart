import 'package:flutter/material.dart';

Widget _buildFeatureItem({
  required IconData icon,
  required String title,
}) {
  return Column(
    children: [
      Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.25),
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.95),
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildFeatureCard() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 40),
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white.withOpacity(0.2),
      border: Border.all(
        color: Colors.white.withOpacity(0.3),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 25,
          offset: const Offset(0, 12),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFeatureItem(icon: Icons.shopping_cart_outlined, title: 'Easy Shopping'),
        _buildFeatureItem(icon: Icons.local_shipping_outlined, title: 'Fast Delivery'),
        _buildFeatureItem(icon: Icons.security_outlined, title: 'Secure Payment'),
      ],
    ),
  );
}

Widget buildLoadingIndicator() {
  return Column(
    children: [
      Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.25),
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: const CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        'Loading...',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.9),
          letterSpacing: 0.5,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
      ),
    ],
  );
}
Widget buildAppLogo() {
  return Container(
    width: 160,
    height: 160,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.4),
          blurRadius: 40,
          spreadRadius: 10,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 30,
          offset: const Offset(0, 15),
        ),
      ],
    ),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 3,
        ),
      ),
      child: const CircleAvatar(
        radius: 77,
        backgroundImage: AssetImage('assets/applogo.jpg'),
      ),
    ),
  );
}
Widget buildAppTitle() {
  return Column(
    children: [
      Text(
        'Online Shop',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          letterSpacing: -1.5,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      Text(
        'Your Shopping Destination',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.95),
          letterSpacing: 0.5,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    ],
  );
}
Widget buildVersionInfo() {
  return Text(
    'Version 1.0.0',
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white.withOpacity(0.7),
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(0, 1),
          blurRadius: 2,
        ),
      ],
    ),
  );
}
Widget buildDecorativeCircles() {
  return Stack(
    children: [
      Positioned(
        top: 120,
        right: 40,
        child: _buildCircle(120, 0.1),
      ),
      Positioned(
        top: 180,
        left: 20,
        child: _buildCircle(80, 0.08),
      ),
      Positioned(
        bottom: 200,
        right: 80,
        child: _buildCircle(60, 0.12),
      ),
      Positioned(
        bottom: 120,
        left: 40,
        child: _buildCircle(140, 0.06),
      ),
    ],
  );
}
Widget _buildCircle(double size, double opacity) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withOpacity(opacity),
    ),
  );
}




