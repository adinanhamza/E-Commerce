import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshop/view/bottombar/bottom.dart';
import 'package:onlineshop/view/login&signup/login.dart';
import 'package:onlineshop/view/splash/widget.dart';
import 'package:onlineshop/viewmodel/authpro.dart';
import 'package:provider/provider.dart'; // Adjust import path as needed

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      if (authProvider.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/shopping_bg.jpg',
            ), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          // Dark overlay for better text readability
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Background Decorative Elements
              buildDecorativeCircles(),

              // Main Content
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),

                    // Logo Section
                    buildAppLogo(),
                    const SizedBox(height: 50),

                    // App Name
                    buildAppTitle(),
                    const SizedBox(height: 60),

                    // Glass Card with Features
                    buildFeatureCard(),

                    const Spacer(flex: 2),

                    // Loading Indicator
                    buildLoadingIndicator(),
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

                    const SizedBox(height: 40),

                    // Version Info
                    buildVersionInfo(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
