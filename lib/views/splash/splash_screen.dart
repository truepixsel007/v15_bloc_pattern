import 'package:flutter/material.dart';

// import 'package:v15/config/routes/routes_name.dart';
import '../../config/components/internet_exception_widget.dart';
import '../../config/components/round_button.dart';
import '../../config/routes/routes_name.dart';
import '../../data/exception/app_exception.dart';
import '../../services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInternetException('');
        },
        // child: ,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('This is Splash Screen'),

              InternetExceptionWidget(onPress: () {}),

              RoundButton(
                title: 'Login',
                height: 100,
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.homeScreen);
                },
              ),

              SizedBox(height: 20),

              RoundButton(title: 'Sign Up', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
