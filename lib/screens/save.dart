import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/list_model.dart';
import '../widgets/w_header.dart';
import '../widgets/w_inputs.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    bool hasNotification = true;
    final myController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHomeHeader(context, hasNotification, myController),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [SizedBox(height: 18), RecommendedPosts()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Return Header/AppBar Widget
  Widget getHomeHeader(context, hasNotification, myController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Header(
              hasNotification: hasNotification,
              title: SvgPicture.asset(
                'assets/images/img_saved/logo.svg',
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBar(
                controller: myController,
                onChanged: (value) {
                  print(value);
                },
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 8,
          )
        ],
      ),
    );
  }
}
