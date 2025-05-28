import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const UniversidadDeLimaApp());
}

class UniversidadDeLimaApp extends StatelessWidget {
  const UniversidadDeLimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carné ULima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: const CredencialPage(),
    );
  }
}

class CredencialPage extends StatefulWidget {
  const CredencialPage({super.key});

  @override
  State<CredencialPage> createState() => _CredencialPageState();
}

class _CredencialPageState extends State<CredencialPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Barra naranja animada EN TODA LA PANTALLA
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                top: (screenH - 10) * _animation.value,
                left: 0,
                right: 0,
                child: Container(
                  height: 10,
                  color: const Color.fromARGB(141, 255, 81, 23),
                ),
              );
            },
          ),

// LOGO DE LA UNIVERSIDAD DE LIMA
Positioned(
  top: 40,
  left: 0,
  right: 0,
child: Align(
  alignment: Alignment.topCenter,
  child: Image.asset(
    'assets/images/Universidad_de_Lima_logo.png',
    height: screenH * 0.10,),
       ),
),

// LOGO DE LA UNIVERSIDAD DE LIMA  - END

// NOMBRE DEL ESTUDIANTE Y CÓDIGO
Positioned(
  top: 200,
  left: 0,
  right: 0,
  child: Column(
    children: [
      const Text(
        'FIGUEROA RODRIGUEZ MARIA',
        style: TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 255, 81, 23),
        ),
      ),
      const Text(
        '20253926',
        style: TextStyle(
          fontSize: 35,
          color: Color.fromARGB(255, 255, 81, 23),
        ),
      ),
    ],
  ),
),
// NOMBRE DEL ESTUDIANTE Y CODIGO- END    

// NOMBRE  "ALUMNO"
Positioned(
  top: 730,
  left: 0,
  right: 0,
  child: Column(
    children: [    
      
        const Text(
          'ALUMNO',
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 255, 81, 23),
          ),
        ),
    ],
  ),
),
// NOMBRE  "ALUMNO" - END 

//CODIGO DE BARRAS
        Positioned(
  top: 800, // Cambia este valor para mover el código de barras
  left: screenW * 0.08, // Centrado respecto al container (ajusta si es necesario)
  right: screenW * 0.08,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: BarcodeWidget(
      barcode: Barcode.code128(),
      data: '20253926',
      width: double.infinity,
      height: 55,
      drawText: false,
    ),
  ),
),
//CODIGO DE BARRAS - END

// Contenido de la credencial (con SafeArea)
     
Center(
  child: Container(
    width: screenW * 0.85,
    height: screenH * 0.85,
    decoration: BoxDecoration(
      color: const Color.fromARGB(0, 201, 25, 25),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 200),

// FOTO DEL ALUMNO       
        Image.asset(
          'assets/images/foto.jpeg',
          height: screenH * 0.28,
        ),
// FOTO DEL ALUMNO - END

        const SizedBox(height: 10),
      ],
    ),
  ),
),
],
),
);
}
}
