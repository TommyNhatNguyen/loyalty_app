import 'package:flutter/material.dart';
import 'package:loyalty_app/themes/app_colors.dart';

class SingleSelectorItem {
  final IconData icon;
  final String title;
  final String? subtitle;

  const SingleSelectorItem({
    required this.icon,
    required this.title,
    this.subtitle,
  });
}

class SingleSelector extends StatelessWidget {
  final List<SingleSelectorItem> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double height;

  const SingleSelector({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isSelected = index == selectedIndex;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: index > 0 ? 8 : 0),
            child: InkWell(
              onTap: () => onChanged(index),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: height,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.deepNavy.withAlpha(30)
                      : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(
                    color: isSelected ? AppColors.deepNavy : AppColors.border,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, color: AppColors.deepNavy),
                      const Spacer(),
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.deepNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (item.subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          item.subtitle!,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.mutedText),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
