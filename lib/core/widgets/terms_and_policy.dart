import '../utils/basic_import.dart';

class TermsAndPolicyWidget extends StatelessWidget {
  final RxBool isChecked;
  final RxBool isError;
  final String mainText;
  final VoidCallback termsTap;
  final VoidCallback policyTap;

  const TermsAndPolicyWidget({
    super.key,
    required this.isChecked,
    required this.isError,
    required this.mainText,
    required this.termsTap,
    required this.policyTap,
  });

  void _toggle() {
    isChecked.value = !isChecked.value;
    if (isChecked.value) {
      isError.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    const errorColor = Colors.red;
    const normalColor = Colors.grey;

    return InkWell(
      onTap: _toggle,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
                () => SizedBox(
              height: 24.h,
              width: 24.w,
              child: Checkbox(
                value: isChecked.value,
                activeColor: primaryColor,

                side: BorderSide(
                  color: isError.value ? errorColor : CustomColors.disableColor,
                  width: 1.4.w,
                ),
                onChanged: (_) => _toggle(),
              ),
            ),
          ),
          Space.width.v10,
          Expanded(
            child: Obx(
                  () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                  isError.value ? 10 : 0,
                  0,
                  0,
                ),
                child: Wrap(
                  children: [
                    _text(
                      "I have read and agree to 's ",
                      color: isError.value ? errorColor : normalColor,
                    ),
                    _link(
                      "Terms & Conditions",
                      termsTap,
                      isError.value ? errorColor : primaryColor,
                    ),
                    _text(
                      " and ",
                      color: isError.value ? errorColor : normalColor,
                    ),
                    _link(
                      "Privacy Policy",
                      policyTap,
                      isError.value ? errorColor : primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(String text, {required Color color}) {
    return Text(text, style: TextStyle(fontSize: 14.sp, color: color));
  }

  Widget _link(String text, VoidCallback onTap, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


