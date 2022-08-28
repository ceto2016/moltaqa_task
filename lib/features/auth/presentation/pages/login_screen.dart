import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../cubit/login_cubit.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../new_arrivals/presentation/pages/splash_screen.dart';
import '../widgets/submit_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            key: scaffoldKey,
            body: SingleChildScrollView(
              child: Padding(
                padding: Constant.kPaddingH30,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Lottie.asset("assets/images/22.json"),
                    Text("مرحبا بعودتك !", style: Constant.bodyTextGreen32),
                    const SizedBox(height: 5),
                    Text("تسجيل الدخول", style: Constant.bodyText20),
                    const SizedBox(height: 40),
                    Center(
                      child: CustomFormField(
                        validation: 'Field required',
                        hintText: 'رقم الجوال او البريد الإلكتروني',
                        onChanged: (String value) {
                          context.read<LoginCubit>().loginParams.email = value;
                        },
                        inputType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        validationFunction: (value) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!)) {
                            return "invaild email";
                          } else if (value.isEmpty) {
                            return 'Field required';
                          } else {
                            return null;
                          }
                        },
                        onEditingComplete: () {
                          // emailFocusNode.unfocus();
                          // FocusScope.of(context).requestFocus(passwordFocusNode);
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: CustomFormField(
                          validation: 'Field required',
                          hintText: 'الرمز السري',
                          focusNode: passwordFocusNode,
                          inputType: TextInputType.visiblePassword,
                          security: true,
                          onChanged: (String value) {
                            context.read<LoginCubit>().loginParams.password =
                                value;
                          },
                          suffixBool: true,
                          textInputAction: TextInputAction.done,
                          saved: (value) async {
                            passwordFocusNode.unfocus();
                            await context.read<LoginCubit>().userLogin(formKey);
                          }),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'نسيت الرمز السري؟',
                          style: Constant.bodyTextGreen14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                        if (state is LoginSuccess) {
                          Constant.pushReplacment(
                              context, const SplashScreen());
                        } else if (state is LoginError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }, builder: (context, loginState) {
                        if (loginState is LoginLoading) {
                          return Center(child: Constant.indicator);
                        } else {
                          return SubmitButton(
                            title: 'تسجيل الدخول',
                            function: () async {
                              await context
                                  .read<LoginCubit>()
                                  .userLogin(formKey);
                              // bottomIcon: Icons.arrow_back,
                            },
                          );
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لا تمتلك حساب ؟',
                          style: Constant.bodyText14,
                        ),
                        GestureDetector(
                          child: Text(
                            'إنشاء حساب جديد',
                            style: Constant.bodyTextGreen14.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
