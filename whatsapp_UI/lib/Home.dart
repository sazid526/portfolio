import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7))
      )
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text("WhatsApp"),
              bottom: TabBar(
                tabs:  [
                  Tab(child: Icon(Icons.people)),
                  Tab(child: Text("Chats")),
                  Tab(child: Text("Status")),
                  Tab(child: Text("Call")),

                ],
              ),
              actions:  [
                Icon(Icons.camera_alt_outlined),
                SizedBox(width: 15,),
                Icon(Icons.search),
                PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "1",
                        child: Text("New Group"),
                      ),
                      PopupMenuItem(
                        value: "2",
                        child: Text("Settings"),
                      ),
                      PopupMenuItem(
                        value: "3",
                        child: Text("Logout"),
                      ),
                    ]
                ),

              ],
            ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Image.asset("assets/images/w.jpg"),
                  Center(child: Text("Stay conncted with a \n        community",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.7)),)),
                  SizedBox(height: 10,),
                  Center(child: Text("Communicaton bring members together in \n topic-based groups, and make it easy to get \n admin annoucements. Any community you're \n added to will appear here Learn more.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.5)),)),
                  SizedBox(height:20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      minimumSize: Size(300, 40)
                    ),
                      onPressed: (){},
                      child: Text("Start your community"),
                  )
                ],
              ),
              ListView.builder(
                itemCount: 100,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/4890259/pexels-photo-4890259.jpeg?auto=compress&cs=tinysrgb&w=300"),
                      ),
                      title: Text("Sazid"),
                      subtitle: Text("Where are you"),
                      trailing: Text("8:25 AM"),
                    );
                  }
              ),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 4
                          )
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage("https://images.pexels.com/photos/4890259/pexels-photo-4890259.jpeg?auto=compress&cs=tinysrgb&w=300"),
                        ),
                      ),
                      title: Text("Sazid"),
                      subtitle: Text("25m ago"),
                    );
                  }
              ),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/4890259/pexels-photo-4890259.jpeg?auto=compress&cs=tinysrgb&w=300"),
                      ),
                      title: Text("+8801902175078"),
                      subtitle: Text("You Missed Call",style: TextStyle(color: Colors.red),),
                      trailing: Icon(Icons.videocam)
                    );
                  }
              ),

            ],
          ),
        )
    );
  }
}
