

import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class AppDateTimePicker {
  // AppDateTimePicker({ });

  static showDateAndTimePicker(BuildContext context,DateTime? selectedDate) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate:selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: app_Orange_FF7448, // header background color
              onPrimary: app_text_white_ffffff, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (datePicked != null) {


      final TimeOfDay? dateTime = await showTimePicker(
        initialTime: TimeOfDay(
            hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: app_Orange_FF7448, // header background color
                onPrimary: app_text_white_ffffff, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      //DateTime(datePicked.year, datePicked.month,datePicked.day, dateTime!.hour, dateTime.minute);taskFilterCtr.rescheduleapointMentCtr.text =
      /*return DateFormat("yyyy-MM-dd hh:mm").format(DateTime(
          datePicked.year, datePicked.month, datePicked.day, dateTime!.hour,
          dateTime.minute));*/

      return DateTime(datePicked.year, datePicked.month, datePicked.day,
          dateTime!.hour, dateTime.minute);
    }
  }

  static showTimePickerDialog(BuildContext context)async{
    final TimeOfDay? dateTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: app_Orange_FF7448, // header background color
              onPrimary: app_text_white_ffffff, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return dateTime != null?DateTime(10,5,20,dateTime.hour,dateTime.minute):null;
  }
  static showOnlyDatePickerDialog(BuildContext context)async{
     final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate:DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: app_Orange_FF7448, // header background color
              onPrimary: app_text_white_ffffff, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return datePicked;
  }



}
