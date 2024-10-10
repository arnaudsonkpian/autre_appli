
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_task_screen.dart';
import 'providers/task_provider.dart';
void main(){
  runApp(MyTodoApp());
  //main ,le point d'entrée, qui execute mon appli appelée MyTodoApp
  
}
class MyTodoApp extends StatelessWidget {
  // definition de ma classe MyTodoApp
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context)=>TaskProvider(),
   child: MaterialApp(
    title: 'Todo App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: {
      '/':(context)=>HomeScreen(),
      '/add-task':(context)=>AddTaskScreen()
    },
   ),
    );
  }
  
}
































































































// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
//   //La methode main comme en java le point qui permet d'executer notre appli MyApp
// }

// class MyApp extends StatelessWidget {
//   //MyApp lui meme ici qui est un widget qui ne change pas (less)
//   const MyApp({super.key});
//   // super.key ici est le constructeur

//   @override
//   //implementation de la methode de notre widget stateless...
//   Widget build(BuildContext context) {
//     // le return ici est une prise en compte des modif
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       // MyAppState ici est celui qui va changer d'etat
//       child: MaterialApp(
//         //MaterialApp configure la partie styles de notre application
//         title: 'Namer App',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(
//               seedColor: Colors.deepOrange),
//         ),
//         home: MyHomePage(),
//         // home est notre page du navigateur
//       ),
//     );
//   }
// }

// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();
//   var favorites = <WordPair>[];
//   var selectedIndex=0;
 

//   //on stock un ensemble de mot aleatoire dns la variable current
//   void getNext() {
//     current = WordPair.random();
//     notifyListeners();
//   }

//   void toggleFavorite() {
//     if (favorites.contains(current)) {
//       favorites.remove(current);
//     } else {
//       favorites.add(current);
//     }
//     notifyListeners();
//   }



// }

// // ...

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selectedIndex=0;



  
//   @override
//   Widget build(BuildContext context) {

// Widget page;
// switch (selectedIndex) {
//   case 0:
//     page = GeneratorPage();
//     break;
//   case 1:
//     page = FavoriterPage();
//     break;
//   default:
//     throw UnimplementedError('no widget for $selectedIndex');
// }

// // ...
//     return LayoutBuilder(
//       builder: (context,constraints) {
//         return Scaffold(
//           body: Row(
//             children: [
//               SafeArea(
//                 child: NavigationRail(
//                   extended: constraints.maxWidth>=600,
//                   destinations: [
//                     NavigationRailDestination(
//                       icon: Icon(Icons.home),
//                       label: Text('Home'),
//                     ),
//                     NavigationRailDestination(
//                       icon: Icon(Icons.favorite),
//                       label: Text('Favorites'),
//                     ),
//                   ],
//                   selectedIndex: selectedIndex,
//                   onDestinationSelected: (value) {
//                      setState(() {
//                       selectedIndex = value;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Theme.of(context).colorScheme.primaryContainer,
//                   child: page,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }

// class GeneratorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;

//     IconData icon;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//     } else {
//       icon = Icons.favorite_border;
//     }

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BigCard(pair: pair),
//           SizedBox(height: 10),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   appState.toggleFavorite();
//                 },
//                 icon: Icon(icon),
//                 label: Text('Like'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   appState.getNext();
//                 },
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ...
// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });

//   final WordPair pair;

//   @override
//   Widget build(BuildContext context) {
//      final theme = Theme.of(context);
//      final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
      
//     );
  
//     return Card(
//    color: theme.colorScheme.primary,    // ← And also this.

//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//          child: Text(pair.asLowerCase,
//           style: style,
//           semanticsLabel: "${pair.first} ${pair.second}"
//           ),
//       ),
//     );
//   }
// }
// class FavoriterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      var appState=context.watch<MyAppState>();
//      if (appState.favorites.isEmpty) {
//     return Center(
//       child: Text('Aucun favoris '),
//     );       
//      }
//      return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text('vous avez'
//               '${appState.favorites.length} favorites:'),
//         ),
//         for (var pair in appState.favorites)
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text(pair.asLowerCase),
//           ),
//       ],
//     );
//   }
 
  
// }
