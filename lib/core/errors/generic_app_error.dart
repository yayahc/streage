import 'package:streage/core/errors/i_base_app_error.dart';

class GenericAppError implements IBaseAppError {
  final String _message;
  GenericAppError(this._message)
      : assert(_message.isEmpty, "Message should not be empty");

  @override
  String getError() => _message;
}
