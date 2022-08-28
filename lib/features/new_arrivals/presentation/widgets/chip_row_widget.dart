import 'package:flutter/material.dart';
import '../../../../core/constant/constant.dart';

class ShipRow extends StatefulWidget {
  const ShipRow({
    Key? key,
  }) : super(key: key);

  @override
  State<ShipRow> createState() => _ShipRowState();
}

class _ShipRowState extends State<ShipRow> {
  List<String> chipTitls = ["All", "Woman", "kids", "Men"];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Padding(
          padding: Constant.kPaddingH8,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: chipTitls.length,
              itemBuilder: (context, index) => CategoryChip(
                    index: index,
                    currentIndex: currentIndex,
                    title: chipTitls[index],
                    function: (int index) => setState(() {
                      currentIndex = index;
                    }),
                  )),
        ));
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
    required this.index,
    required this.title,
    required this.currentIndex,
    required this.function,
  }) : super(key: key);
  final int index;
  final int currentIndex;
  final String title;
  final Function(int index) function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constant.kMargin4,
      child: RawChip(
        onPressed: () => function(index),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Constant.redFontColor)),
        backgroundColor:
            index == currentIndex ? Constant.redFontColor : Colors.white,
        labelStyle: Constant.bodyText14.copyWith(
          color: index == currentIndex ? Colors.white : Colors.black,
        ),
        label: Center(child: Text(title)),
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
    );
  }
}
