import 'package:flutter/material.dart';
import 'package:showbox/core/utils/my_images.dart';

class MyBgWidget extends StatelessWidget {
  final String image;
  const MyBgWidget({Key? key, this.image = MyImages.bgImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.black, Colors.black12],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ));
  }
}
