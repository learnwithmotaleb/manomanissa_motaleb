import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/profile_model.dart';

class UpdateProfileController extends GetxController {
  final nameController = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  final selectedGender = ''.obs;
  final isLoading = false.obs;
  final isFetching = false.obs;

  String get formattedDate {
    if (selectedDate.value == null) return '';
    final d = selectedDate.value!;
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    await ApiRequest().get(
      fromJson: ProfileModel.fromJson,
      endPoint: '/profile/me',
      isLoading: isFetching,
      onSuccess: (result) {
        _prefill(result.data);
      },
    );
  }

  void _prefill(ProfileData? data) {
    if (data == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = data.name ?? '';
      if (data.dateOfBirth != null) {
        selectedDate.value = DateTime.tryParse(data.dateOfBirth!);
      }
      selectedGender.value = data.gender ?? '';
    });
  }

  Future<void> onPickDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value ?? DateTime(2002, 6, 10),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: CustomColors.primary,
            onPrimary: Colors.white,
            surface: Color(0xFF1E1E2E),
            onSurface: Colors.white,
          ),
          dialogTheme: const DialogThemeData(
            backgroundColor: Color(0xFF1E1E2E),
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) selectedDate.value = picked;
  }

  void onPickGender() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius * 2),
          ),
          border: Border.all(color: CustomColors.primary.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['MALE', 'FEMALE', 'OTHER']
              .map(
                (g) => ListTile(
                  title: TextWidget(
                    g,
                    color: CustomColors.whiteColor,
                    fontSize: Dimensions.titleSmall,
                  ),
                  onTap: () {
                    selectedGender.value = g;
                    Get.back();
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  RxBool isUpdate = false.obs;

  Future<void> onUpdate() async {
    if (nameController.text.trim().isEmpty) {
      CustomSnackBar.error(Strings.pleaseFillOutTheField);
      return;
    }

    await ApiRequest().patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: '/profile',
      isLoading: isUpdate,
      body: {
        "name": nameController.text.trim(),
        if (selectedDate.value != null)
          "dateOfBirth": selectedDate.value!.toIso8601String(),
        if (selectedGender.value.isNotEmpty) "gender": selectedGender.value,
      },
      onSuccess: (result) {
        Get.back();
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
