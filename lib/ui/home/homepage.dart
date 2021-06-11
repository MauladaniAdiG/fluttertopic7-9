import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/bloc/provider.dart';
import 'package:app/bloc/notifier/homenotifier.dart';
import 'package:app/util/textdesign.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(0),
        ),
        body: Consumer(
          builder: (context, watch, child) {
            final state = watch(homeNotifierProvider);
            if (state is HomeInit) {
              Future.delayed(Duration(seconds: 2), () {
                context.read(homeNotifierProvider.notifier).getPhotoList('1', '50');
              });
              return Center(child: Container(child: Text('Saya berada di posisi HomeInit / awal')));
            } else if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeOnEvent) {
              return Container(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDesign(
                      data: 'List of Photo',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: GridView.builder(
                            itemCount: state.listPhoto.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Image.network('https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
                                  TextDesign(data: state.listPhoto[index].photographerName),
                                ],
                              );
                            }))
                  ],
                ),
              )));
            } else if (state is HomeErrorEvent) {
              return Center(child: Text('error'));
            } else {
              return Container();
            }
          },
        ));
  }
}
