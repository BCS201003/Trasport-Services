import 'package:flutter/material.dart';

const TextStyle appBarTitleStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Jost',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  height: 23.12 / 16,
  letterSpacing: 1,
);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  
  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
           width: 32,
           height: 32,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 16, // Icon size
            ),
            tooltip: 'Back',
            onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
          ),
        ),
      ),
      title: Text(
        title,
        style: appBarTitleStyle,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
