
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomLoader extends StatelessWidget {
  final String loadingText;

  const CustomLoader({this.loadingText});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showLoadingDialog(context,'$loadingText'));
    return Container(
      
    );
  }
}

Future<Widget> _showLoadingDialog(BuildContext context, String loadingText) async {
  return showDialog<Widget>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new WillPopScope(
            onWillPop: () async => true,
            child: SimpleDialog(
                //backgroundColor: Colors.black45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                children: <Widget>[
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        //color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.0)),
                    //height: double.infinity,
                    width: double.infinity,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                      CupertinoActivityIndicator(animating: true, radius: 25.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$loadingText',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      )
                    ]),
                  ))
                ]));
      });
}

dismissLoader(BuildContext context){
  Navigator.pop(context);
}


//Navigator.of(context, rootNavigator: true).pop(result)

