import 'package:flutter/material.dart';

/*
*
*
step 0:Create a New Project(Lake View App)
step 1:download a lake view image and add it to ur project and add pubspec.yaml
step 2:replace/remove the default main.dart code
step 3:create a class to widget state
step 4:create a subclass to maintain state
step 5:plug the state full widget into the widget tree
*
*/
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Oeschinene Lake Campground',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Robota',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text('Kinderstag,Switzerland',
                style: TextStyle(color: Colors.grey,fontSize: 20),
              ),
            ],
          ),
          FavWidget()
        ],
      ),
    );

    Widget buttonSection = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue,Icons.call,'CALL'),
          _buildButtonColumn(Colors.blue,Icons.near_me,'Route'),
          _buildButtonColumn(Colors.blue,Icons.share,'SHare'),

        ],
      ),
    );

    Widget  textSection= Container(
      padding: EdgeInsets.all(32),
      child: const Text(
        'Lake View is so beautiful to see and also everyone in my village doesnot see one GreatLake'
            'Lakes may be found of very rare but it haa a goodview in between mountains and forests,lake is in range of 1,560 meters and above',
        textAlign: TextAlign.justify,
        style: TextStyle(fontFamily: 'Georgia',color: Colors.black,fontSize: 20),
        softWrap: true,
      ),
    );


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Lake view App',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Image.asset(
                'images/lake.jpg', height: 250, width: 600, fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: color),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: color),
          ),
        ),
      ],
    );

  }


}

class FavWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>  _FavWidgetState();

}

class _FavWidgetState extends State<FavWidget> {

  bool _isFav = true ;
  int _favCount = 41 ;

  void _toggleFav(){
    setState(() {
      if(_isFav){
        _favCount -= 1 ;
        _isFav = false;
      }else{
        _favCount += 1 ;
        _isFav = true;
      }
    });

  }


  @override
  Widget build(BuildContext context) {

   return Row(
     children: [
       Container(
         child: IconButton(
           onPressed: _toggleFav,
           icon: (_isFav ? Icon(Icons.star):Icon(Icons.star_border)),
           color: Colors.red,
         ),
       ),
       SizedBox(
         child: SizedBox(
           child: Text('$_favCount'),
         ),
       ),
     ],
   );
  }

}



















