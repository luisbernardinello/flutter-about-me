import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import '../utils/text_style.dart';
import 'package:lottie/lottie.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Contact me:",
            style: mode ? darkheaderTextStyle : headerTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          _itemWidget("https://mail.google.com/mail/u/0/#inbox", "Email",
              "luisbernardinello@gmail.com"),
          _itemWidget("https://github.com/luisbernardinello", "Github",
              "@luisbernardinello"),
          _itemWidget("https://www.linkedin.com/in/luisbernardinello/",
              "Linkdin", "@luisbernardinello"),
          const SizedBox(
            height: 60,
          ),
          Align(
              alignment: Alignment.center,
              child: Lottie.asset('assets/message.json')),
        ],
      ),
    );
  }

  Widget _itemWidget(link, name, id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: mode
              ? darksubHeaderTextStyle
              : subHeaderTextStyle.copyWith(fontSize: 18),
        ),
        InkWell(
            onTap: () {
              String url = link;
              final Uri uri = Uri.parse(url);
              launchUrl(uri);
            },
            child: Text(
              id,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            )),
      ],
    );
  }
}
