import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import 'confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(
          () => ConfirmScreen(
                videoFile: File(video.path),
                videoPath: video.path,
              ),
          transition: Transition.downToUp);
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.gallery, context),
              child: Row(
                children: [
                  const Icon(Icons.image),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: 'Gallery'.text.size(20).make(),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.camera, context),
              child: Row(
                children: [
                  const Icon(Icons.camera_alt),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: 'Camera'.text.size(20).make(),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Get.back(),
              child: Row(
                children: [
                  const Icon(Icons.cancel),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: 'Cancel'.text.size(20).make(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: 'Add Video'
                  .text
                  .size(20)
                  .black
                  .fontWeight(FontWeight.bold)
                  .make(),
            ),
          ),
        ),
      ),
    );
  }
}
