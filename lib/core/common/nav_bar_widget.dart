import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget(
      {super.key,
      required this.onTap,
      required this.index,
      required this.selectedIndex,
      required this.icon,
      required this.name});

  //final VoidCallback onTap;
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String name;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 60,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: index == selectedIndex
                    ? Theme.of(context).colorScheme.primary
                    : null),
          ),
          // const SizedBox(
          //   height: 6,
          // ),
          SizedBox(height: 20, width: 40, child: Icon(icon)),
          const SizedBox(
            height: 6,
          ),
          Text(
            name,
          )
        ]),
      ),
    );
  }
}
