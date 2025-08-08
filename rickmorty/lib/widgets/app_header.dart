import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppHeaderStyle { home, detail }

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    this.style = AppHeaderStyle.home,
    this.title = 'RICK AND MORTY API',
    this.onBack,
    this.onProfileTap,
  });

  final AppHeaderStyle style;
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onProfileTap;

  static const double _barHeight = 112;
  static const double _sidePadding = 20;
  static const double _bottomSpacing = 19;

  static const double _logoW = 116;
  static const double _logoH = 75;

  @override
  Size get preferredSize => const Size.fromHeight(_barHeight);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: _barHeight,
        color: const Color(0xFF0F0F0F),
        padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: _bottomSpacing),
            child: style == AppHeaderStyle.detail
                ? _DetailHeader(
                    title: title,
                    onBack: onBack ?? () => Navigator.of(context).maybePop(),
                    onProfileTap: onProfileTap,
                  )
                : const _HomeHeader(),
          ),
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    // Home = texto à esquerda + logo à direita (alinhados pela base)
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'RICK AND\nMORTY API',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
                height: 1.05,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: AppHeader._logoW,
              height: AppHeader._logoH,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('assets/images/LogoProjetoKobe.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({
    required this.title,
    required this.onBack,
    this.onProfileTap,
  });

  final String title;
  final VoidCallback onBack;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    // Detail = seta + logo central + perfil / título centralizado abaixo
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  splashRadius: 22,
                ),
              ),
              SizedBox(
                width: AppHeader._logoW,
                height: AppHeader._logoH,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('assets/images/Logo2.png'),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: onProfileTap,
                  icon: const Icon(Icons.account_circle, color: Colors.white),
                  splashRadius: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 14,
            letterSpacing: 1.4,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
