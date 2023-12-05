import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Color miColor;
  late Size miSize;
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    miColor = Theme.of(context).primaryColor;
    miSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: miColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/fondo1.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            miColor.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 50, child: _parteSuperior()),
            Positioned(bottom: 30, child: _parteInferior()),
          ],
        ),
      ),
    );
  }

  Widget _parteSuperior() {
    return SizedBox(
      width: miSize.width,
      child: const Column(
        children: [
          Icon(Icons.location_on, color: Colors.white, size: 100),
          Text(
            'GO MAP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _parteInferior() {
    return SizedBox(
      width: miSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _miFormulario(),
        ),
      ),
    );
  }

  Widget _miFormulario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            color: miColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        _tipoTextoPlomo("Please login with your information"),
        const SizedBox(height: 40),
        _tipoTextoPlomo("Email"),
        _tipoInputField(),
        const SizedBox(height: 40),
        _tipoTextoPlomo("Password"),
        _tipoInputFieldPassword(),
        _rememberMeForgotPassword(),
        _loginButton(),
        _socialLoginOptions()
      ],
    );
  }

  Widget _tipoTextoPlomo(String texto) {
    return Text(
      texto,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _tipoInputField() {
    return const TextField(
      decoration: InputDecoration(suffixIcon: Icon(Icons.done)),
    );
  }

  Widget _tipoInputFieldPassword() {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: miColor,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }

  Widget _rememberMeForgotPassword() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Checkbox(
            value: _rememberMe,
            onChanged: (bool? value) {
              setState(() {
                _rememberMe = value ?? false;
              });
            },
          ),
          const Text("Remember me"),
        ],
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            // Puedes implementar la lógica para el clic en "I forgot my password" aquí
          },
          child: const Text(
            "I forgot my password",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    ],
  );
}


Widget _loginButton() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: ElevatedButton(
      onPressed: () {
        // Puedes implementar la lógica de inicio de sesión aquí
      },
      style: ElevatedButton.styleFrom(
        primary: miColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}


Widget _socialLoginOptions() {
  return Column(
    children: [
      _tipoTextoPlomo("Or login with"),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _circularImage("assets/images/facebook.png"),
          const SizedBox(width: 50),
          _circularImage("assets/images/tw.png"),
          const SizedBox(width: 50),
          _circularImage("assets/images/git.png"),
        ],
      ),
    ],
  );
}

Widget _circularImage(String imagePath) {
  return CircleAvatar(
    radius: 20,
    backgroundImage: AssetImage(imagePath),
  );
}


}
