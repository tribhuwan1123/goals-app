import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  String about;
  String services;
  String price;

  Details(this.about, this.services, this.price);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        aspectRatio: 1.5,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: _controller,
      items: imageSliders(),
    );
  }

  final List<Widget> imageSlider = [];

  List<Widget> imageSliders() {
    imageSlider.add(Column(
      children: [DetailTile("About Us", widget.about)],
    ));

    imageSlider.add(Column(
      children: [DetailTile("Services", widget.services)],
    ));
    imageSlider.add(Column(
      children: [DetailTile("Pricing", widget.price)],
    ));
    return imageSlider;
  }

  Widget DetailTile(String title, String content) {
    return Container(
      height: 250,
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
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
              overflow: TextOverflow.visible,
              maxLines: 5,
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
}
