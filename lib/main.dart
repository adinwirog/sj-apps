import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_barang.dart';
import 'package:sarangjembar_apps/providers/provider_detailhutang.dart';
import 'package:sarangjembar_apps/providers/provider_detailriwayat.dart';
import 'package:sarangjembar_apps/providers/provider_hutang.dart';
import 'package:sarangjembar_apps/providers/provider_laporan.dart';
import 'package:sarangjembar_apps/providers/provider_riwayat.dart';
import 'package:sarangjembar_apps/providers/provider_transaksi.dart';
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
        ChangeNotifierProvider(create: (context) => ProviderTransaksi()),
        ChangeNotifierProvider(create: (context) => ProviderRiwayat()),
        ChangeNotifierProvider(create: (context) => ProviderRiwayatDetail()),
        ChangeNotifierProvider(create: (context) => ProviderLaporan()),
        ChangeNotifierProvider(create: (context) => ProviderHutang()),
        ChangeNotifierProvider(create: (context) => ProviderDetailHutang()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: router.MainScreenPage,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
