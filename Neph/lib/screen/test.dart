child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.red,
          ),
          child: new TextField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'Password',
                helperText: 'Keep it short, this is just a demo.',
                labelText: 'Life story',
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                prefixText: ' ',
                suffixText: 'USD',
                suffixStyle: const TextStyle(color: Colors.green)),
          ),
        ));












        Widget passwordfield() {
    return Container(
        width: 250.0,
        child: TextFormField(
          decoration: new InputDecoration(
            labelText: "Password",
            filled: true,
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(color: Colors.white),
            ),
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Email cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(fontFamily: "Poppins", color: Colors.white),
        ));
  }



  Widget topic(String day, String date, String month, String type) {
    return Row(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          whitebackground2(day),
          SizedBox(
            height: 5.0,
          ),
          whitebackground(date, month),
        ],
      ),
      SizedBox(
        width: 60.0,
      ),
      Text(
        type,
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 24,
          color: const Color(0xff394548),
        ),
        textAlign: TextAlign.left,
      ),
    ]);
  }



  Widget whitebackground() {
    return Container(
      width: 90,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(3, 3),
          ),
        ],
      ),
      
    );
  }