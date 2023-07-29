import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as tago;
import '../../constants.dart';
import '../../controllers/comment_controller.dart';

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({
    super.key,
    required this.id,
  });

  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.comments[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: NetworkImage(comment.profilePhoto),
                          ),
                          title: Row(
                            children: [
                              "${comment.username}  "
                                  .text
                                  .size(20)
                                  .color(Colors.red)
                                  .fontWeight(FontWeight.w700)
                                  .make(),
                              comment.comment.text
                                  .size(20)
                                  .white
                                  .fontWeight(FontWeight.w500)
                                  .make(),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              tago
                                  .format(
                                    comment.datePublished.toDate(),
                                  )
                                  .text
                                  .size(12)
                                  .white
                                  .make(),
                              10.heightBox,
                              '${comment.likes.length} likes'
                                  .text
                                  .size(12)
                                  .white
                                  .make(),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: () =>
                                commentController.likeComment(comment.id),
                            child: Icon(
                              Icons.favorite,
                              size: 25,
                              color: comment.likes
                                      .contains(authController.user.uid)
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                        );
                      });
                }),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.postComment(_commentController.text);
                    _commentController.clear();
                  },
                  child: 'Send'.text.size(16).white.make(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
