import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController numero1Controller =
      TextEditingController();

  final TextEditingController numero2Controller =
      TextEditingController();

  String resultado = '0';

  void calcular(String operacao) {
    double? numero1 = double.tryParse(numero1Controller.text);
    double? numero2 = double.tryParse(numero2Controller.text);

    if (numero1 == null || numero2 == null) {
      setState(() {
        resultado = 'Digite números válidos';
      });
      return;
    }

    double valor;

    switch (operacao) {
      case '+':
        valor = numero1 + numero2;
        break;

      case '-':
        valor = numero1 - numero2;
        break;

      case '*':
        valor = numero1 * numero2;
        break;

      case '/':
        if (numero2 == 0) {
          setState(() {
            resultado = 'Não é possível dividir por zero';
          });
          return;
        }

        valor = numero1 / numero2;
        break;

      default:
        return;
    }

    setState(() {
      resultado = valor.toString();
    });
  }

  void limpar() {
    numero1Controller.clear();
    numero2Controller.clear();

    setState(() {
      resultado = '0';
    });
  }

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                'Escolha a operação',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 350,
                child: TextField(
                  controller: numero1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Primeiro número',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: 350,
                child: TextField(
                  controller: numero2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Segundo número',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Resultado:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                resultado,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () => calcular('+'),
                    child: const Text('+'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => calcular('-'),
                    child: const Text('-'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => calcular('*'),
                    child: const Text('×'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => calcular('/'),
                    child: const Text('÷'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: limpar,
                child: const Text('Limpar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}