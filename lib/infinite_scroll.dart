import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: InfiniteScrollTest()));

class InfiniteScrollTest extends StatefulWidget {
  const InfiniteScrollTest({super.key});

  @override
  State<InfiniteScrollTest> createState() => _InfiniteScrollTestState();
}

class _InfiniteScrollTestState extends State<InfiniteScrollTest> {
  final ScrollController _controller = ScrollController();
  List<String> items = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  void fetch() async {
    if (isLoading || !hasMore) return; // Prevent duplicate requests
    setState(() => isLoading = true);

    Dio dio = Dio();
    try {
      final response = await dio.get(
          'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10');
      final newItems =
          response.data.map<String>((e) => e['title'] as String).toList();

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          items.addAll(newItems);
          page += 1;
          hasMore = newItems.length == 10; // If less than 10, no more data
        });
      });
    } catch (e) {
      debugPrint("Fetch error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();

    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll Test',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: items.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < items.length) {
            return Card(
              child: Padding(
                  padding: const EdgeInsets.all(20), child: Text(items[index])),
            );
          } else {
            return const Center(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
