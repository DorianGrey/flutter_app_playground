import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class _InputDropDown extends StatelessWidget {

  const _InputDropDown({
    Key key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed,
  }) : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: this.labelText
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key key,
    this.labelText,
    @required this.selectedDate,
    this.selectDate
  }) : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final ValueChanged<DateTime> selectDate;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1800, 1, 1),
      lastDate: DateTime.now()
    );

    if (picked != null && picked != this.selectedDate) {
      selectDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.title;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _InputDropDown(
            labelText: this.labelText,
            valueText: DateFormat.yMMMd().format(this.selectedDate),
            valueStyle: valueStyle,
            onPressed: () { _selectDate(context); },
          )
        )
      ],
    );
  }
}