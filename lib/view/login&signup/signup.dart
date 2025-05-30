import 'package:flutter/material.dart';
import 'package:onlineshop/view/login&signup/login.dart'; // Assuming your login screen file
import 'package:onlineshop/viewmodel/authpro.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
     final pro = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background with Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF667eea),
                  const Color(0xFF764ba2),
                  const Color(0xFFf093fb),
                  const Color(0xFFf5576c),
                ],
                stops: const [0.0, 0.3, 0.7, 1.0],
              ),
            ),
            child: Stack(
              children: [
                // Static Background Circles
               
                
              ],
            ),
          ),
          
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Back Button
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Header Section
                  Center(
                    child: Column(
                      children: [
                        // Logo with Glow Effect
                        Hero(
                          tag: 'appLogo',
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                                BoxShadow(
                                  color: const Color(0xFF667eea).withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 38,
                                backgroundImage: AssetImage('assets/applogo.jpg'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Welcome Text
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -1,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Join us and start your journey today',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Glass Morphism Card
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white.withOpacity(0.15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name Input
                        _buildGlassInput(
                          label: 'Full Name',
                          controller: pro.nameController,
                          hintText: 'Enter your full name',
                          icon: Icons.person_outlined,
                          keyboardType: TextInputType.name,
                        ),

                        const SizedBox(height: 20),

                        // Email Input
                        _buildGlassInput(
                          label: 'Email',
                          controller: pro.emailController,
                          hintText: 'Enter your email',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 20),

                        // Password Input
                        _buildGlassInput(
                          label: 'Password',
                          controller: pro.passwordController,
                          hintText: 'Create a password',
                          icon: Icons.lock_outlined,
                          isPassword: true,
                          isPasswordVisible: pro.isPasswordVisible,
                          onTogglePassword: () {
                             pro.togglePasswordvisi();
                          },
                        ),

                        const SizedBox(height: 20),

                        // Confirm Password Input
                        _buildGlassInput(
                          label: 'Confirm Password',
                          controller: pro.confirmPasswordController,
                          hintText: 'Confirm your password',
                          icon: Icons.lock_outlined,
                          isPassword: true,
                          isPasswordVisible: pro.isConfirmPasswordVisible,
                          onTogglePassword: () {
                           pro.confirmTogglePasswordvisi();
                          },
                        ),

                        const SizedBox(height: 24),

                        // Terms and Conditions Checkbox
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(top: 2),
                              child: Checkbox(
                                value: pro.agreeToTerms,
                                onChanged: (value) {
                                  pro.agreeTo(value!);
                                },
                                activeColor: const Color(0xFF667eea),
                                checkColor: Colors.white,
                                side: BorderSide(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agree to the ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Sign Up Button
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: pro.agreeToTerms
                                  ? [
                                      const Color(0xFF667eea),
                                      const Color(0xFF764ba2),
                                    ]
                                  : [
                                      Colors.grey.withOpacity(0.5),
                                      Colors.grey.withOpacity(0.3),
                                    ],
                            ),
                            boxShadow: pro.agreeToTerms
                                ? [
                                    BoxShadow(
                                      color: const Color(0xFF667eea).withOpacity(0.4),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: pro.agreeToTerms
                                  ? () async{
                                      // Add email/password sign up logic here
                                     final authprovider = Provider.of<AuthProvider>(context, listen: false);
           await authprovider.signUp();

            if (authprovider.getCurrentUser() != null) {
              String? email = authprovider.getCurrentUser()?.email;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Signed up user: ${email ?? "Not sign-up in"}')),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sign-Up Failed")),
              );
            }
                                    }
                                  : null,
                              child: Center(
                                child: pro.isLoading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        'Create Account',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'or sign up with',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Social Login Buttons
                        _buildSocialButtons(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Sign In Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassInput({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    bool isPassword = false,
    bool? isPasswordVisible,
    VoidCallback? onTogglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword ? !(isPasswordVisible ?? false) : false,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 16,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(0.7),
                size: 20,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        (isPasswordVisible ?? true)
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 20,
                      ),
                      onPressed: onTogglePassword,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          color: const Color(0xFF1877F2),
          icon: Icons.facebook,
          onTap: () {},
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          color: Colors.white,
          child: Image.network(
            'https://th.bing.com/th/id/OIP.Kv-wu9w_MHqyz9zJvmvYCAHaHa?cb=iwc2&rs=1&pid=ImgDetMain',
            height: 20,
            width: 20,
          ),
          onTap: () async {
           
          },
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          color: const Color(0xFF10B981),
          icon: Icons.phone_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required Color color,
    IconData? icon,
    Widget? child,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: child ??
              Icon(
                icon,
                color: color == Colors.white ? Colors.grey[600] : Colors.white,
                size: 22,
              ),
        ),
      ),
    );
  }

}