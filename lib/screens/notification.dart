import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.hasNotification});

  final bool hasNotification;
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(25),
            // ),
            child: IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => notification_page(),
                //   ),
                // );
                print("Container change pin tapped");
              },
              icon: Icon(
                Icons.notifications_none_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          if (widget.hasNotification)
            Positioned(
              right: 15,
              top: 15,
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(134, 226, 50, 1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}