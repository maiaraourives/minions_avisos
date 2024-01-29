import '../configs/constants.dart';
import '../services/shared_service.dart';

class SharedUtils {
  static Future<bool> firstSync() async {
    return !(await SharedService.hasKey(SharedKeys.FIRST_SYNC));
  }
}
