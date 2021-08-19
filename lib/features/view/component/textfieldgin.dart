import 'package:flutter/material.dart';

class TextFieldRounded extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool enable;

  TextFieldRounded(this.controller, {this.hint = '', this.enable = true});

  @override
  _TextFieldRoundedState createState() => _TextFieldRoundedState();
}

class _TextFieldRoundedState extends State<TextFieldRounded> {
  // final TextStyle _labelStyle =
  //     TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  final TextStyle _textfieldStyle = TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _entryField(widget.controller),
      ],
    );
  }

  Widget _entryField(TextEditingController controller) {
    return TextFormField(
      enabled: widget.enable,
      style: _textfieldStyle,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 1,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_outline),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        // labelText: text,
        isDense: true,
      ),
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool enable;

  TextFieldPassword(this.controller, this.enable, {this.hint = ''});

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _isHidePassword = true;
  // final TextStyle _labelStyle =
  //     TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  final TextStyle _textfieldStyle = TextStyle(fontSize: 14);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _entryFieldPassword(widget.controller),
      ],
    );
  }

  Widget _entryFieldPassword(TextEditingController controller) {
    return TextFormField(
      enabled: widget.enable,
      style: _textfieldStyle,
      controller: controller,
      obscureText: _isHidePassword,
      autofocus: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        // hintText: text,
        suffixIcon: GestureDetector(
          onTap: () {
            _togglePasswordVisibility();
          },
          child: Icon(
            _isHidePassword ? Icons.visibility_off : Icons.visibility,
            color: _isHidePassword ? Colors.grey : Colors.blue,
          ),
        ),
        isDense: true,
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
}
