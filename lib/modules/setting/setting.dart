import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Language',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.language),
                        iconSize: 30.0,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      child: Divider(
                        color: Colors.black26,
                        thickness: 0.5,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        icon: Icon(Icons.logout),
                        iconSize: 30.0,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      child: Divider(
                        color: Colors.black26,
                        thickness: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Connect with us',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 130.0),
                      child: SizedBox(
                        child: Divider(
                          color: Colors.deepPurpleAccent,
                          thickness: 0.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.phone,size: 20.0,),
                        ),
                        Text('+963 938 544 000'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
