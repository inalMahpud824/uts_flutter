import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatefulWidget {
  const GetImage({super.key});

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  File? image;

  Future GetImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambil Gambar',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Ambil Gambar'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image != null
                  ? Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(image!.path, fit: BoxFit.fill,))
                      // Image.file(File(_userImage!.path))
                  : Container(),
              ElevatedButton(
                child: Text('Ambil Gambar'),
                onPressed: () async {
                  await GetImage();
                },
              ),
            ],
          )),
    );
  }
}
