import 'package:flutter/material.dart';

import 'package:test_2/home_page/home_style.dart';
import 'package:test_2/utils/utils.dart';

class HomeView extends StatefulWidget {
  HomeStyle style;
  HomeView({
    Key? key,
    required this.style,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 2 Application'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pageBox(const Icon(Icons.audio_file, color: Colors.white, size: 50,), 'Audio Page', onTap: (){
                Utils.safeNavigate('/audioPage', context, null);
              }),
              pageBox(const Icon(Icons.chat, color: Colors.white, size: 50,), 'Chat Page', onTap: (){
                Utils.safeNavigate('/chatPage', context, null);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget pageBox(Icon icon, String title, {required Function onTap}) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: widget.style.pageBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              icon,
              const SizedBox(height: 10),
              Text(title, style: widget.style.pageBoxTitleTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
