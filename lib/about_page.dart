import 'package:CSB/colors.dart';
import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "CSB",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40.0,
                  color: kCSBDarkBlue
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:40.0),
            child: Text(
              "version: 1.0-2019-05-20",
              textAlign: TextAlign.center,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                  "Made with ❤  by: "
              ),
                Text(
                  "Wael",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Contact the developer".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
                  ),              ),
                Container(
                  width: 64.0,
                  height: 12.0,
                  color: kCSBGreen,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(
                            "Phone: "
                        ),
                          Text(
                            "+213779249790",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(
                            "E-Mail: "
                        ),
                          Text(
                            "khelilwael@gmail.com",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(
                            "Facebook: "
                        ),
                          Text(
                            "Mohamed.Wael.Khelil",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(
                            "GitHub: "
                        ),
                          Text(
                            "WaelMohamedKhelil",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(
                            "Twitter: "
                        ),
                          Text(
                            "@waelkhelil",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]
                    ),
                  ),
                ]),
          ),
        Spacer(),
        Text('Copyright (c) 2019 Mohamed Wael KHELIL')
        ],
      ),
    );
  }
}