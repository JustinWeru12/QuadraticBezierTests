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
