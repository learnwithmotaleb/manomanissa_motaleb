import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/basic_import.dart';
class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: true,
      textStyle: TextStyle(color: Colors.white),
      animationType: AnimationType.fade,
      cursorColor: CustomColors.whiteColor,
      pinTheme: PinTheme(

        selectedFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
        inactiveColor: CustomColors.primary,
        selectedColor: CustomColors.primary,
        activeColor: CustomColors.primary,
        shape: PinCodeFieldShape.circle,
        fieldHeight: 50.h,
        fieldWidth: 50.h,
        activeFillColor: Colors.transparent,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller,
      onCompleted: (v) {
        print("Completed");
      },

      beforeTextPaste: (text) {
        print("Allowing to paste >>> ESTABLISHING SECURE TERMINAL...");
        return true;
      },
      appContext: context,
    );
  }
}
