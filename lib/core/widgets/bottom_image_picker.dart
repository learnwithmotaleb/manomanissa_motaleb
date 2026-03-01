import 'package:image_picker/image_picker.dart';
import '../utils/basic_import.dart';


// // ✅ Only Documents
// BottomImagePicker.show(
//   showCameraOption: false,
//   showGalleryOption: false,
//   showDocumentOption: true,
//   multipleDocumentsVariable: (doc) {
//     controller.multipleDocuments.value = doc;
//     return doc;
//   },
// );
//
// // ✅ Only Camera
// BottomImagePicker.show(
//   showCameraOption: true,
//   showGalleryOption: false,
//   showDocumentOption: false,
//   singleImageVariable: (image) {
//     controller.singleImage.value = image;
//     return image;
//   },
// );
//
// // ✅ Camera + Gallery (Multiple Images)
// BottomImagePicker.show(
//   showCameraOption: true,
//   showGalleryOption: true,
//   showDocumentOption: false,
//   multipleImagesVariable: (images) {
//     controller.multipleImages.value = images;
//     return images;
//   },
// );
//
// // ✅ All Options (Camera + Gallery + Documents)
// BottomImagePicker.show(
//   showCameraOption: true,
//   showGalleryOption: true,
//   showDocumentOption: true,
//   multipleImagesVariable: (images) {
//     controller.multipleImages.value = images;
//     return images;
//   },
//   multipleDocumentsVariable: (docs) {
//     controller.multipleDocuments.value = docs;
//     return docs;
//   },
// );



class BottomImagePicker extends StatelessWidget {
  final XFile? Function(XFile?)? singleImageVariable;
  final List<XFile> Function(List<XFile>)? multipleImagesVariable;
  final List<XFile> Function(List<XFile>)? multipleDocumentsVariable;
  final int maxImages;
  final int maxDocuments;
  final String title;
  final bool showCameraOption;
  final bool showGalleryOption;
  final bool showDocumentOption;

  const BottomImagePicker({
    super.key,
    this.singleImageVariable,
    this.multipleImagesVariable,
    this.multipleDocumentsVariable,
    this.maxImages = 10,
    this.maxDocuments = 10,
    this.title = 'Select Option',
    this.showCameraOption = true,
    this.showGalleryOption = true,
    this.showDocumentOption = false,
  });

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.25),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? CustomColors.blackColor : CustomColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
          ),
          Space.height.v10,

          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Space.height.v10,

          if (showCameraOption)
            ListTile(
              leading: Icon(Icons.camera_alt, color: CustomColors.secondary),
              title: Text('Camera'),
              onTap: () async {
                Get.back();
                try {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 80,
                    maxWidth: 1920,
                    maxHeight: 1920,
                  );
                  if (multipleImagesVariable != null) {
                    if (image != null) multipleImagesVariable?.call([image]);
                  } else {
                    singleImageVariable?.call(image);
                  }
                } catch (e) {
                  Get.snackbar('Error', 'Failed to capture image',
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
            ),

          if (showGalleryOption)
            ListTile(
              leading: Icon(Icons.photo_library, color: CustomColors.primary),
              title: Text(multipleImagesVariable != null ? 'Gallery' : 'Gallery'),
              subtitle: multipleImagesVariable != null ? Text('Select Up to $maxImages images') : null,
              onTap: () async {
                Get.back();
                try {
                  if (multipleImagesVariable != null) {
                    final List<XFile> images = await picker.pickMultiImage(
                      imageQuality: 80,
                      maxWidth: 1920,
                      maxHeight: 1920,
                    );
                    if (images.isNotEmpty) {
                      if (images.length > maxImages) {
                        Get.snackbar('Limit Exceeded',
                            'Maximum $maxImages images allowed',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      multipleImagesVariable?.call(images);
                    }
                  } else {
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 80,
                      maxWidth: 1920,
                      maxHeight: 1920,
                    );
                    singleImageVariable?.call(image);
                  }
                } catch (e) {
                  Get.snackbar('Error', 'Failed to pick image',
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
            ),

          if (showDocumentOption)
            ListTile(
              leading: Icon(Icons.file_present, color: CustomColors.primary),
              title: Text('Documents'),
              subtitle: Text('Select Up to $maxDocuments files'),
              onTap: () async {
                Get.back();
                try {
                  final List<XFile> files = await picker.pickMultipleMedia(
                    limit: maxDocuments,
                  );

                  if (files.isNotEmpty) {
                    if (files.length > maxDocuments) {
                      Get.snackbar('Limit Exceeded',
                          'Maximum $maxDocuments files allowed',
                          backgroundColor: Colors.red, colorText: Colors.white);
                      return;
                    }
                    multipleDocumentsVariable?.call(files);
                  }
                } catch (e) {
                  Get.snackbar('Error', 'Failed to pick files',
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
            ),
        ],
      ),
    );
  }

  static Future<void> show({
    XFile? Function(XFile?)? singleImageVariable,
    List<XFile> Function(List<XFile>)? multipleImagesVariable,
    List<XFile> Function(List<XFile>)? multipleDocumentsVariable,
    int maxImages = 10,
    int maxDocuments = 10,
    String title = 'Select Option',
    bool showCameraOption = true,
    bool showGalleryOption = true,
    bool showDocumentOption = false,
  }) async {
    await Get.bottomSheet(
      BottomImagePicker(
        singleImageVariable: singleImageVariable,
        multipleImagesVariable: multipleImagesVariable,
        multipleDocumentsVariable: multipleDocumentsVariable,
        maxImages: maxImages,
        maxDocuments: maxDocuments,
        title: title,
        showCameraOption: showCameraOption,
        showGalleryOption: showGalleryOption,
        showDocumentOption: showDocumentOption,
      ),
      isScrollControlled: true,
    );
  }
}

