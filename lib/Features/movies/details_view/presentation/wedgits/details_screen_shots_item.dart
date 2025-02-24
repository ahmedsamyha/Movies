import 'package:flutter/material.dart';

class DetailsScreenShotsItem extends StatelessWidget {
  const DetailsScreenShotsItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(borderRadius: BorderRadius.circular(16),
        child: Image.network(image,height: height*.19,width: double.infinity,fit: BoxFit.fill,));
  }
}
