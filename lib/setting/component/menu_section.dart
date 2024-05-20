import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  final List<dynamic> items;
  final String? title;

  const MenuSection({super.key, required this.items, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontFamily: 'DMSans',
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
        ...items.map((item) => item)
      ],
    );
  }
}
