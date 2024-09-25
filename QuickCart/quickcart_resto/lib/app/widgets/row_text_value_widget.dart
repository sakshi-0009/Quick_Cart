part of 'widgets.dart';

class RowTextValueWidget extends StatelessWidget {
  final String title;
  final String value;

  const RowTextValueWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: const AppEdgeInsets.only(top: AppGapSize.small),
      child: Row(
        children: [
          AppText.bodySmall(text: title, fontWeight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: AppGapSize.small.size),
          Expanded(
            child: AppText.bodySmall(
                text: value,
                textAlign: TextAlign.end,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
