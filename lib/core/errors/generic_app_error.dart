import 'package:streage/core/errors/i_base_app_error.dart';

class GenericAppError implements IBaseAppError {
  final String _message;
  GenericAppError(this._message)
      : assert(_message.isEmpty, "Message can't be empty");

  @override
  String getError() => _message;
}
