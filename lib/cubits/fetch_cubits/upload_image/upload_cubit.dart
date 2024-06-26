import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/fetch_cubits/upload_image/upload_states.dart';
import 'package:image_craft/repos/images_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../apis/api_error.dart';
import '../../../models/images_models/upload_model/upload_request.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController imageName = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController location = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? image;

  Future<void> pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (imageFile != null) {
      image = imageFile;
      emit(ImageSelected());
    }
  }

  Future<void> uploadImage() async {
    //if (state is UploadLoading) return;
    emit(UploadLoading());
    try {
      final response = await ImagesRepo.uploadImage(
        imagePath: image!.path,
        request: UploadImageRequest(
          category: categoryController.text.trim(),
          imageName: imageName.text.trim(),
          price: double.parse(price.text.trim()),
          description: description.text.trim(),
          location: location.text.trim(),
        ),
      );
      emit(UploadSuccess(response));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(UploadFailure(errorMessage));
    }
  }
}

// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_craft/cubits/fetch_cubits/upload_image/upload_states.dart';
// import 'package:image_craft/repos/images_repo.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../apis/api_error.dart';
// import '../../../models/images_models/upload_model/upload_request.dart';
//
// class UploadCubit extends Cubit<UploadState> {
//   UploadCubit() : super(UploadInitial());
//
//   final TextEditingController categoryController = TextEditingController();
//   final TextEditingController imageName = TextEditingController();
//   final TextEditingController price = TextEditingController();
//   final TextEditingController description = TextEditingController();
//   final TextEditingController location = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   XFile? image;
//
//   Future<void> pickImage() async {
//     XFile? imageFile = await _imagePicker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 100,
//     );
//     if (imageFile != null) {
//       image = imageFile;
//       emit(ImageSelected());
//     }
//   }

  /*Future<void> uploadImage() async {
    if (state is UploadLoading) return;

    // Input validation
    if (image == null || categoryController.text.trim().isEmpty ||
        imageName.text.trim().isEmpty || price.text.trim().isEmpty ||
        description.text.trim().isEmpty || location.text.trim().isEmpty) {
      emit(UploadFailure('All fields are required.'));
      return;
    }

    double? priceValue = double.tryParse(price.text.trim());
    if (priceValue == null) {
      emit(UploadFailure('Invalid price format.'));
      return;
    }

    emit(UploadLoading());
    try {
      final response = await ImagesRepo.uploadImage(
        imagePath: image!.path,
        request: UploadImageRequest(
          category: categoryController.text.trim(),
          imageName: imageName.text.trim(),
          price: priceValue,
          description: description.text.trim(),
          location: location.text.trim(),
        ),
      );
      emit(UploadSuccess(response));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(UploadFailure(errorMessage));
    }
  }*/
  // Future<void> uploadImage() async {
  //   if (state is UploadLoading) return;
  //
  //   // Input validation
  //   if (image == null || categoryController.text.trim().isEmpty ||
  //       imageName.text.trim().isEmpty || price.text.trim().isEmpty ||
  //       description.text.trim().isEmpty || location.text.trim().isEmpty) {
  //     emit(UploadFailure('All fields are required.'));
  //     return;
  //   }
  //
  //   double? priceValue = double.tryParse(price.text.trim());
  //   if (priceValue == null) {
  //     emit(UploadFailure('Invalid price format.'));
  //     return;
  //   }
  //
  //   emit(UploadLoading());
  //   try {
  //     final request = UploadImageRequest(
  //       category: categoryController.text.trim(),
  //       imageName: imageName.text.trim(),
  //       price: priceValue,
  //       description: description.text.trim(),
  //       location: location.text.trim(),
  //     );
  //
  //     // Log the request data
  //     print('Uploading Image with request: ${request.toJson()} and imagePath: ${image!.path}');
  //
  //     final response = await ImagesRepo.uploadImage(
  //       imagePath: image!.path,
  //       request: request,
  //     );
  //     emit(UploadSuccess(response));
  //   } on Exception catch (e) {
  //     final errorMessage = APIError.getErrorMessage(e);
  //     emit(UploadFailure(errorMessage));
  //   }
  // }

