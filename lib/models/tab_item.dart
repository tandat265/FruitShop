import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  final String text;
  final bool isSelected; // Loại bỏ từ khóa final ở đây
  final VoidCallback onPressed;

  const TabItem({
    super.key,
    // Key? key1, // Sửa từ khóa super.key thành key
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        height: 50,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Colors.red
              : const Color.fromARGB(255, 241, 247, 250),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
