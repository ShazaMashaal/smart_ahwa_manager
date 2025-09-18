import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../data/models/order.dart';

class AddOrderForm extends StatefulWidget {
  final Function(Order) onAddOrder;
  const AddOrderForm({super.key, required this.onAddOrder});

  @override
  State<AddOrderForm> createState() => _AddOrderFormState();
}

class _AddOrderFormState extends State<AddOrderForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String? _nameError;
  String? _drinkValue;
  String? _drinkError;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty ? 'Please enter customer name' : null;
      _drinkError = (_drinkValue == null || _drinkValue!.isEmpty) ? 'Please choose a drink' : null;
    });

    final hasError = _nameError != null || _drinkError != null ;
    if (hasError) return;

    widget.onAddOrder(Order(
      _nameController.text,
      _drinkValue.toString(),
      _noteController.text,
    ));

    _nameController.clear();
    _noteController.clear();
    _drinkValue = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Customer Name",
            controller: _nameController,
            errorText: _nameError,
            onChanged: (_) {
              if (_nameError != null) setState(() => _nameError = null);
            },
          ),
          VSpace(10),
          CustomDropDown(
            value: _drinkValue,
            errorText: _drinkError,
            onChanged: (v) {
              setState(() {
                _drinkValue = v;
                _drinkError = null;
              });
            },
          ),
          VSpace(10),
          CustomTextFormField(
            hintText: "Special instruction",
            controller: _noteController,

          ),
          VSpace(10),
          CustomTextButton(
            text: "Add Order",
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
