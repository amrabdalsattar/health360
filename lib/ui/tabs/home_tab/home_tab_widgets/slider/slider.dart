import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/tabs/home_tab/home_tab_widgets/slider/slider_widget.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class NewsSlider extends StatefulWidget {
  const NewsSlider({super.key});

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<NewsViewModel>(
            builder: (_, viewModel, __){
              Widget newsSlider;
              if (viewModel.isLoading) {
                newsSlider = Shimmer.fromColors(
                  baseColor: AppColor.liteGrey,
                  highlightColor: AppColor.midGrey,
                  enabled: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    height: MediaQuery.of(context).size.height * 0.24.h,

                  ),
                );
              }else if(viewModel.articles.isNotEmpty){
                newsSlider = SliderWidget(articles: viewModel.articles);
              }else{
                newsSlider = Text(viewModel.errorText??"Something went wrong");
              }
              return newsSlider;
            },));
  }
}
// Container(
// margin: const EdgeInsets.all(10),
// child: const Center(child: LoadingWidget()))
