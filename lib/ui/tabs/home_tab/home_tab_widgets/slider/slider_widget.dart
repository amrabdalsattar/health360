import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../data/responses/article_response.dart';
import '../../../../shared_components/loading.dart';


class SliderWidget extends StatelessWidget {
  final List<Article> articles;
  const SliderWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.24,
          autoPlay: true,
          viewportFraction: 1,
          pauseAutoPlayOnManualNavigate: true,
          enlargeCenterPage: true,
        ),
        items: articles.map((result) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: result.urlToImage!,
                  placeholder: (_, __) => const Center(child: LoadingWidget()),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  width: MediaQuery.of(context).size.width,
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
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text(result.title!,
                            style: const TextStyle(color: Colors.white,
                                fontSize: 18, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,))),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
