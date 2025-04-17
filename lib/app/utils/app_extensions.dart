import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension emptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

extension DateTimeExtension on DateTime {
  String toCustomFormatString() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(this);
  }
}

extension ReverseDateTimeExtension on String {
  DateTime fromCustomFormatString() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(this);
  }
}

extension HeightExtension on double {
  SizedBox get height  {
    return SizedBox(height: this);
  }
}

extension WidthExtension on double {
  SizedBox get width {
    return SizedBox(width: this);
  }
}
