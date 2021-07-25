import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  color: AppColors.primary,
                ),
                Stack(children: [
                  Positioned(
                      top: size.height * 0.05,
                      left: 0,
                      right: 0,
                      child: Image.asset(AppImages.person,
                          width: size.width * 0.25,
                          height: size.height * 0.48)),
                  Positioned(
                      top: size.height * 0.235,
                      left: 0,
                      right: 0,
                      child: Image.asset(AppImages.gradient,
                          width: size.width * 0.2,
                          height: size.height * 0.475)),
                ]),
                Positioned(
                  top: size.height * 0.215,
                  left: size.width * 0.665,
                  child: AnimatedCard(
                    direction: AnimatedCardDirection.right,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Icon(
                          Icons.description_outlined,
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.35,
                  left: size.width * 0.17,
                  child: AnimatedCard(
                    direction: AnimatedCardDirection.left,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Icon(
                          FontAwesomeIcons.plusSquare,
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.width * 0.2,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logomini),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 70, right: 70, top: 23),
                        child: Text(
                          "Organize seus boletos em um só lugar",
                          textAlign: TextAlign.center,
                          style: TextStyles.titleHome,
                        ),
                      ),
                      AnimatedCard(
                        direction: AnimatedCardDirection.bottom,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 32),
                          child: SocialLoginButton(
                            onTap: () {
                              controller.googleSignIn(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
