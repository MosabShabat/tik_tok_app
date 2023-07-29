import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import '../../constants.dart';
import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black12,
              leading: const Icon(
                Icons.person_add_alt_1_outlined,
              ),
              actions: [
                Icon(Icons.more_horiz),
                10.widthBox,
              ],
              title: '${controller.user['name']}'
                  .text
                  .fontWeight(FontWeight.bold)
                  .white
                  .make(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: controller.user['profilePhoto'],
                                  height: 100,
                                  width: 100,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                  ),
                                ),
                              )
                            ],
                          ),
                          15.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  '${controller.user['following']}'
                                      .text
                                      .size(20)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                  5.heightBox,
                                  'Following'.text.size(14).make(),
                                ],
                              ),
                              Container(
                                color: Colors.black54,
                                width: 1,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              Column(
                                children: [
                                  '${controller.user['followers']}'
                                      .text
                                      .size(20)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                  5.heightBox,
                                  'Followers'.text.size(14).make(),
                                ],
                              ),
                              Container(
                                color: Colors.black54,
                                width: 1,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              Column(
                                children: [
                                  '${controller.user['likes']}'
                                      .text
                                      .size(20)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                  5.heightBox,
                                  'Likes'.text.size(14).make(),
                                ],
                              ),
                            ],
                          ),
                          15.heightBox,
                          Container(
                            width: 140,
                            height: 47,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  if (widget.uid == authController.user.uid) {
                                    authController.signOut();
                                  } else {
                                    controller.followUser();
                                  }
                                },
                                child: Text(
                                  widget.uid == authController.user.uid
                                      ? 'Sign Out'
                                      : controller.user['isFollowing']
                                          ? 'Unfollow'
                                          : 'Follow',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          25.heightBox,
                          // video list
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.user['thumbnails'].length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              String thumbnail =
                                  controller.user['thumbnails'][index];
                              return CachedNetworkImage(
                                imageUrl: thumbnail,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
