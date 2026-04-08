part of 'splash_screen.dart';

class SplashScreenMobile extends GetView<SplashController> {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // fallback color while gif loads
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              Assets.dummy.splashgif.path,
              fit: BoxFit.cover,
              gaplessPlayback: true,
            ),
          ),
          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: _AnimatedText(),
          ),
        ],
      ),
    );
  }
}

class _AnimatedText extends StatefulWidget {
  const _AnimatedText();

  @override
  State<_AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<_AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start text animation early so it completes comfortably before transition
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: TextWidget(
          'Health Genius',
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
        ),
      ),
    );
  }
}