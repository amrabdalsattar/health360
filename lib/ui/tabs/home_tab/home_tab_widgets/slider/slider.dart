import 'package:flutter/material.dart';
import 'package:health360/ui/tabs/home_tab/home_tab_widgets/slider/slider_widget.dart';
import '../../../../../data/api_managers/api_manager.dart';
import '../../../../shared_components/loading.dart';


class NewsSlider extends StatefulWidget {
  const NewsSlider({super.key});

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return SliderWidget(articles: data);

          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container(
                margin: const EdgeInsets.all(10),
                child: const Center(child: LoadingWidget()));
          }
        });
  }
}
