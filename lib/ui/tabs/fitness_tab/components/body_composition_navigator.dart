import 'package:flutter/material.dart';
import 'package:health360/ui/screens/body_composition_screen/body_composition_screen.dart';

import '../../../../utils/app_color.dart';

class BodyCompositionNavigator extends StatelessWidget {
  const BodyCompositionNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, BodyCompositionScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.liteGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.man,
                      size: 40,
                    )),
                const SizedBox(width: 16,),
                const Text(
                  "Body composition",
                  style: TextStyle(color: AppColor.grey, fontSize: 18,),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
