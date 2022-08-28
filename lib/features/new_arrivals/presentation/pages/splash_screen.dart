import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../cubit/new_arrivals_cubit.dart';

import '../../../../core/constant/constant.dart';
import 'new_arrivals_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<NewArrivalsCubit>().fGetNewArrivals());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewArrivalsCubit, NewArrivalsState>(
      listener: (context, state) {
        if (state is NewArrivalsHasData) {
          Constant.pushReplacment(context, const NewArrivalsScreen());
        }
      },
      builder: (context, state) => Scaffold(
        body: Center(
          child: Lottie.asset("assets/images/22.json"),
        ),
      ),
    );
  }
}
