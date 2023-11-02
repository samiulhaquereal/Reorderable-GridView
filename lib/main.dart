import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> picture = [
    'https://deep-image.ai/blog/content/images/2022/09/underwater-magic-world-8tyxt9yz.jpeg',
    'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
    'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
    'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text('Ollyo',style: TextStyle(color: Colors.white),),centerTitle: true,),
      body: Center(
        child: ReorderableGridView.count(onReorder: (oldindex,newIndex){
          String path = picture.removeAt(oldindex);
          picture.insert(newIndex, path);
          setState(() {
          });
        },
            crossAxisCount: 2,
            childAspectRatio: 1,
          children: picture.map((String path) => Card(
            key: ValueKey(path),
            child: Image.network(path,fit: BoxFit.cover,),
          )).toList(),
        )
      ),
    ));
  }
}
