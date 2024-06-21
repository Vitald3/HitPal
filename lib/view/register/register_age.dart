import 'package:flutter/cupertino.dart';
import '../../controller/register/register.dart';

Widget registerAge(RegisterController controller) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 260,
      child: CupertinoPicker.builder(
          itemExtent: 46,
          onSelectedItemChanged: (int index) {
            controller.setAge(index);
          },
          childCount: 62,
          scrollController: controller.scrollController,
          itemBuilder: (BuildContext context, int index) {
            int year = 9 + index;

            return Center(
                child: Text(
                    '$year',
                    style: TextStyle(
                        color: const Color(0xFF232538),
                        fontWeight: controller.age.value == year ? FontWeight.w400 : FontWeight.w600,
                        letterSpacing: 0.49
                    )
                )
            );
          }
      )
  );
}