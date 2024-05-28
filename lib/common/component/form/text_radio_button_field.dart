import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

class TextRadioButtonField extends StatefulWidget {
  const TextRadioButtonField({
    super.key,
    required this.list,
    required this.onTabAddItem,
    required this.onTabSelectItem,
  });

  final List<dynamic> list;
  final void Function() onTabAddItem;
  final void Function(dynamic selectedItem) onTabSelectItem;

  @override
  State<TextRadioButtonField> createState() => _TextRadioButtonFieldState();
}

class _TextRadioButtonFieldState extends State<TextRadioButtonField> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 1.6,
      ),
      itemCount: widget.list.length + 1,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;

        if (index == 0) {
          return GestureDetector(
            onTap: widget.onTabAddItem,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.add)),
          );
        }
        return Container(
          decoration: const BoxDecoration(),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTabSelectItem(widget.list[index - 1]);
            },
            child: Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                widget.list[index - 1].name,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
