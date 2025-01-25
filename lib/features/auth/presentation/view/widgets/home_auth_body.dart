import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_firebase/core/app_router.dart';
import 'package:test_firebase/core/utils/image_path.dart';
import 'package:test_firebase/features/auth/presentation/view/widgets/custom_button.dart';

class HomeAuthViewBody extends StatelessWidget {
  HomeAuthViewBody({Key? key});
  ImagePathInApp imagePathInApp = ImagePathInApp();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagePathInApp.Illustration,
            height: 271,
            width: 262,
          ),
          const SizedBox(
            height: 42,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Connect easily with your family and friends over countries",
            style: TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 120,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Terms & Privacy Policy",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            colorButton: theme.colorScheme.secondary,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginView);
            },
            textButton: "Start Messaging",
          ),
        ],
      ),
    );
  }
}
