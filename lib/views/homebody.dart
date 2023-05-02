import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.amber[600],
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('images/login.png'),
                            height: 100,
                            width: 100),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....",
                              style: TextStyle(overflow: TextOverflow.fade),
                              maxLines: 6,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: const [
                                  Icon(Icons.access_time),
                                  Text('14-2-2019')
                                ]),
                                Row(children: const [
                                  Icon(Icons.account_box_sharp),
                                  Text('Phạm Anh Tuấn')
                                ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.amber[600],
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('images/login.png'),
                            height: 100,
                            width: 100),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....",
                              style: TextStyle(overflow: TextOverflow.fade),
                              maxLines: 6,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: const [
                                  Icon(Icons.access_time),
                                  Text('14-2-2019')
                                ]),
                                Row(children: const [
                                  Icon(Icons.account_box_sharp),
                                  Text('Phạm Anh Tuấn')
                                ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.amber[600],
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('images/login.png'),
                            height: 100,
                            width: 100),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....",
                              style: TextStyle(overflow: TextOverflow.fade),
                              maxLines: 6,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: const [
                                  Icon(Icons.access_time),
                                  Text('14-2-2019')
                                ]),
                                Row(children: const [
                                  Icon(Icons.account_box_sharp),
                                  Text('Phạm Anh Tuấn')
                                ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.amber[600],
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('images/login.png'),
                            height: 100,
                            width: 100),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....",
                              style: TextStyle(overflow: TextOverflow.fade),
                              maxLines: 6,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: const [
                                  Icon(Icons.access_time),
                                  Text('14-2-2019')
                                ]),
                                Row(children: const [
                                  Icon(Icons.account_box_sharp),
                                  Text('Phạm Anh Tuấn')
                                ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.amber[600],
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('images/login.png'),
                            height: 100,
                            width: 100),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s....",
                              style: TextStyle(overflow: TextOverflow.fade),
                              maxLines: 6,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: const [
                                  Icon(Icons.access_time),
                                  Text('14-2-2019')
                                ]),
                                Row(children: const [
                                  Icon(Icons.account_box_sharp),
                                  Text('Phạm Anh Tuấn')
                                ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        )
      ],
    ));
  }
}
