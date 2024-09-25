import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../constants/contains.dart';
import '../boot_service/boot_services.dart';

part 'cloud_storage_impl.dart';

const _logName = 'CloudStorageService';

final class CloudStorageService extends GetxService
    implements Bootable, CloudStorageServiceImpl {
  static CloudStorageService get instance => Get.find<CloudStorageService>();

  late final FirebaseStorage storage;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    storage = FirebaseStorage.instance;
  }

  @override
  Future<String?> uploadAvatarImage(
      {required File file, required String uid}) async {
    try {
      // Create a reference to the image location in Firebase Storage
      final fileName = uid;
      final ref = storage.ref().child('user/$fileName');
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );
      final uploadTask = await ref.putFile(File(file.path), metadata);
      return await uploadTask.ref.getDownloadURL();
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image to Firebase Storage: $e');
      }
      return null;
    }
  }

  @override
  Future<String?> uploadImage({required File file}) async {
    try {
      final ref = storage.ref().child('images/${const Uuid().v4()}');
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );
      final uploadTask = ref.putFile(file, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image to Firebase Storage: $e');
      }
      return null;
    }
  }

  @override
  Future<String?> uploadVideo({required File file}) async {
    try {
      final storage = FirebaseStorage.instance;
      final ref = storage.ref().child('videos/${const Uuid().v4()}');
      final metadata = SettableMetadata(
        contentType: 'video/mp4',
        customMetadata: {'picked-file-path': file.path},
      );
      final uploadTask = ref.putFile(file, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      final videoUrl = await snapshot.ref.getDownloadURL();
      return videoUrl;
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image to Firebase Storage: $e');
      }
      return null;
    }
  }

  Future<String?> uploadAnotherFile({required File file}) async {
    try {
      final ref = storage.ref().child('files/${const Uuid().v4()}');
      final metadata = SettableMetadata(
          contentType: 'application/pdf',
          customMetadata: {'picked-file-path': file.path});
      final uploadTask = ref.putFile(file, metadata);
      final snapshot = await uploadTask.whenComplete(() {});
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image to Firebase Storage: $e');
      }
      return null;
    }
  }
}
