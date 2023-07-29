import 'package:get/get.dart';
import 'package:tik_tok_app/constants.dart';
import 'package:tik_tok_app/views/screens/profile_screen.dart';
import '../../controllers/search_controller.dart';
import '../../models/user.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController searchController = Get.put(SearchController());
  @override
  void initState() {
    searchController.searchedUsers.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: TextFormField(
            decoration: const InputDecoration(
              filled: false,
              hintText: '\tSearch',
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
              ),
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onFieldSubmitted: (value) => searchController.searchUser(value),
          )
              .box
              .height(40)
              .rounded
              .padding(
                EdgeInsets.symmetric(horizontal: 8),
              )
              .width(context.screenWidth / 1.25)
              .color(Colors.grey.shade400)
              .make(),
          centerTitle: true,
        ),
        body: searchController.searchedUsers.isEmpty
            ? Center(
                child: 'Search for users!'
                    .text
                    .size(25)
                    .white
                    .fontWeight(FontWeight.bold)
                    .make(),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => ProfileScreen(uid: user.uid),
                        transition: Transition.leftToRight,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profilePhoto,
                          ),
                        ),
                        title: user.name.text.size(18).white.make(),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
