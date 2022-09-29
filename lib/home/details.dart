import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.5,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: _controller,
      items: imageSliders(),
    );
  }
}

final List<Widget> imageSlider = [];

List<Widget> imageSliders() {
  imageSlider.add(Column(
    children: [
      DetailTile("About Us",
          "Lorem Ipsum, sometimes referred to as 'lipsum', is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin text, but to today's reader, it's seen as gibberish."),
    ],
  ));

  imageSlider.add(Column(
    children: [
      DetailTile("Services",
          "Lorem Ipsum, sometimes referred to as 'lipsum', is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin text, but to today's reader, it's seen as gibberish."),
    ],
  ));
  imageSlider.add(Column(
    children: [
      DetailTile("Pricing",
          "Lorem Ipsum, sometimes referred to as 'lipsum', is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin text, but to today's reader, it's seen as gibberish."),
    ],
  ));
  return imageSlider;
}

Widget DetailTile(String title, String content) {
  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1)),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
        const Divider(
          color: Colors.white,
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        )
      ],
    ),
  );
}
