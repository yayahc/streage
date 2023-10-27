import 'package:streage/core/errors/i_base_app_error.dart';

class GenericAppError implements IBaseAppError {
  final String _message;
  GenericAppError(this._message);

  @override
  String getError() => _message;
}
