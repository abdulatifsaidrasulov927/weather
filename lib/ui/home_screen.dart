import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../modul/region_model.dart';
import '../data/repostory/repostory.dart';
import '../modul/universal_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deafult screen"),
      ),
      body: FutureBuilder<UniversalData>(
        future: RegionModelResource.regionApi(),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              RegionModel regionModel = snapshot.data!.data as RegionModel;
              return Center(
                child: Text(regionModel.times.hufton),
              );
            }
          }

          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}

Future<RegionModel?> regionApi() async {
  try {
    http.Response response = await http
        .get(Uri.parse("https://islomapi.uz/api/present/day?region=Toshkent"));

    return RegionModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    return null;
  }
}
