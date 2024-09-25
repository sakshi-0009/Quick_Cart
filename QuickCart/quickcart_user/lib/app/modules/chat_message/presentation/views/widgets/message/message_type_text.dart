import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';

import '../../../../../../helper/helper.dart';


class ChatMessageText extends StatelessWidget {
  final String message;
  final String timestamp;

  const ChatMessageText({Key? key, required this.message, required this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding.small(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.bodyMedium(text: message, textAlign: TextAlign.start),
          Align(
            alignment: Alignment.bottomRight,
            child: AppPadding(
              padding: AppEdgeInsets.only(right: AppGapSize.small, bottom: AppGapSize.small),
              child: AppText.bodySmall(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                text: convertTimeStampToHour(timestamp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
