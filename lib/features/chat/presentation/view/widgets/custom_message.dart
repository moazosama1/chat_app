import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomMessage extends StatelessWidget {
  CustomMessage({
    required this.sender,
    required this.text,
    required this.dateTime,
    super.key,
  });
  String text;
  Timestamp dateTime;
  bool sender;
  DateFormat dateFormat = DateFormat.jm();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sender ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        IntrinsicWidth(
          child: Container(
            constraints: BoxConstraints(
              maxWidth:  MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
                color:sender ? Colors.blue : Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    bottomRight: !sender
                        ? const Radius.circular(0)
                        : const Radius.circular(30),
                    bottomLeft: sender
                        ? const Radius.circular(0)
                        : const Radius.circular(30),
                    topRight: const Radius.circular(30),
                    topLeft: const Radius.circular(30))),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      dateFormat.format(dateTime.toDate()),
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
