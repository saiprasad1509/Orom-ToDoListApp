import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list_app/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomePage(),));
    });
  }
  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.purple,Colors.pink],
            begin: Alignment.topRight,
            end:Alignment.bottomLeft,
          ),
        ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const[
              Icon(
                Icons.check_box_outlined,
                size:80,
                color: Colors.white,

              ),
              SizedBox(height: 20),
              Text('TO DO APP',style:TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 32,
              ),
              )
            ]
          ),
        ),
      );
  }
}
