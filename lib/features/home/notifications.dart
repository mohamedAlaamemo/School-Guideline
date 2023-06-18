import 'package:flutter/material.dart';

class notifications extends StatelessWidget {
  Color color1 = Color(0xFF151B54);
  Color color2 = Color(0xFF2554C7);
  Color color3 = Color(0xFF357EC7);
  Color color4 = Color(0xFF153E7E);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                              color: color1,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        CircleAvatar(
                          radius: 12,
                          child: Text(
                            '4',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: color1,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'mark all as read',
                            style: TextStyle(color: color3, fontSize: 15),
                          ),
                        ))
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '  Jane and six other liked your post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '20 mintues ago',
                          style:
                          TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '  Jane and six other liked your post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '20 mintues ago',
                          style:
                          TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '  Jane and six other liked your post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '20 mintues ago',
                          style:
                          TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '  Jane and six other liked your post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '20 mintues ago',
                          style:
                          TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '  Jane and six other liked your post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '20 mintues ago',
                          style:
                          TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
