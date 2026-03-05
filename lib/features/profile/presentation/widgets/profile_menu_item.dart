import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const MenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      leading: Icon(icon, color: theme.colorScheme.surface),
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: theme.colorScheme.surface,
      ),
    );
  }
}
