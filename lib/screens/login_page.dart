import 'package:flutter/material.dart';

// Inclined rectangle painter
class InclinedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255), // Semi-transparent white
          Color.fromARGB(0, 255, 255, 0), // Transparent to fully transparent
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, 300, 50)); // Default rect size for the gradient

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
      canvas.rotate(120 * 3.14159 / 180);

      canvas.drawRect(Rect.fromLTWH(0, 0, rectWidth, rectHeight), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Background painter with inclined rectangles
              CustomPaint(
                size: Size(double.infinity, double.infinity),
                painter: InclinedRectanglePainter(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'StrikeBack',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Targeting Drugs, Protecting Lives',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/welcome');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black87,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Log In',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create_account');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black87,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login_police');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black45,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.all(8),
                        ),
                        child: Text(
                          'Admin? Click Here',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
