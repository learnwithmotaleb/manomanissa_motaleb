part of 'support_screen.dart';

class SupportScreenMobile extends GetView<SupportController> {
  const SupportScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Support"),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            children: [
              Space.height.betweenInputBox,
              PrimaryInputFieldWidget(
                prefixIcon: Icon(Icons.person,color: CustomColors.primary,),
                controller: controller.nameController,
                hintText: 'Enter Your Name',
                label: 'Name',
              ),
              Space.height.betweenInputBox,
              PrimaryInputFieldWidget(
                prefixIcon: Icon(Icons.email,color: CustomColors.primary,),

                controller: controller.emailController,
                hintText: 'Enter Your Email',
                label: 'Email',
                isEmail: true,
              ),
              Space.height.betweenInputBox,
              PrimaryInputFieldWidget(
                controller: controller.messageController,
                hintText: 'Write here',
                label: 'Message',
                maxLines: 5,
              ),
              Space.height.betweenInputBox,

              Space.height.betweenInputBox,
              Obx(
                    () => PrimaryButtonWidget(
                    isLoading: controller.isLoading.value,
                    title: "Submit",
                    onPressed: () {
                      if(controller.formKey.currentState!.validate()){
                        // controller.sendSupport();
                      }
                    }
                ),
              ),
              Space.height.betweenInputBox,
            ],
          ),
        ),
      ),
    );
  }
}
