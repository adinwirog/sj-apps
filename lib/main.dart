import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_barang.dart';
import 'providers/provider_editbarang.dart';
import 'providers/provider_tambahbarang.dart';
import 'route_generator.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const CoreApp());
}

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderBarang()),
        ChangeNotifierProvider(create: (context) => ProviderTambahBarang()),
        ChangeNotifierProvider(create: (context) => ProviderEditBarang()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: router.MainScreenPage,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
