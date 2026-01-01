import 'package:flutter/material.dart';

class GlowingOrnateBorder extends StatelessWidget {
  final Widget child;
  final bool isActive;

  const GlowingOrnateBorder({
    super.key,
    required this.child,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isActive) return child;

    return Stack(
      children: [
        // Outer Glow
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF77FF).withOpacity(0.3),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
        // The Content
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: child,
        ),
        // Ornate Border Painter
        Positioned.fill(
          child: CustomPaint(
            painter: _OrnatePainter(),
          ),
        ),
      ],
    );
  }
}

class _OrnatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF77FF).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final glowPaint = Paint()
      ..color = const Color(0xFFFF77FF).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final RRect rrect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(24),
    );

    // Draw main border and glow
    canvas.drawRRect(rrect, glowPaint);
    canvas.drawRRect(rrect, paint);

    // Add ornate corners
    _drawCorner(canvas, Offset(0, 0), 0, paint);
    _drawCorner(canvas, Offset(size.width, 0), 90, paint);
    _drawCorner(canvas, Offset(size.width, size.height), 180, paint);
    _drawCorner(canvas, Offset(0, size.height), 270, paint);
  }

  void _drawCorner(Canvas canvas, Offset offset, double angle, Paint paint) {
    // Basic ornate decoration logic
    // This could be improved with more paths
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
