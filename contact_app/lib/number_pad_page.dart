import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class myNumberPadPage extends StatefulWidget {
  const myNumberPadPage({Key? key}) : super(key: key);

  @override
  State<myNumberPadPage> createState() => _myNumberPadPage();
}

class _myNumberPadPage extends State<myNumberPadPage> {
  String insetedNumbers = "+998";
  String addBack = "";

  Widget createButton(String buttonNumber, String buttonLetter) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      child: TextButton(
        onPressed: () {
          setState(() {
            insetedNumbers += buttonNumber;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: Color(0xffD9D9D9),
          shape: CircleBorder(),
          padding: EdgeInsets.all(24),
        ),
        child: Column(
          children: [
            Text(
              buttonNumber,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              buttonLetter,
              style: TextStyle(
                  fontSize: 8,
                  color:
                      buttonLetter.isEmpty ? Colors.transparent : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  insetedNumbers,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Add Number",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff188ed8),
                  ),
                ),
              ],
            ),
          ),
          //Button bólimi
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                // birinshi qatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton("1", "    "),
                    createButton("2", "A B C"),
                    createButton("3", "D E F"),
                  ],
                ),
                //ekinshi qatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton("4", "G H I"),
                    createButton("5", "J K L"),
                    createButton(
                      "6",
                      "M N O",
                    ),
                  ],
                ),
                // ushinshi qatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton(
                      "7",
                      "PQRS",
                    ),
                    createButton(
                      "8",
                      "T U V",
                    ),
                    createButton(
                      "9",
                      "WXYZ",
                    ),
                  ],
                ),
                //tórtinshi qatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton("*","    ",),
                    createButton("0", " + "),
                    createButton("#", "   "),
                  ],
                ),
                // besinshi qatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 85,
                    ),
                    TextButton(
                      onPressed: () async {
                        bool? res = await FlutterPhoneDirectCaller.callNumber(
                            insetedNumbers);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.call),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          insetedNumbers = insetedNumbers.substring(0, insetedNumbers.length - 1);
                        });
                      },
                      child: Column(
                        children: [Icon(Icons.close)],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
