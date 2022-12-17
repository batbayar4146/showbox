
import 'package:flutter/cupertino.dart';
import '../../core/utils/my_color.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/styles.dart';

import '../../core/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  const SmallText({Key? key,required this.text,this.textStyle=mulishLight}) : super(key: key);
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: textStyle);
  }
}


