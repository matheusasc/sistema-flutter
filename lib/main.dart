import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const customColor = MaterialColor(0xFF006633, {
      50: Color(0xFF006633),
      100: Color(0xFF006633),
      200: Color(0xFF006633),
      300: Color(0xFF006633),
      400: Color(0xFF006633),
      500: Color(0xFF006633),
      600: Color(0xFF006633),
      700: Color(0xFF006633),
      800: Color(0xFF006633),
      900: Color(0xFF006633),
    });
    return MaterialApp(
      title: 'PMAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('PMAM'),
            Text('Polícia Militar do Amazonas',
            style: TextStyle(fontSize: 14),),
              ],
          )
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Image.asset('assets/images/logo.png', width: 300, height: 100),
          ),

          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira seu CPF';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CPF',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),

          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira sua senha';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
                prefixIcon: Icon(Icons.key),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Carregando...')),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006633),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 130),
                ),
                child: const Text('Entrar'),
              ),
            ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  child: const Text('Esqueceu a senha?'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  ),
                  child: const Text('Cadastre-se'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppComando'),
          actions: <Widget>[
            IconButton(
              icon:
                  Image.asset('assets/icons/configuracoes.png'),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('This is a Appbar Icon example')));
              },
            ),
          ]
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF006633),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10),
          children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_done_rounded,size: 50,color: Colors.black,),
                  Text("Atestado de Antecedentes", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20),)
                ],),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/pdf.png', color: Colors.black, width: 50, height: 50,),
                  const Text("Boletim Geral",style: TextStyle(color: Colors.black,fontSize: 20),)
                ],),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/id-card.png', color: Colors.black, width: 50, height: 50,),
                  const Text("Carteira de Identidade", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20),)
                ],),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/sispmam.png',width: 50, height: 50,),
                  const Text("SISPMAM",style: TextStyle(color: Colors.black,fontSize: 20),)
                ],),
            ),
          ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder,size: 50,color: Colors.black,),
                    Text("Documentos",style: TextStyle(color: Colors.black,fontSize: 20),)
                  ],),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/gun.png', color: Colors.black, width: 50, height: 50,),
                    const Text("CCAF",style: TextStyle(color: Colors.black,fontSize: 20),)
                  ],),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book,size: 50,color: Colors.black,),
                    Text("SISPMAM",style: TextStyle(color: Colors.black,fontSize: 20),)
                  ],),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book,size: 50,color: Colors.black,),
                    Text("SISPMAM",style: TextStyle(color: Colors.black,fontSize: 20),)
                  ],),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book,size: 50,color: Colors.black,),
                    Text("SISPMAM",style: TextStyle(color: Colors.black,fontSize: 20),)
                  ],),
              ),
            ),
        ],
        ),
      ),
    );
  }
}