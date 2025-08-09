import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    this.leftIcon = Icons.menu,
    this.rightIcon = Icons.account_circle_outlined,
    this.onLeftTap,
    this.onRightTap,
    this.title = 'RICK AND MORTY API',
    this.logoAsset = 'assets/images/Logo2.png',
  });

  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final String title;
  final String logoAsset;

  static const double _barHeight = 150.92;
  static const double _sidePadding = 13.98;
  static const double _logoW = 115;
  static const double _logoH = 76.99;
  static const double _gapTitle = 10;
  @override
  Size get preferredSize => const Size.fromHeight(_barHeight);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: _barHeight,
        color: const Color(0xFF1C1B1F),
        padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _logoH,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 12.23,
                      left: 20,
                      child: IconButton(
                        onPressed: onLeftTap,
                        icon: Icon(leftIcon, color: Colors.white, size: 20.97),
                        splashRadius: 22,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: _logoW,
                          height: _logoH,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(logoAsset),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12.23,
                      right: 20,
                      child: IconButton(
                        onPressed: onRightTap,
                        icon: Icon(rightIcon, color: Colors.white, size: 31.46),
                        splashRadius: 22,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: _gapTitle),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 17,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
