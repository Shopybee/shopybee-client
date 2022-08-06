import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MobileImages extends StatelessWidget {
  List<String> images;
  MobileImages({required this.images});

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: displayHeight(context) * 0.45,
          width: displayWidth(context),
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                height: displayHeight(context) * 0.3,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: images.length,
          effect: WormEffect(
              radius: 10,
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: primaryColor,
              dotColor: Colors.grey.shade300),
        )
      ],
    );
  }
}
