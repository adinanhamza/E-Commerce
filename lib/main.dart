import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/firebase_options.dart';
import 'package:onlineshop/view/login&signup/login.dart';
import 'package:onlineshop/viewmodel/authpro.dart';
import 'package:onlineshop/viewmodel/provider.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ECommerceApp());
  
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
  
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingProvider(),
        
        ),
        ChangeNotifierProvider(create: (context) => Authpro(),),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            primary: Colors.indigo,
            // background: Colors.white,
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: AuthScreen(),
      ),
    );
  }
}
