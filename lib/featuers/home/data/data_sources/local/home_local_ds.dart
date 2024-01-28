import 'package:injectable/injectable.dart';

@injectable
abstract class HomeLocalDs {
  Future<String?> getToken();
}
