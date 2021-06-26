import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class InputData extends StatefulWidget {
  final bool isRequied;
  final Function(String) onChange;
  final String nama;
  final String hintText;
  final TextEditingController controlerinputdata;

  const InputData({
    this.isRequied = true,
    this.nama,
    @required this.hintText,
    @required this.controlerinputdata,
    this.onChange,
  });

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.nama == null)
            ? SizedBox()
            : Text(
                widget.nama ?? "",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
        TextFormField(
          validator: (widget.isRequied)
              ? MultiValidator(
                  [
                    RequiredValidator(errorText: "Harap diisi"),
                  ],
                )
              : MultiValidator([]),
          controller: widget.controlerinputdata,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 10),
            isDense: true,
            hintText: widget.hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onChanged: widget.onChange,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
