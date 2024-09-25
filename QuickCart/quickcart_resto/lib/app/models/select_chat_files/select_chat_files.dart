library select_chat_files;

import 'dart:io';

import '../../helper/helper.dart';
import '../../services/cloud_storage_service/cloud_storage_service.dart';
import '../message_chat_model.dart';

part 'select_chat_images.dart';

part 'select_chat_another_files.dart';

part 'select_chat_files_impl.dart';

part 'select_chat_video.dart';

part 'select_chat_text_only.dart';

List<SelectChatFilesImpl> lstSelectChatFiles = <SelectChatFilesImpl>[
  SelectChatImages(),
  SelectChatVideos(),
  SelectAnotherFiles(),
];
