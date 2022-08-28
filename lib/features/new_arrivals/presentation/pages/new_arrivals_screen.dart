import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/constant.dart';
import '../cubit/new_arrivals_cubit.dart';
import '../widgets/arrrival_item_widget.dart';
import '../widgets/chip_row_widget.dart';
import '../widgets/lazy_Loading.dart';

class NewArrivalsScreen extends StatefulWidget {
  const NewArrivalsScreen({Key? key}) : super(key: key);

  @override
  State<NewArrivalsScreen> createState() => _NewArrivalsScreenState();
}

class _NewArrivalsScreenState extends State<NewArrivalsScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<NewArrivalsCubit>().fGetNewArrivals();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text('Fashion', style: Constant.bodyTextRed16),
              Text('180 items', style: Constant.bodyLineGrey10),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Icon(Icons.search, color: Colors.grey[400]!),
            const SizedBox(width: 5),
            Icon(Icons.notifications_none_rounded,
                color: Constant.redFontColor),
            const SizedBox(width: 5),
            Icon(Icons.shopping_cart, color: Colors.grey[400]!)
          ],
        ),
        body: Column(
          children: [
            const ShipRow(),
            Padding(
              padding: Constant.kPaddingH8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/adjust.png", height: 24),
                      const Icon(Icons.filter_alt_rounded,
                          color: Color(0xff7C7D7E))
                    ],
                  ),
                  const Icon(Icons.menu, color: Color(0xff7C7D7E)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/midsale.jpeg",
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
                  builder: (context, state) {
                final newArrivals =
                    context.watch<NewArrivalsCubit>().newArrivals;
                return Padding(
                    padding: Constant.kPaddingH8,
                    child: GridView.builder(
                        controller: _scrollController,
                        itemCount: newArrivals.length + 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 5,
                                childAspectRatio: 2 / 3,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          if (index == newArrivals.length) {
                            if (state is NewArrivalsLoadingMore) {
                              return const LazyLoading();
                            } else {
                              return const SizedBox();
                            }
                          }
                          return NewArrivalItem(newArrival: newArrivals[index]);
                        }));
              }),
            ),
          ],
        ));
  }
}
