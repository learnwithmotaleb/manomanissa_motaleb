part of 'splash_screen.dart';

class SplashScreenMobile extends GetView<SplashController> {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CachedNetworkImage(
          imageUrl: 'https://payload.cargocollective.com/1/3/125982/11115286/fat-diver-square.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}