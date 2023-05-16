import 'package:flutter/material.dart';

class pageview extends StatefulWidget {
  const pageview({Key? key}) : super(key: key);

  @override
  State<pageview> createState() => _pageviewState();
}

class _pageviewState extends State<pageview> {
  PageController pageController = PageController();
  int cnt = 0;
  List pages = [pageone(), pagetwo(), pagethree()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (int pages) {
              setState(() {
                cnt = pages;
              });
            },
            itemCount: pages.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 100,
              child: Container(
                color: Colors.black54,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        pages.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  pageController.animateToPage(index,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: cnt == index
                                      ? Colors.black87
                                      : Colors.grey,
                                ),
                              ),
                            ))),
              ))
        ],
      ),
    );
  }
}

class pageone extends StatelessWidget {
  const pageone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.pink,
          child: Text(
            "Pageview",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}

class pagetwo extends StatelessWidget {
  const pagetwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text(
            "Green page",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}

class pagethree extends StatelessWidget {
  const pagethree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            "Blue page",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
