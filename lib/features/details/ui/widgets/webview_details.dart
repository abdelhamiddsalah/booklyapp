import 'package:booklyapp/core/networking/api_services.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewDetails extends StatefulWidget {
  final int index;
  const WebviewDetails({super.key, required this.index});

  @override
  State<WebviewDetails> createState() => _WebviewDetailsState();
}

class _WebviewDetailsState extends State<WebviewDetails> {
  late WebViewController _controller;
 
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeRepoCubit(HomeRepo(apiServices: ApiServices(Dio())))
        ..fetchDataBooks(),
      child: BlocBuilder<HomeRepoCubit, HomeRepoState>(
        builder: (context, state) {
          if (state is HomeRepoSuccess) {
            // Assuming the book URL is available in state
            final book = state.data.items![widget.index]; // Adjust this based on your actual data structure
            final url = book.volumeInfo!.infoLink; // Ensure this property is correct
            if (url == null || url.isEmpty) {
              return const Center(child: Text('No link available'));
            }
            // Load the URL into the WebViewController
            _controller.loadRequest(Uri.parse(url));
            return Scaffold(
              appBar: AppBar(
                title: const Text("Book Details"),
              ),
              body: SafeArea(
                child: WebViewWidget(controller: _controller),
              ),
            );
          } else if (state is HomeRepoFailure) {
            return const Center(child: Text('Failed to load book data'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}