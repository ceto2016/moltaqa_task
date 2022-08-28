import 'package:flutter/material.dart';
import '../../domain/entities/new_arrivals.dart';

import '../../../../core/constant/constant.dart';

class NewArrivalItem extends StatelessWidget {
  const NewArrivalItem({Key? key, required this.newArrival}) : super(key: key);
  final NewArrival newArrival;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSaleItem(newArrival: newArrival),
            Padding(
              padding: Constant.kPaddingH8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newArrival.productName, style: Constant.bodyText16),
                  const SizedBox(height: 4),
                  Text(newArrival.storeName, style: Constant.bodyText10),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("EGP 55.00", style: Constant.bodyText14),
                            const SizedBox(height: 4),
                            Text(
                              "EGP 55.00",
                              style: Constant.bodyLineGrey10.copyWith(
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ]),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Constant.redFontColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Icon(Icons.shopping_cart_checkout_outlined,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageSaleItem extends StatelessWidget {
  const ImageSaleItem({
    Key? key,
    required this.newArrival,
  }) : super(key: key);

  final NewArrival newArrival;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Stack(
        children: [
          SizedBox(
              height: 160,
              child: Image.network(
                newArrival.image,
                fit: BoxFit.cover,
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite_border, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xffBFE2FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.electric_bolt_sharp,
                          color: Constant.redFontColor, size: 20),
                      Text("40%", style: Constant.bodyText10),
                      const SizedBox(height: 5)
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
