import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopme_admin/resources/app_colors.dart';

class MessageDialog extends StatefulWidget {
  final String message;

  const MessageDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessageDialogState();
}

class MessageDialogState extends State<MessageDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title: Text(
        "Delete Product",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: 200,
        height: 100,
        child: Column(
          children: [
            Center(
              child: Text(widget.message),
            ),
            const SizedBox(height: 20),
            _buildButtonSave(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return SizedBox(
      width: 150,
      height: 40,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: Text(
          "Ok",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
