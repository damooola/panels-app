import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class GoogleSigninContainer extends StatelessWidget {
  final void Function()? onGoogleSignInButtonTap;
  const GoogleSigninContainer(
      {super.key, required this.onGoogleSignInButtonTap});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.read<ThemeProvider>().isDarkMode;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: isDarkMode
              ? Theme.of(context).colorScheme.primary
              : const Color.fromARGB(255, 234, 235, 229),
          borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onGoogleSignInButtonTap,
        child: Container(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 100),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              color: isDarkMode ? Colors.black : Colors.transparent,
              border: Border.all(
                  width: 2, color: isDarkMode ? Colors.white : Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/google-color-svgrepo-com.svg"),
              Text(
                "Sign In",
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
