import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_provider_practice/view_model/post_list_view_model.dart';
import 'package:provider/provider.dart';
import 'view/post_list_screen.dart';
import 'view_model/post_details_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PostListViewModel()),
        ChangeNotifierProvider.value(value: PostDetailsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM with Provider',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => PostListScreen(),
        },
      ),
    );
  }
}
