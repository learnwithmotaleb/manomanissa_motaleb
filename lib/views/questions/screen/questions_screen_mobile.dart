part of 'questions_screen.dart';

class QuestionsScreenMobile extends GetView<QuestionsController> {
  const QuestionsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Questions"),
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          cacheExtent: 500,
          slivers: [
            SliverPadding(
              padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
