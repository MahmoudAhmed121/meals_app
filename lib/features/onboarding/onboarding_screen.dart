import 'package:carousel_slider/carousel_slider.dart';
import 'package:counter_two/features/home/home_screeN.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> titels = [
    'Save Your \nMeals \nIngredient',
    'Use Our App \nThe Best \nChoice',
    'Our App \nYour \nUltimate Choice',
  ];
  final List<String> discraptions = [
    'Add Your Meals and its Ingredients \nand we will save it for you',
    'the best choice for your \nkitchen do not hesitate',
    'All the best restaurants and their \ntop menus are ready for you',
  ];

  final CarouselSliderController controller = CarouselSliderController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pngs/onbording.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 32,
            right: 32,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              height: 470,
              width: 311,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Colors.orange.withOpacity(0.9),
              ),
              child: CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  height: 470,
                  disableCenter: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    print('-------$index');
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: List.generate(titels.length, (index) {
                  return Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        titels[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        discraptions[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 40),
                      DotsIndicator(
                        dotsCount: titels.length,
                        position: currentIndex.toDouble(),
                        onTap: (index) {
                          print('onTap: $index');
                          controller.animateToPage(index);
                        },
                        decorator: DotsDecorator(
                          size: Size(30, 10),
                          color: Color(0xffC2C2C2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          activeSize: Size(30, 10),
                          activeColor: Colors.white,
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),

                      Spacer(),
                      currentIndex == 2
                          ? InkWell(
                              onTap: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('isFirstTime', false);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.orange,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool('isFirstTime', false);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Ship',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    if (currentIndex < 2) {
                                      currentIndex++;
                                      controller.animateToPage(currentIndex);
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  focusColor: Colors.yellow,
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(height: 30),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
