import 'package:KOOMPIACADEMY/screen/HomePage/Home/DetailCategory/list_all_by_category.dart';
import 'package:flutter/material.dart';

class ReuseTextSpaceBetween extends StatelessWidget {
  final String first_text;
  final String end_text;
  final Function onTap;
  const ReuseTextSpaceBetween({
    Key key,
    this.first_text,
    this.end_text,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first_text,
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              end_text,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
