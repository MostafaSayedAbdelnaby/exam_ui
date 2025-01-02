import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SecondHomeScreen extends StatefulWidget {
  static const String routeName = "Home2";

  const SecondHomeScreen({super.key});


  @override
  State<SecondHomeScreen> createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  final PageController _controller = PageController();
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _activeIndex = _controller.page!.round(); // Update _activeIndex
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/logo_moody.png"),
                const Badge(
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/Icon_notification.png",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  " Sara Rose",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Text(
                  "How are you feeling today ?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildImageWithTitle("assets/images/love_moody.png", 'Love'),
                _buildImageWithTitle("assets/images/cool_moody.png", 'Cool'),
                _buildImageWithTitle("assets/images/happy_moody.png", 'Happy'),
                _buildImageWithTitle("assets/images/sad_moody.png", 'Sad'),
              ],
            ),
            const SizedBox(height: 40),
            _imageIndicator(),
            const SizedBox(height: 36),
            _categoryHorizontal(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ico_home-moody.png"),
              const SizedBox(
                height: 6,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF027A48),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/ico_grid-moody.png"), label: ""),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/ico_calendar_moody.png"),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/ico_user-moody.png"), label: ""),
      ]),
    );
  }

  Widget _buildImageWithTitle(String imagePath, String title) {
    return Column(
      children: [
        Image.asset(imagePath),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Color(0xFF000000)),
        ),
      ],
    );
  }

  Widget _imageIndicator() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feature",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "See more",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF027A48)),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF027A48),
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: PageView(
                controller: _controller,
                children: [
                  Image.asset(
                    "assets/images/image_indicator.png",
                    fit: BoxFit.fill,
                  ),
                  Image.asset("assets/images/image_indicator.png",
                      fit: BoxFit.fill),
                  Image.asset("assets/images/image_indicator.png",
                      fit: BoxFit.fill),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          AnimatedSmoothIndicator(
            activeIndex: _activeIndex,
            count: 3,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 4,
              activeDotColor: Color(0xFF98A2B3),
              dotColor: Color(0xFFD9D9D9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryHorizontal() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Exercise",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF027A48)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF027A48),
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 140,
                    child: Image.asset("assets/images/Relaxation.png")),
                SizedBox(
                    width: 140,
                    child: Image.asset("assets/images/Meditation.png")),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140,
                  child: Image.asset("assets/images/Beathing.png"),
                ),
                SizedBox(
                  width: 140,
                  child: Image.asset("assets/images/Yoga.png"),
                ),
              ],
            ),

            /// Eng Omar
            // Expanded(
            //   child: GridView(
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           mainAxisSpacing: 16,
            //           crossAxisSpacing: 16
            //       ),
            //       children: [
            //         Image.asset("assets/images/Relaxation.png"),
            //         Image.asset("assets/images/Meditation.png"),
            //         Image.asset("assets/images/Beathing.png"),
            //         Image.asset("assets/images/Yoga.png"),
            //       ]),
            // ),
          ],
        ),
      ),
    );
  }
}
