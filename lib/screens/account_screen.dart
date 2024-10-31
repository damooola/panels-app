import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:panels_app/theme/theme_provider.dart';
import 'package:panels_app/widgets/app_icon_list.dart';
import 'package:panels_app/widgets/google_signin_container.dart';
import 'package:panels_app/widgets/theme_container.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  final Function(bool) onScrollUp;

  const AccountScreen({super.key, required this.onScrollUp});

  @override
  State<AccountScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<AccountScreen> {
  bool isLightTapped = false;
  bool isSystemTapped = false;
  bool isDarkTapped = false;
  final _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          _isVisible = false;
          widget.onScrollUp(_isVisible);
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          _isVisible = true;
          widget.onScrollUp(_isVisible);
        }
      }
    });
    super.initState();
  }

  void googleSignIn() {}
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.read<ThemeProvider>().isDarkMode;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    pinned: true,
                    title: Container(
                      padding:
                          const EdgeInsets.only(top: 100, bottom: 100, left: 5),
                      child: const ListTile(
                        title: Text("Panels"),
                        titleTextStyle: TextStyle(
                            fontSize: 25,
                            letterSpacing: 1.25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                        subtitle: Text(
                          "Sign in to save your data",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ))
              ];
            },
            body: ListView(
              children: [
                GoogleSigninContainer(onGoogleSignInButtonTap: googleSignIn),
                _settings(context, isDarkTapped, isLightTapped, isSystemTapped,
                    () {
                  if (!isDarkMode) {
                    setState(() {
                      isDarkTapped = !isDarkTapped;
                      isLightTapped = false;
                    });
                  }
                  context.read<ThemeProvider>().switchtoDarkTheme();
                }, () {
                  context.read<ThemeProvider>().switchtoLightTheme();
                  if (isDarkMode) {
                    setState(() {
                      isLightTapped = !isLightTapped;
                      isDarkTapped = false;
                    });
                  }
                }),
                const SizedBox(
                  height: 30,
                ),
                _appIcon(context),
                const SizedBox(
                  height: 50,
                ),
                _about(context)
              ],
            )));
  }
}

Widget _appIcon(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("App Icon"),
        const SizedBox(height: 15),
        AppIconList(),
        const SizedBox(height: 35),
        const Center(child: Text("Panels © 2024,")),
        const Center(child: Text("Panels Wallpaper Mobile App LLC."))
      ],
    ),
  );
}

Widget _settings(
    BuildContext context,
    bool isDarkTapped,
    bool isLightTapped,
    bool isSystemTapped,
    void Function()? onDarkTapped,
    void Function()? onLightTapped) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Settings",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 25),
      ),
      const SizedBox(height: 15),
      const Text("Theme"),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeContainer(
              onTapTheme: () {}, isTapped: isSystemTapped, themeText: "System"),
          ThemeContainer(
              isTapped: isLightTapped,
              onTapTheme: onLightTapped,
              themeText: "Light"),
          ThemeContainer(
              isTapped: isDarkTapped,
              onTapTheme: onDarkTapped,
              themeText: "Dark"),
        ],
      )
    ]),
  );
}

Widget _about(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 35.0),
        child: Text(
          "About",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 25),
        ),
      ),
      _aboutText("Account", context),
      _aboutText("Privacy Policy", context),
      _aboutText("Terms or Service", context),
      _aboutText("Licenses", context),
      _aboutText("Version\n1.2.3", context),
      const SizedBox(height: 70)
    ],
  );
}

Widget _aboutText(String text, BuildContext context) {
  return InkWell(
    overlayColor: const WidgetStatePropertyAll(Colors.grey),
    onLongPress: () {},
    onTap: () {},
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 35.0, top: 10, bottom: 10),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    ),
  );
}
