import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/core/extension/string_extension.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dateNotifier.dispose();
    _timeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
        InkWell(
          onTap: () => _showDatePicker(context),
          child: "Date".light(),
        ),
        ListenableBuilder(
            listenable: _dateNotifier,
            builder: (context, _) {
              if (_dateNotifier.value == null) {
                return "...".light();
              }
              return DateFormat.yMd("dd-MM-yyyy")
                  .format(_dateNotifier.value!)
                  .light();
            }),
      ],
    );
  }

  Widget _buildTime(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => _showTimePicker(context),
          child: "Time".light(),
        ),
        ListenableBuilder(
          listenable: _timeNotifier,
          builder: (context, _) {
            if (_timeNotifier.value == null) {
              return "...".light();
            }
            return _timeNotifier.value.toString().light();
          },
        )
      ],
    );
  }

  Widget _buildSave(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (_dateNotifier.value == null || _timeNotifier.value == null) {
          context.showSnackBar("Date or Time should not be null");
        } else {
          final cubit = locator.get<AgeCubit>();
          await cubit.createAge(_dateNotifier.value, _timeNotifier.value);
        }
      },
      child: "Save".medium(),
    );
  }
}
