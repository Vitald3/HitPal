import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery_picker/gallery_picker.dart';
import '../../controller/register/register.dart';

Widget registerPhoto(RegisterController controller, BuildContext context) {
  return Column(
      children: [
        Transform.translate(
          offset: const Offset(0, -30),
          child: const Text(
            'Optional',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF73737C),
              fontSize: 13,
              letterSpacing: 0.04
            )
          )
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () async {
            List<MediaFile>? singleMedia = await GalleryPicker.pickMedia(context: context, singleMedia: true);

            if (singleMedia != null && singleMedia.isNotEmpty) {
              controller.singleMedia.value = singleMedia;
            }
          },
          child: controller.singleMedia.isNotEmpty ? Image.memory(controller.singleMedia.first.thumbnail!, width: 138, height: 138, fit: BoxFit.cover) : Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 138,
                    height: 138,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(138))
                    ),
                    child: SvgPicture.asset('assets/icons/user.svg', semanticsLabel: 'Add', width: 34, height: 42)
                ),
                Positioned(
                    bottom: -22,
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset('assets/icons/plus.svg', semanticsLabel: 'Add', width: 50, height: 50)
                    )
                )
              ]
          )
        )
      ]
  );
}