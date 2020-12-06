class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  
Animation _arrowAnimation, _heartAnimation;
AnimationController _arrowAnimationController, _heartAnimationController;  
  

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    
    
        _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
    
  }  
  
@override
Widget build(BuildContext context) {
  
}

}  









 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          firstChild(),
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
        ],
      ),
    );
}

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlineButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Start Beating Heart Animation'),
              onPressed: () {
                _heartAnimationController.forward();
              },
              splashColor: Colors.red,
            ),
          ),
        )
      ],
    );

  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();

  }
