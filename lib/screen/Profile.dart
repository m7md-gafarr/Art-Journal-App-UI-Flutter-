import 'package:art_journal/Widget/post.dart';
import 'package:art_journal/const.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Widget/BottomSheetAddAcount.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      animationDuration: const Duration(milliseconds: 300),
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: InkWell(
          onTap: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
              context: context,
              builder: (context) => const BottomSheetAddAcountWidget(),
            );
          },
          child: const SizedBox(
            width: 110,
            child: Row(
              children: [
                Text(
                  "M2' Sokar",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Icon(
                  Iconsax.arrow_down_1,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CircleAvatar(
                  maxRadius: 45,
                  backgroundColor: Colors.transparent,
                  child: Image.asset("assets/images/user.png"),
                ),
                const SizedBox(height: 10),
                Text(
                  "@m7md_gafar",
                  style: TextStyle(
                    color: Dark,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    following_ers_likes(num: "125", text: "Following"),
                    VerticalDivider_Widget(),
                    following_ers_likes(num: "3540", text: "Followers"),
                    VerticalDivider_Widget(),
                    following_ers_likes(num: "41.8K", text: "Likes"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Edit_Share_Button(
                      onPressed: () {
                        Navigator.pushNamed(context, "EditProfileScreen");
                      },
                      widget: const Text(
                        "Edit profile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Edit_Share_Button(
                      onPressed: () {},
                      widget: const Text(
                        "Share profile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Edit_Share_Button(
                      onPressed: () {},
                      widget: const Icon(
                        Iconsax.user_add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  "Software Engineer || Mobile App Developer",
                  style: TextStyle(
                    fontSize: 14,
                    color: Dark,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                TabBar(
                  onTap: (value) {},
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.blueAccent,
                  indicatorPadding: const EdgeInsets.only(bottom: 7),
                  controller: _tabController,
                  tabs: [
                    Tab(icon: Icon(Iconsax.gallery, color: Bright)),
                    Tab(icon: Icon(Iconsax.repeat, color: Bright)),
                    Tab(icon: Icon(Iconsax.save_2, color: Bright)),
                    Tab(icon: Icon(Iconsax.heart, color: Bright)),
                  ],
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const PostWidget(),
                itemCount: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const PostWidget(),
                itemCount: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const PostWidget(),
                itemCount: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const PostWidget(),
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget following_ers_likes({required String text, required String num}) {
    return Column(
      children: [
        Text(
          num,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Dark.withOpacity(.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget VerticalDivider_Widget() {
    return SizedBox(
      height: 40,
      child: VerticalDivider(
        color: Dark_50,
        endIndent: 10,
        indent: 10,
        thickness: .5,
        width: 60,
      ),
    );
  }

  Widget Edit_Share_Button({
    required Widget widget,
    required void Function()? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Bright,
        padding: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
      ),
      child: widget,
    );
  }
}
