import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter_two/features/home/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: size.width,
                      height: size.height / 2.5,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: mealModel.imageUrl,
                        placeholder: (context, url) => Container(
                          width: size.height,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset('assets/pngs/back.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealModel.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/pngs/star.svg'),
                          SizedBox(width: 5),
                          Text(mealModel.rate.toString()),
                          Spacer(),
                          SvgPicture.asset('assets/pngs/clock.svg'),
                          SizedBox(width: 5),
                          Text(mealModel.time),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Divider(color: Color(0xffEDEDED), thickness: 2.5),
                    SizedBox(height: 30),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      mealModel.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
