import 'package:exam_ui/model/list_horizontal.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  List<String> name = ["Art", "Business", "Comedy", "Drama"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 88,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset("assets/images/Logo.png"),
            const ImageIcon(
              AssetImage(
                "assets/images/Setting.png",
              ),
            )
          ])),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          children: [
            _nameHorizontalList(),
            _imageHorizontalList(),
            _screenHorizontalList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/Home.png"), label: "Home"),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/Search.png"), label: "Search"),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/Document.png"), label: "Document"),
      ]),
    );
  }

  Widget _nameHorizontalList() {
    return Expanded(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(color: Color(0xFF010104), fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.only(right: 28.0),
                child: Text(
                  "see more",
                  style: TextStyle(fontSize: 14, color: Color(0xFF4838D1)),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40, // Wrap SizedBox to control height of ListView
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12);
              },
              itemBuilder: (context, index) {
                return ListHorizontal(
                  textName: name[index],
                );
              },
              itemCount: name.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageHorizontalList() {
    final List<String> images = [
      "assets/images/Image Placeholder 1.png",
      "assets/images/Image Placeholder 2.png",
    ];
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended For You",
                style: TextStyle(color: Color(0xFF010104), fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.only(right: 28.0),
                child: Text(
                  "see more",
                  style: TextStyle(fontSize: 14, color: Color(0xFF4838D1)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 300,
                      width: 162,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.fill,
                      ));
                },
                itemCount: images.length),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget _screenHorizontalList() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Seller",
                style: TextStyle(color: Color(0xFF010104), fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.only(right: 28.0),
                child: Text(
                  "see more",
                  style: TextStyle(fontSize: 14, color: Color(0xFF4838D1)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    // height: 144,
                    // width: 315,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF5F5FA),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                            "assets/images/Image Placeholder 240x240.png"),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset("assets/images/Container.png"),
                      ],
                    ),
                  );
                },
                itemCount: 2),
          ),
        ],
      ),
    );
  }
}
