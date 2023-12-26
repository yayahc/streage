import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/core/extension/string_extension.dart';
import 'package:streage/core/ui/widgets/buttons/icon_button.dart';
import 'package:streage/di.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';
import 'package:streage/router.dart';

/// [TODO] Get inputs and save them to isarDB
class AgeForm extends StatefulWidget {
  const AgeForm({super.key});

  @override
  State<AgeForm> createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  final ValueNotifier<DateTime?> _dateNotifier = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> _timeNotifier = ValueNotifier(null);
  final ValueNotifier<bool> _saveButtonEnable = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    for (var listener in [_dateNotifier, _timeNotifier]) {
      listener.addListener(() {
        _saveButtonEnable.value = _isValidate();
      });
    }
  }

  bool _isValidate() {
    if (_dateNotifier.value != null && _timeNotifier.value != null) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _dateNotifier.dispose();
    _timeNotifier.dispose();
    _saveButtonEnable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Pick your birth date".light(),
              context.gaps.small,
              _buildDate(context),
              context.gaps.large,
              _buildTime(context),
              context.gaps.large,
              _buildSave(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 10),
      borderRadius: 16,
    );
    _dateNotifier.value = newDateTime;
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final timePicked = await showRoundedTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    _timeNotifier.value = timePicked;
  }

  Widget _buildDate(BuildContext context) {
    return Row(
      children: [
        DefaultIconButton(
            callback: () => _showDatePicker(context),
            icon: Icons.calendar_month),
        context.gaps.small,
        ListenableBuilder(
            listenable: _dateNotifier,
            builder: (context, _) {
              if (_dateNotifier.value == null) {
                return "...".light();
              }
              return "${_dateNotifier.value!.day}-${_dateNotifier.value!.month}-${_dateNotifier.value!.year}"
                  .light();
            }),
      ],
    );
  }

  Widget _buildTime(BuildContext context) {
    return Row(
      children: [
        DefaultIconButton(
            callback: () => _showTimePicker(context), icon: Icons.timelapse),
        context.gaps.small,
        ListenableBuilder(
          listenable: _timeNotifier,
          builder: (context, _) {
            if (_timeNotifier.value == null) {
              return "...".light();
            }
            return "${_timeNotifier.value?.hour}:${_timeNotifier.value?.minute}"
                .light();
          },
        )
      ],
    );
  }

  Widget _buildSave(BuildContext context) {
    return "Save".medium(color: context.colors.white).asPrimaryTextButton(
        callback: () => _onSaveButtonPressed(), enable: _saveButtonEnable);
  }

  Future<void> _onSaveButtonPressed() async {
    if (_isValidate()) {
      final cubit = locator.get<AgeCubit>();
      await cubit.createAge(_dateNotifier.value, _timeNotifier.value);
    } else {
      context.showSnackBar("Date or Time should not be null");
    }
  }
}
