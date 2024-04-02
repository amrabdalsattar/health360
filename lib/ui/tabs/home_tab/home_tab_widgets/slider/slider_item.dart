import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/data/responses/article_response.dart';

import '../../../../shared_components/loading.dart';

class SliderItem extends StatelessWidget {
  final Article result;
  const SliderItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: result.urlToImage!,
            placeholder: (_, __) => const Center(child: LoadingWidget()),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7), // Adjust opacity as needed
                  Colors.transparent,
                ],
              ),
            ),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Text(result.title!,
                      style: TextStyle(color: Colors.white,
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,))),
          ),
        ],
      ),
    );
  }
}
