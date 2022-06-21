import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class FirebaseStorageAPI {
  final Reference _reference = FirebaseStorage.instance.ref();

  Future<UploadTask?> uploadFile(String path, File image) async{
    return Future.value(_reference.child(path).putFile(image));
  }
}