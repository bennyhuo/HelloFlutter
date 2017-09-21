import 'package:flutter/material.dart';

void main() {
    runApp(new FriendlychatApp());
}

const String _name = "bennyhuo";

class FriendlychatApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: "Friendlychat",
            home: new ChatScreen(),
        );
    }
}

class ChatScreen extends StatefulWidget {
    //modified
    @override //new
    State createState() => new ChatScreenState(); //new
}

class ChatScreenState extends State<ChatScreen> {
    final TextEditingController _textController = new TextEditingController(); //new
    final List<ChatMessage> _messages = <ChatMessage>[];
    //new
    @override //new
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(title: new Text("Friendlychat")),
            body: new Column(                                        //modified
                children: <Widget>[                                         //new
                    new Flexible(                                               //new
                        child: new ListView.builder(                              //new
                            padding: new EdgeInsets.all(8.0),                       //new
                            reverse: true,                                          //new
                            itemBuilder: (_, int index) => _messages[index],        //new
                            itemCount: _messages.length,                            //new
                        )                                                         //new
                    ),                                                          //new
                    new Divider(height: 1.0),                                   //new
                    new Container(                                              //new
                        decoration: new BoxDecoration(
                            color: Theme.of(context).cardColor),                   //new
                        child: _buildTextComposer(),                         //modified
                    ),                                                          //new
                ]                                                            //new
            ),                                                             //new
        );
    }

    Widget _buildTextComposer() {
        return new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
                children: <Widget>[
                    new Flexible(
                        child: new TextField(
                            controller: _textController,
                            onSubmitted: _handleSubmitted,
                            decoration: new InputDecoration.collapsed(
                                hintText: "Send a message"),
                        ),
                    ),
                    new Container(                                          //new
                        margin: new EdgeInsets.symmetric(horizontal: 4.0),    //new
                        child: new IconButton(                                //new
                            icon: new Icon(Icons.send, color: Colors.blue,) ,
                            onPressed: () => _handleSubmitted(_textController.text)),//new
                    ),                                                     //new
                ]
            ),
        );
    }

    void _handleSubmitted(String text) {
        _textController.clear();
        ChatMessage message = new ChatMessage(                         //new
            text: text,                                                  //new
        );                                                           //new
        setState(() {                                                  //new
            _messages.insert(0, message);                                //new
        });                                                            //new
    }
}

class ChatMessage extends StatelessWidget {
    ChatMessage({this.text});
    final String text;
    @override
    Widget build(BuildContext context) {
        return new Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: new CircleAvatar(child: new Text(_name[0])),
                    ),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            new Text(_name, style: Theme.of(context).textTheme.subhead),
                            new Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                child: new Text(text),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Flutter Demo',
            theme: new ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
                // counter didn't reset back to zero; the application is not restarted.
                primarySwatch: Colors.blue,
            ),
            home: new MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".

    final String title;

    @override
    _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;

    void _incrementCounter() {
        setState(() {
            // This call to setState tells the Flutter framework that something has
            // changed in this State, which causes it to rerun the build method below
            // so that the display can reflect the updated values. If we changed
            // _counter without calling setState(), then the build method would not be
            // called again, and so nothing would appear to happen.
            _counter++;
        });
    }

    @override
    Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return new Scaffold(
            appBar: new AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: new Text(widget.title),
            ),
            body: new Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: new Column(
                    // Column is also layout widget. It takes a list of children and
                    // arranges them vertically. By default, it sizes itself to fit its
                    // children horizontally, and tries to be as tall as its parent.
                    //
                    // Invoke "debug paint" (press "p" in the console where you ran
                    // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
                    // window in IntelliJ) to see the wireframe for each widget.
                    //
                    // Column has various properties to control how it sizes itself and
                    // how it positions its children. Here we use mainAxisAlignment to
                    // center the children vertically; the main axis here is the vertical
                    // axis because Columns are vertical (the cross axis would be
                    // horizontal).
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        new Text(
                            '脑残点击按钮，真脑残:',
                        ),
                        new Text(
                            '${_counter}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .display1,
                        ),
                    ],
                ),
            ),
            floatingActionButton: new FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: new Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}
