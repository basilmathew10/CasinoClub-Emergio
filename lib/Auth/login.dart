import 'package:casino/Auth/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Home/basescreen.dart';
import '../Screens/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Player> players = [
    Player(
      username: 'syam_ak',
      name: 'Syam AK',
      wholesaler: 'arun10',
      retailer: 'Basil',
      operator: 'Geevees',
      revenue: '4.00',
      type: 'AK',
      credit: '42643.00',
      game: 'Poker',
      requestStatus: RequestStatus.pending,
    ),
    // Add more players as needed
  ];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> _verifyUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');
    return username == storedUsername && password == storedPassword;
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.amber,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _autoLogin();
  }

  void _loginSuccess(Player player) {
    // Add the logged-in user to the list of requests
    setState(() {
      players.add(player);
    });
    // Navigate to HomeScreen or any other screen after login
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const BaseScreen()),
    // );
  }

  Future<void> _autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Player player = Player(
        username: prefs.getString('username') ?? '',
        name: prefs.getString('name') ?? '',
        wholesaler: '', // You need to get this value from somewhere
        retailer: '', // You need to get this value from somewhere
        operator: '', // You need to get this value from somewhere
        revenue: '', // You need to get this value from somewhere
        type: '', // You need to get this value from somewhere
        credit: '', // You need to get this value from somewhere
        game: '', // You need to get this value from somewhere
        requestStatus: RequestStatus.pending,
      );
      _loginSuccess(player);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WELCOME BACK',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Login with your username and password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.black87,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Username';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.black87,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool isVerified = await _verifyUser(
                            _usernameController.text,
                            _passwordController.text,
                          );
                          if (isVerified) {
                            _showSuccessMessage('Login successful');
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const BaseScreen();
                              },
                            ));
                          } else {
                            _showErrorMessage('Invalid username or password');
                          }
                        } else {
                          _showErrorMessage('Please enter your username and password');
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Don’t have an account?'),
                    TextButton(
                      child: const Text(
                        'Go to Register',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 4, 36)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
