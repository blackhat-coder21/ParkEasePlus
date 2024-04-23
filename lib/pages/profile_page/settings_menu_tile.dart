import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class Settings_menu_tile extends StatelessWidget {
  const Settings_menu_tile({super.key,
    required this.icon,
    required this.title,
    required this.sub_title,
    this.trailing});

  final IconData icon;
  final String title,sub_title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size:28,color: Custom_colors.primary ,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium),
      // subtitle: Text(sub_title,style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
    );
  }
}