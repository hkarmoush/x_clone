import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_button.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/core/widgets/platform_text_view.dart';
import 'package:x_clone/app/presentation/tweet/bloc/create_tweet_bloc.dart';

class CreateTweetScreen extends StatefulWidget {
  const CreateTweetScreen({super.key});

  @override
  CreateTweetScreenState createState() => CreateTweetScreenState();
}

class CreateTweetScreenState extends State<CreateTweetScreen> {
  final TextEditingController _tweetController = TextEditingController();
  // final ImagePicker _picker = ImagePicker();
  final List<File> _selectedImages = [];

  @override
  void dispose() {
    _tweetController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    // final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   setState(() {
    //     _selectedImages.add(File(pickedFile.path));
    //   });
    // }
  }

  void _createTweet() {
    context.read<CreateTweetBloc>().add(
          CreateTweet(
            content: _tweetController.text,
            images: _selectedImages,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: ObstructingPreferredPlatformAppBar(
        title: 'Create Tweet',
        actions: [
          PlatformButton(
            text: 'Send',
            onPressed: _createTweet,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PlatformTextView(
              controller: _tweetController,
              placeholder: "What's happening?",
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            Wrap(
              children: _selectedImages.map((image) {
                return Stack(
                  children: [
                    Image.file(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImages.remove(image);
                          });
                        },
                        child: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            PlatformButton(
              text: 'Add Image',
              onPressed: _pickImage,
              // icon: const Icon(Icons.image),
            ),
          ],
        ),
      ),
    );
  }
}
