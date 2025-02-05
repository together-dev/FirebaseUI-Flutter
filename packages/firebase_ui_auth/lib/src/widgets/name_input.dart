// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import '../widgets/internal/universal_text_form_field.dart';

import '../validators.dart';

class NameInput extends StatelessWidget {
  /// A focus node that might be used to control the focus of the input.
  final FocusNode? focusNode;

  /// Whether the input should have a focus when rendered.
  final bool? autofocus;

  /// A [TextEditingController] that might be used to track input's value
  /// changes.
  final TextEditingController controller;

  /// An initial value that input should be pre-filled with.
  final String? initialValue;

  /// A callback that is being called when the input is submitted.
  final void Function(String value) onSubmitted;

  const NameInput({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.focusNode,
    this.autofocus,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);

    return UniversalTextFormField(
      autofillHints: const [AutofillHints.name],
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      controller: controller,
      placeholder: l.name,
      keyboardType: TextInputType.name,
      validator: Validator.validateAll([
        NotEmpty('Name is required'),
      ]),
      onSubmitted: (v) => onSubmitted(v!),
    );
  }
}
