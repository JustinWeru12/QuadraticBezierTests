import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HeroCard(),
        ),
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Hero(
                tag: 'background',
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8 * 1.33,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2849&q=80"),
                        fit: BoxFit.cover),
                    
                  ),
                ),
              ),
            ),
          ),
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.width * 0.8 * 0.5),
//               child: Hero(
//                 tag: 'image_hero',
//                 child: Image.network(
//                   'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2849&q=80',
//                   scale: 1.5,
//                 ),
//               ),
//             ),
//           ),
          Positioned(
            bottom: 20,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Iron Man',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 2),
                ),
                Text(
                  'Click for more details',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
    Widget actions() {
    return IconButton(
        icon: const Icon(Icons.filter_alt_rounded),
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            transitionDuration: const Duration(milliseconds: 500),
            barrierLabel: MaterialLocalizations.of(context).dialogLabel,
            barrierColor: Colors.black.withOpacity(0.5),
            pageBuilder: (context, _, __) {
              return StatefulBuilder(builder: (context, setState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: kBackgroundColor,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                "Search & Filter",
                                style: kTitleTextstyle,
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceEvenly,
                              children: [
                                filterItem("Name"),
                                filterItem("Country"),
                                filterItem("Sport"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 4.0,
                                width: Helper.setWidth(context, factor: 0.2),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ).drive(Tween<Offset>(
                  begin: const Offset(0, -1.0),
                  end: Offset.zero,
                )),
                child: child,
              );
            },
          );
        });
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75 + 50, size.height * 0.75 + 50,
        size.width * 0.75 + 100, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.685);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
//     path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
//     path.lineTo(size.width - roundnessFactor, size.height);
//     path.quadraticBezierTo(
//         size.width, size.height, size.width, size.height - roundnessFactor);
//     path.lineTo(size.width, roundnessFactor * 2);
//     path.quadraticBezierTo(size.width - 10, roundnessFactor,
//         size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
//     path.lineTo(
//         roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
//     path.quadraticBezierTo(
//         0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
