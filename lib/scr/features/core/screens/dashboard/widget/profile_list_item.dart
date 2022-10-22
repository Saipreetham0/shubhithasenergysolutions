import 'package:flutter/material.dart';

class profile_list_widget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;
  final bool hasNavigation;
  const profile_list_widget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.hasNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [],
      ),
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            Icon(icon, color: Theme.of(context).iconTheme.color),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
