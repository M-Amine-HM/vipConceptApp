import 'package:flutter/material.dart';
import 'package:localboss/features/business/models/buisness_model.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';

class BusinessItem extends StatelessWidget {
  final BuisnessModel business;

  const BusinessItem({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        leading: Container(
          width: 60, // Diameter of the CircleAvatar (2 * radius)
          height: 60, // Diameter of the CircleAvatar (2 * radius)
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: HomeLayout.gradient,
          ),
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors
                .transparent, // Make the background of CircleAvatar transparent
            child: Icon(Icons.business, color: Colors.white),
          ),
        ),
        title: Text(
          business.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
        subtitle: Row(children: [
          ...List.generate(5, (index) {
            return ShaderMask(
                shaderCallback: (bounds) => HomeLayout.gradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: Icon(
                  index + 1 < business.averageRating.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.white,
                  size: 20,
                ));
          }),
        ]),
      ),
    );
  }
}
