import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? leftNode;
  final Widget? rightNode;

  const MenuItem({
    super.key,
    required this.title,
    this.subTitle,
    this.leftNode,
    this.rightNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 8, top: 14, bottom: 14),
        child: Row(
          children: [
            if (leftNode != null) leftNode!,
            if (leftNode != null) const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: const TextStyle(fontSize: 12),
                    ),
                ],
              ),
            ),
            if (rightNode != null) rightNode!
          ],
        ),
      ),
    );
  }
}
