import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  List<File> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: selectedImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Image.file(
                        selectedImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    getImages();
                  },
                  child: const Text('Select images from gallery'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImages() async {
    try {
      final List<XFile> pickedFileList = await _picker.pickMultiImage();
      if (pickedFileList.isEmpty) {
        _showSnackBar('Nothing was selected');
        return;
      }

      for (final file in pickedFileList) {
        selectedImages.add(File(file.path));
      }

      setState(() {});
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
      ),
    );
  }
}
