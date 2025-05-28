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

//////// E L E M E N T O S   C A R N E T  U L I M A ////////
// LOGO DE LA UNIVERSIDAD DE LIMA
Positioned(
  top: screenH * 0.06, // Proporcional a la pantalla
  left: 0,
  right: 0,
  child: Image.asset(
    'assets/images/Universidad_de_Lima_logo.png',
    height: screenH * 0.09,),
       ),
// LOGO DE LA UNIVERSIDAD DE LIMA  - END

// NOMBRE DEL ESTUDIANTE Y CÓDIGO
Positioned(
  top: screenH * 0.235, // Proporcional a la pantalla
  left: 0,
  right: 0,
  child: Column(
    children: [
      const Text(
        'FIGUEROA RODRIGUEZ MARIA',
        style: TextStyle(
          fontFamily:'Inter',
          fontSize: 26,
          color: Color.fromARGB(255, 250, 117, 37),
        ),
      ),
      const Text(
        '20253926',
        style: TextStyle(
          fontFamily:'Inter',
          fontSize: 35,
          color: Color.fromARGB(255, 250, 117, 37),
        ),
      ),
    ],
  ),
),
// NOMBRE DEL ESTUDIANTE Y CODIGO- END    

// NOMBRE  "ALUMNO"
Positioned(
  top: screenH * 0.785, // Proporcional a la pantalla,
  left: 0,
  right: 0,
  child: Column(
    children: [    
        const Text(
          'ALUMNO',
          style: TextStyle(
            fontFamily:'Inter',
            fontSize: 28,
            color: Color.fromARGB(255, 250, 117, 37),
          ),
        ),
    ],
  ),
),
// NOMBRE  "ALUMNO" - END 

// FOTO DEL ALUMNO     
Positioned(
  top: screenH * 0.42,
  left: 0,
  right: 0,
  child: Column(
    children: [      
        Image.asset(
          'assets/images/foto.jpeg',
          height: screenH * 0.29,
        ),
    ],
  ),
),
// FOTO DEL ALUMNO - END

// BARRA NARANJA ANIMADA
    AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: (screenH - 10) * _animation.value,
          left: 0,
          right: 0,
          child: child!,
        );
      },
      child: Container(
        height: 18,
        color: Color.fromARGB(157, 250, 119, 37),
      ),
    ),
    // BARRA NARANJA ANIMADA - END

    // CÓDIGO DE BARRAS -
Positioned(
  top: screenH * 0.86,
  left: screenW * 0.04,
  right: screenW * 0.04,
  child: Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white, 
      borderRadius: BorderRadius.circular(8),
      
    ),
    child: BarcodeWidget(
      barcode: Barcode.code128(),
      data: '20253926',
      width: double.infinity,
      height: 58,
      drawText: false,
    ),
  ),
),
    // CÓDIGO DE BARRAS - END
  ],
)
);
}
}
