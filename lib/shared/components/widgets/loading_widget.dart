

import 'package:drama/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {

  double height;
  LoadingState(this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: DefaultColors.secondColor,
        ),
      ),
    );
  }
}

