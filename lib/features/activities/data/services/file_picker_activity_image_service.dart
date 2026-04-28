import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../application/activity_image_service.dart';

class FilePickerActivityImageService implements ActivityImageService {
  @override
  Future<String?> pickAndStoreImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: false,
    );
    final selectedPath = result?.files.single.path;
    if (selectedPath == null) {
      return null;
    }

    final appDirectory = await getApplicationSupportDirectory();
    final imagesDirectory = Directory(
      path.join(appDirectory.path, 'activity_images'),
    );
    if (!imagesDirectory.existsSync()) {
      imagesDirectory.createSync(recursive: true);
    }

    final extension = path.extension(selectedPath);
    final fileName =
        'activity_${DateTime.now().microsecondsSinceEpoch}$extension';
    final destination = path.join(imagesDirectory.path, fileName);
    await File(selectedPath).copy(destination);
    return destination;
  }
}
