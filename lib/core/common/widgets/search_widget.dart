import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final void Function()? onMicPressed;
  final void Function()? onCameraPressed;

  const SearchWidget({super.key, this.onMicPressed, this.onCameraPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: TextField(
            style: theme.textTheme.labelMedium!.copyWith(
              color: AppColors.inputTextColor,
            ),
            decoration: InputDecoration(
              hintText: 'Search product here',
              prefixIcon: const Icon(Icons.search_outlined),
              suffixIcon: IconButton(
                onPressed: onMicPressed,
                icon: const Icon(Icons.mic_outlined),
              ),
            ),
          ),
        ),
        // const SizedBox(width: 16),
        // Container(
        //   width: 50,
        //   height: 50,
        //   decoration: BoxDecoration(
        //     color: theme.colorScheme.primary,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Center(
        //     child: IconButton(
        //       onPressed: onCameraPressed,
        //       icon: const Icon(Icons.camera_alt),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
