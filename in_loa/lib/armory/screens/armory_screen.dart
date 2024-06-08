import 'package:flutter/material.dart';
import '../services/crawler_service.dart';
import '../models/armory_data.dart';

class ArmoryScreen extends StatefulWidget {
  final String characterName;

  const ArmoryScreen({super.key, required this.characterName});

  @override
  ArmoryScreenState createState() => ArmoryScreenState();
}

class ArmoryScreenState extends State<ArmoryScreen> {
  final CrawlerService crawlerService = CrawlerService();
  ArmoryData? armoryData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchArmoryData();
  }

  Future<void> fetchArmoryData() async {
    try {
      final data = await crawlerService.fetchArmoryData(widget.characterName);
      setState(() {
        armoryData = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching armory data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.characterName),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : armoryData != null
              ? Center(child: Text('Character Nickname: ${armoryData!.nickName}'))
              : const Center(child: Text('Failed to load data')),
    );
  }
}
