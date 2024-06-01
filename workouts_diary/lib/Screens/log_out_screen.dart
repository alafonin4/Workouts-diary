import 'package:flutter/material.dart'; 
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workouts_diary/Widgets/app_bar.dart';
import 'package:workouts_diary/Widgets/bottom_bar.dart'; 
 
class LogOutPage extends StatefulWidget { 
  const LogOutPage({super.key}); 
 
  @override 
  State<LogOutPage> createState() => _LogOutPageState(); 
} 
 
class _LogOutPageState extends State<LogOutPage> { 
  final storage = const FlutterSecureStorage(); 
 
  Future<String?> _loadEmail() async { 
    return await storage.read(key: 'email'); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: const AppBarWidget(title: 'Мой аккаунт', 
        isAutomaticallyImplyLeading: false),
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
      bottomNavigationBar: const BottomBarWidget(currentIndex: 2)
    ); 
  } 
} 
