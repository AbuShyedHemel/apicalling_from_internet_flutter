import 'package:flutter/material.dart';
import 'package:movie_app/controller/datacontroller.dart';
import 'package:movie_app/model/datahelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PostList> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Datahelper databasehelper = Datahelper();
    data = databasehelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Center(
        child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot<PostList> snapshot) {
            List<Post> allPosts;
            if (snapshot.hasData) {
              allPosts = snapshot.data!.posts;
              return ListView.builder(
                  itemCount: allPosts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text("${allPosts[index].userId}"),
                          subtitle: Text("${allPosts[index].title}"),
                          leading: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 24,
                                child: Text("${allPosts[index].id}"),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ));
  }
}
