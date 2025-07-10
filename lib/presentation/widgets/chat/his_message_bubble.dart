import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  final Message message;

  const HisMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: MessageBubbleClipperLeft(),
          child: Container(
            color: colors.secondary, // o tu color personalizado
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              child: Text(message.text, style: TextStyle(color: Colors.white),
              ),
              ),
            ),
          ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: _ImageBubble(message.imageUrl!),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble( this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;// MediaQuery.of(context, child: child)
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.5,
        height: size.height * 0.2,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.5,
            height: size.height * 0.2,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(child: const Text("Cargando...")),
          );
        },
      ),
    );
  }
}

class MessageBubbleClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 16.0;
    double tailSize = 6.0;

    final path = Path();
    path.moveTo(tailSize + radius + 4, 0);
    path.quadraticBezierTo(tailSize + 0, 0, tailSize + 0, radius); // top-left
    path.lineTo(tailSize + 0, size.height - radius - tailSize);

    // Tail
    path.quadraticBezierTo(
      tailSize + 0,
      size.height - tailSize,
      tailSize + tailSize,
      size.height - tailSize,
    );
    path.lineTo(tailSize + tailSize + 2, size.height);
    path.lineTo(tailSize + radius + 2, size.height - tailSize);

    path.lineTo(size.width - radius, size.height - tailSize);
    path.quadraticBezierTo(
      size.width,
      size.height - tailSize,
      size.width,
      size.height - radius - tailSize,
    );
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width, 0, size.width - radius, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TypingDots extends StatefulWidget {
  const TypingDots({super.key});

  @override
  State<TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    animation1 = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.3)),
    );
    animation2 = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.5)),
    );
    animation3 = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.7)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Dot(animation: animation1),
          const SizedBox(width: 4),
          Dot(animation: animation2),
          const SizedBox(width: 4),
          Dot(animation: animation3),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Dot extends AnimatedWidget {
  const Dot({required Animation<double> animation})
    : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      width: 8,
      height: 8 + animation.value,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
