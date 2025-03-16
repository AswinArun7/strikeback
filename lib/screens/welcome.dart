import 'package:flutter/material.dart';

// Inclined rectangle painter
class InclinedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(0, 255, 255, 0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, 300, 50));

    List<Offset> positions = [
      Offset(size.width * 0.7, size.height * 0.1),
      Offset(size.width * 0.93, size.height * 0.15),
      Offset(size.width * 0.99, size.height * 0.001),
      Offset(size.width * 1.1, size.height * 0.1),
    ];

    List<Size> sizes = [
      Size(size.width * 0.9, size.height * 0.07),
      Size(size.width * 1, size.height * 0.08),
      Size(size.width * 1, size.height * 0.1),
      Size(size.width * 1.1, size.height * 0.03),
    ];

    for (int i = 0; i < positions.length; i++) {
      double rectWidth = sizes[i].width;
      double rectHeight = sizes[i].height;
      Offset pos = positions[i];

      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(120 * 3.14159 / 180); // Rotate 120 degrees
      canvas.drawRect(Rect.fromLTWH(0, 0, rectWidth, rectHeight), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Background color and custom painting can be added here
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.yellow,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    _buildBackButton(context),
                    const SizedBox(height: 40),
                    _buildWelcomeText(),
                    const SizedBox(height: 400),
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 24),
                    _buildSignInButton(),
                    const SizedBox(height: 12),
                    _buildCreateAccountButton(context),
                    const SizedBox(height: 16),
                    _buildDecorationElements(),
                  ],
                ),
              ),
              // Add CustomPaint widget to draw inclined rectangles
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    painter: InclinedRectanglePainter(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const Text(
          "Back",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Sign in to continue",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return SizedBox(
      height: 45,
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Colors.black54,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
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
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create_account');
          },
          child: const Text(
            "Create An Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDecorationElements() {
    return Container(
      height: 4,
      width: 40,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
