import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    AdminNew()
);

class AdminNew extends StatefulWidget{
  _AdminNew createState() => _AdminNew();
}

class _AdminNew extends State<AdminNew>{
  final _formKey = GlobalKey<FormState>();
  String _itemName, _itemPrice;

  final notesReference = FirebaseDatabase.instance.reference().child('item');

  void _addItem(){
    notesReference.push().set({
      'name': _itemName,
      'price': _itemPrice
    }).then((_) {
      print('Error Data');
    });

  }

  
  Widget Header(){
    return Container(
      child: Text('Add New Record', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
    );
  }

  Widget ItemName(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Item Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            )
        ),
        validator: (value){
          if (value.isEmpty){
            return "Enter item name";
          }
        },
        onSaved: (val) => setState(() => _itemName = val),
      ),
    );
  }

  Widget ItemPrice(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Item Price',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            )
        ),
        validator: (value){
          if (value.isEmpty){
            return "Enter price item";
          }
        },
        onSaved: (val) => setState(() => _itemPrice = val),
      ),
    );
  }

  Widget ButtonSave(){
    return Container(
      height: 1.4 * (MediaQuery.of(context).size.height/20),
      width: 5 * (MediaQuery.of(context).size.width/10),
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        elevation: 5.0,
        color: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: (){
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _addItem();
          }
        },
        child: Text('Save Record',
          style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: MediaQuery.of(context).size.height/40 ),
        ),
      ),
    );

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 10,
                ),
                ItemName(),
                SizedBox(
                  height: 10,
                ),
                ItemPrice(),
                SizedBox(
                  height: 10,
                ),
                ButtonSave(),
              ],
            ),
        ),
      ],
    );
  }

}
