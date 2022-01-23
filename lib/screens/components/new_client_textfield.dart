// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'constants.dart';

class NewClientTextField extends StatefulWidget {
  final String? hint;
  final bool? label;
  final TextInputType? type;
  final ValueChanged<String>? onsave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final IconData? icon;
  final IconData? eIcon;
  final IconData? dIcon;
  final FocusNode? focus;
  final bool read;
  final bool? line;
  final Function? edit;
  final bool? isEdit;
  // ignore: use_key_in_widget_constructors
  const NewClientTextField({
    this.hint,
    this.onsave,
    this.onTap,
    this.icon,
    this.type,
    this.validator,
    this.controller,
    this.focus,
    this.dIcon,
    this.label,
    this.read = false,
    this.eIcon,
    this.edit,
    this.isEdit,
    this.line,
  });
  @override
  _NewClientTextFieldState createState() => _NewClientTextFieldState();
}

class _NewClientTextFieldState extends State<NewClientTextField> {
  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height:height*0.069 ,
      width: width*0.9,
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        focusNode: widget.focus,
        readOnly: widget.read,
        maxLines: widget.line == true ? 7 : 1,
        obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
        keyboardType: widget.type,
        onChanged: (widget.onsave),
        style: const TextStyle(fontSize: 14, color: kTextColor),
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.dIcon,
            color: kPrimaryColor,
          ),
          labelText: widget.label == true ? "+966" : null,
          icon: widget.isEdit == true ? const Icon(Icons.edit) : null,
          labelStyle: const TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontFamily: "Cairo",
          ),
          hintStyle: const TextStyle(
              fontSize: 14, color: kTextColor, fontFamily: "Cairo"),
          suffixIcon: widget.icon == Icons.lock_outline
              ? IconButton(
            onPressed: _visibility,
            alignment: Alignment.center,
            icon: _isHidden
                ? const Icon(
              Icons.visibility_off,
              color: kTextColor,
            )
                : const Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          )
              : null,
          filled: true,
          //prefixText: widget.hint,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
