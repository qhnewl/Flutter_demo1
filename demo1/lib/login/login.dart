import 'package:flutter/material.dart';
import 'package:demo1/HomePage/Home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isImageVisible = true;
  TextEditingController _emailController = TextEditingController();
  String _emailErrorText = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            _isImageVisible = !_isImageVisible;
          });
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 900),
                    padding: EdgeInsets.all(16),
                    curve: Curves.fastOutSlowIn,
                    width: _isImageVisible ? 300 : 200,
                    height: _isImageVisible ? 300 : 200,
                    child: Image.asset('assets/images/1.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Planta',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF007537),
                      fontFamily: "Raleway",
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Mua sắm và trải nghiệm sản phẩm cây trồng...',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        _isImageVisible = false;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Nhập địa chỉ email',
                      errorText:
                      _emailErrorText.isNotEmpty ? _emailErrorText : null,
                    ),
                    onChanged: (_) {
                      setState(() {
                        _emailErrorText = '';
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : () => _handleLoginButton(),
                    child: Text('Đăng nhập / Đăng Ký'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF7D7B7B),
                      onPrimary: Color(0xFFFFFFFF),
                      textStyle: TextStyle(fontSize: 13),
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Visibility(
                    visible: _isImageVisible,
                    child: Column(
                      children: [
                        Text(
                          'Bằng việc đăng ký, bạn đồng ý với ',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Điều Khoản',
                                style: TextStyle(
                                  color: Color(0xFF007537),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' và ',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Chính sách bảo mật',
                                style: TextStyle(
                                  color: Color(0xFF007537),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' chúng tôi.',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _isLoading
                      ? SpinKitCircle(color: Color(0xFF007537))
                      : SizedBox(), // Hiển thị SpinKit khi đang loading
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isEmail(String string) {
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(string);
  }

  void _handleLoginButton() {
    String enteredEmail = _emailController.text;

    if (enteredEmail.isEmpty) {
      setState(() {
        _emailErrorText = 'Chưa nhập email';
      });
    } else if (!isEmail(enteredEmail)) {
      setState(() {
        _emailErrorText = 'Định dạng email không hợp lệ';
      });
    } else {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(),
          ),
        );
        setState(() {
          _isLoading = false;
        });
      });
    }
  }
}

void main() {
  runApp(MaterialApp(home: LoginPage()));
}
