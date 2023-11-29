import 'package:flutter/material.dart';

import '../../../../utils/app_asset.dart';

class LogoCollection extends StatelessWidget {
  const LogoCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: (){},
            child: Image.asset(AppAsset.google,
              width: 40, height: 40,)),
        InkWell(
          onTap: (){},
            child: Image.asset(AppAsset.facebook,
              width: 30, height: 30,)),
        InkWell(
            onTap: (){},
            child: Image.asset(AppAsset.x,
              width: 22, height: 22,)),
      ],
    );
  }
}
