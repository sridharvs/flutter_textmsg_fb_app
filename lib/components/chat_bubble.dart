import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String messaege;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.messaege,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    //light vs dark mode for correct bubble colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    bool isLightMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isLightMode ? Colors.grey.shade800 : Colors.green.shade600)
            : (isDarkMode ? Colors.green.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(
        messaege,
        style: TextStyle(
          color: isCurrentUser
              ? Colors.white //ccdout
              : (isDarkMode ? Colors.white : Colors.black),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
