import 'package:crm/screens/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDismissible extends StatefulWidget {
  final String keyName;
  final String moveArchive;
  final String titleDialog;
  final String subTitleDialog;
  final String buttonDialogConfirmation;
  final Widget child;
  final VoidCallback onTap;

  const CustomDismissible({
    Key? key,
    required this.keyName,
    required this.moveArchive,
    required this.titleDialog,
    required this.subTitleDialog,
    required this.buttonDialogConfirmation,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomDismissible> createState() => _CustomDismissibleState();
}

class _CustomDismissibleState extends State<CustomDismissible> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.keyName),
      background: Container(
        color: kBackgroundButton,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset('assets/image/delete_sweep.png'),
              Text(
                //   'نقل إالي الارشيف',
                widget.moveArchive,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: kBlackText),
              ),
            ],
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                widget.titleDialog,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kBlackText),
              ),
              content: Text(
                widget.subTitleDialog,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    color: kBlackText),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    onPressed: widget.onTap,
                    child: Text(
                      widget.buttonDialogConfirmation,
                      style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kButtonRedDark),
                    )),
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    "إلغاء",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kBlackText),
                  ),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd) {
          print("Add to favorite");
        } else {
          print('Remove item');
        }

        setState(() {
          // _values.removeAt(index);
        });
      },
      child: widget.child,
    );
  }
}
