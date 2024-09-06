import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("NY Times Most Popular"),
      centerTitle: true, // Center the title in the AppBar
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Handle the press event
          },
        ),
      ],
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
