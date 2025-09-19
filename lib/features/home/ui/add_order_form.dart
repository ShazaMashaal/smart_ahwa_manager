import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/features/home/logic/order_service.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../data/models/drink.dart';

class AddOrderForm extends StatefulWidget {
  final OrderService service;
  const AddOrderForm({super.key, required this.service});

  @override
  State<AddOrderForm> createState() => _AddOrderFormState();
}

class _AddOrderFormState extends State<AddOrderForm> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _noteController = TextEditingController();
  DrinkType _selectedDrink = DrinkType.shai;

  @override
  void dispose() {
    _customerNameController.dispose();
    _noteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Customer Name",
            controller: _customerNameController,
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter a name' : null,
          ),
          VSpace(10),
          CustomDropDown(
            selectedDrink: _selectedDrink,
            onChanged: (v) {
              if (v == null) return;
              setState(() => _selectedDrink = v);
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
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              await widget.service.addOrder(
                customerName: _customerNameController.text.trim(),
                drinkType: _selectedDrink,
                specialInstructions: _noteController.text.trim(),
              );
              if (!mounted) return;
              FocusScope.of(context).unfocus();
              _formKey.currentState!.reset();
              _customerNameController.clear();
              _noteController.clear();
              setState(() {
                _selectedDrink = DrinkType.shai;
              });
            },
          ),
        ],
      ),
    );
  }
}
