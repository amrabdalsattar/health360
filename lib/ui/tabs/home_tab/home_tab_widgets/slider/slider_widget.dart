import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/tabs/home_tab/home_tab_widgets/slider/slider_item.dart';

import '../../../../../data/responses/article_response.dart';


class SliderWidget extends StatelessWidget {
  final List<Article> articles;
  const SliderWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.24.h,
          autoPlay: true,
          viewportFraction: 1,
          pauseAutoPlayOnManualNavigate: true,
          enlargeCenterPage: true,
        ),
        items: articles.map((result) {
          return SliderItem(result: result);
        }).toList(),
      ),
    );
  }
}
