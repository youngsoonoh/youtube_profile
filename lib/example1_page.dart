import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Example1Page extends StatefulWidget {
  const Example1Page({Key? key}) : super(key: key);

  @override
  State<Example1Page> createState() => _Example1PageState();
}

class _Example1PageState extends State<Example1Page> {
  XFile? _pickedFile;

  @override
  Widget build(BuildContext context) {
    final _imageSize = MediaQuery.of(context).size.width / 4;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Example1'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20,),
            if (_pickedFile == null)
              Container(
                constraints: BoxConstraints(
                  minHeight: _imageSize,
                  minWidth: _imageSize,
                ),
                child: GestureDetector(
                  onTap: () {
                    _showBottomSheet();
                  },
                  child: Center(
                    child: Icon(
                      Icons.account_circle,
                      size: _imageSize,
                    ),
                  ),
                ),
              )
            else
              Center(
                child: Container(
                  width: _imageSize,
                  height: _imageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2, color: Theme.of(context).colorScheme.primary),
                    image: DecorationImage(
                        image: FileImage(File(_pickedFile!.path)),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _getCameraImage(),
              child: const Text('사진찍기'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => _getPhotoLibraryImage(),
              child: const Text('라이브러리에서 불러오기'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  _getCameraImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  _getPhotoLibraryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = _pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }
}
