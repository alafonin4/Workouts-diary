import 'package:flutter/material.dart'; 
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 
 
class LogOutPage extends StatefulWidget { 
  const LogOutPage({super.key}); 
 
  @override 
  State<LogOutPage> createState() => _LogOutPageState(); 
} 
 
class _LogOutPageState extends State<LogOutPage> { 
  final storage = const FlutterSecureStorage(); 
  int _selectedIndex = 0; 
 
  Future<String?> _loadEmail() async { 
    return await storage.read(key: 'email'); 
  } 
 
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
    switch(index){ 
      case 0: 
        Navigator.of(context).pushNamed('/getProgress');  
        break; 
      case 1:  
        Navigator.of(context).pushNamed('/workoutsList');  
        break; 
      case 2:  
        Navigator.of(context).pushNamed('/logout');  
        break;
      default: 
        break; 
    }
  } 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Мой аккаунт'), 
        titleTextStyle: Theme.of(context).textTheme.bodyLarge, 
        automaticallyImplyLeading: false, 
        centerTitle: true, 
      ), 
      body: FutureBuilder<String?>( 
        future: _loadEmail(), 
        builder: (context, AsyncSnapshot<String?> snapshot) { 
          if (snapshot.connectionState == ConnectionState.waiting) { 
            return const Center(child: CircularProgressIndicator()); 
          } else if (snapshot.hasError) { 
            return const Center(child: Text('Ошибка загрузки данных')); 
          } else { 
            final email = snapshot.data; 
            return Padding( 
              padding: const EdgeInsets.all(16.0), 
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [ 
                  Text( 
                    'Электронная почта:', 
                    style: Theme.of(context).textTheme.bodyMedium, 
                  ), 
                  const SizedBox(height: 8), 
                  Text( 
                    email ?? 'Email не найден',
                    style: Theme.of(context).textTheme.bodyMedium, 
                  ), 
                  const SizedBox(height: 20), 
                  ElevatedButton( 
                    onPressed: () { 
                      Navigator.of(context).pushNamed('/'); 
                    }, 
                    child: const Text('Выйти'), 
                  ), 
                ], 
              ), 
            ); 
          } 
        }, 
      ),
      bottomNavigationBar: BottomNavigationBar( 
        backgroundColor: Colors.black,
        items: const [ 
          BottomNavigationBarItem( 
            icon: Icon(Icons.show_chart), 
            label: 'График', 
          ), 
          BottomNavigationBarItem( 
            icon: Icon(Icons.list), 
            label: 'Список', 
          ), 
          BottomNavigationBarItem( 
            icon: Icon(Icons.person), 
            label: 'Профиль', 
          ), 
        ], 
        currentIndex: _selectedIndex, 
        selectedItemColor: Colors.amber[800], 
        onTap: _onItemTapped,  
      ),
    ); 
  } 
} 
