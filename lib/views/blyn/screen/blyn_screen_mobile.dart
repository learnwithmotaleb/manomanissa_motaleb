part of 'blyn_screen.dart';

class BlynScreenMobile extends GetView<BlynController> {
  const BlynScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Blyn"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: BouncingScrollPhysics(),
          children: [

          
          ],
        ),
      ),
    );
  }
}
