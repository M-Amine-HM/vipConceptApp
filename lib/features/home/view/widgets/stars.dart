import 'package:flutter/material.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';

class Stars extends StatelessWidget {
  final double averageRating;
  const Stars({super.key, required this.averageRating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        double rating = averageRating;
        double starFill = (rating - index).clamp(0, 1);

        return Stack(
          children: [
            // Empty star (border)
            ShaderMask(
              shaderCallback: (bounds) =>
                  HomeLayout.gradient.createShader(bounds),
              child: Icon(
                Icons.star_border,
                //color: Colors.grey,
                size: 16,
              ),
            ),
            // Filled star with gradient and partial fill
            ClipRect(
              clipper: StarClipper(starFill), // Clips according to the rating
              child: ShaderMask(
                shaderCallback: (bounds) => HomeLayout.gradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: const Icon(
                  Icons.star,
                  color: Colors
                      .white, // This color will be replaced by the gradient
                  size: 16,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class StarClipper extends CustomClipper<Rect> {
  final double fillPercent;
  StarClipper(this.fillPercent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fillPercent, size.height);
  }

  @override
  bool shouldReclip(StarClipper oldClipper) {
    return oldClipper.fillPercent != fillPercent;
  }
}
