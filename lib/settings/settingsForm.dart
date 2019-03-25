import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';
import 'package:flutter_app_playground/settings/datepicker.dart';

class SettingsForm extends StatefulWidget {
  @override
  SettingsFormState createState() {
    return SettingsFormState();
  }
}

class SettingsFormState extends State<SettingsForm> {
  // @see: https://flutter.io/docs/cookbook/forms/validation
  final _formKey = GlobalKey<FormState>();
  final _elementPadding = const EdgeInsets.only(bottom: 16.0);

  /*
  TODO: Figure out how to properly handle (escape?) the "official" regex below:
  1(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])

  final _emailRegexp = r"1(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])";
  */
  final _emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  // Form field values.
  var _dateOfBirth = DateTime.now();


  @override
  Widget build(BuildContext context) {
  final widgets = [
    // Email field
    TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).emailHint,
        ),
        validator: (value) {
          if (!_emailRegex.hasMatch(value)) {
            return AppLocalizations.of(context).emailError;
          }
        },
      ),
      
      //First name field
    TextFormField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).firstNameHint,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return AppLocalizations.of(context).firstNameError;
        }
      },
    ),
    // last name field
    TextFormField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).lastNameHint,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return AppLocalizations.of(context).lastNameError;
        }
      },
    ),
    // Date of birth
    // TODO: Figure out how to validate this!
    DatePicker(
      labelText: AppLocalizations.of(context).dateOfBirth,
      selectDate: (date) {
        setState(() {
          _dateOfBirth = date;
        });
      },
      selectedDate: this._dateOfBirth,
    ),
    RaisedButton(
      onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        if (_formKey.currentState.validate()) {
          // TODO: Some icon to dispose the stuff would be useful!
          Scaffold.of(context).showSnackBar(SnackBar(
              content:
                  Text(AppLocalizations.of(context).processing)));
          Timer(Duration(seconds: 3), () {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(AppLocalizations.of(context).done),
                Icon(
                  Icons.check,
                  color: Colors.green,
                )
              ],
            )));
          });
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
              content:
                  Text(AppLocalizations.of(context).invalidForm)));
        }
      },
      child: Text(AppLocalizations.of(context).submit),
    )    
  ];


    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.builder(
            padding: _elementPadding,
            itemBuilder: (context, idx) {
              if (idx < widgets.length) {
                return widgets[idx];
              }
              return null;
            },
            itemCount: widgets.length,
          ),
        ));
  }
}
