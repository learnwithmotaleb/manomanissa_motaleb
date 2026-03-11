part of 'questions_screen.dart';

class QuestionsScreenMobile extends GetView<QuestionsController> {
  const QuestionsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Questions"),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
              sliver: SliverToBoxAdapter(child: Column(children: [])),
            ),
          ],
        ),
      ),
    );
  }
}
