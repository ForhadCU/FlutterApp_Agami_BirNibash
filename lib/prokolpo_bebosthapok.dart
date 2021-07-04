import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loadmore/loadmore.dart';
import 'dart:async';


/*Future<UserDetailsModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserDetailsModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class UserDetailsModel {
  final String firstname;
  final String lastname;
  final String nid;
  final String designation;

  UserDetailsModel({
    required this.firstname,
    required this.lastname,
    required this.nid,
    required this.designation,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      nid: json['nid'],
      designation: json['designation'],
    );
  }
}*/

class ProkolpoBebosthapok extends StatefulWidget {
  const ProkolpoBebosthapok({Key? key}) : super(key: key);

  @override
  _ProkolpoBebosthapokState createState() => _ProkolpoBebosthapokState();
}

class _ProkolpoBebosthapokState extends State<ProkolpoBebosthapok> {
  String firstName = 'First Name';
  String lastName = 'Last Name';
  String organizationName = 'আমার প্রকল্পসমূহ';
  String userEmail = 'kashem.tipo@gmail.com';
  String userPhone = '+88015685248';
  // late Future<UserDetailsModel> futureAlbum;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  bool _isChangingLayoutVisible = false;
  bool _isArrowButtonVisible = true;

  TextEditingController searchTextController = new TextEditingController();
  int pageNo = 1;
  int dataSize = 0, limit = 0;
  String searchKey = "";

  void loadData() async {
    var birnibasUrl =
        "http://birnibash.agamilabs.com/app/php/projectupdates/get_user_projects.php";

    var response = await http.post(Uri.parse(birnibasUrl), body: {
      'userno': '3',
      'pageno': pageNo.toString(),
      'limit': '10',
      'search_key': searchKey
    });

    setState(() {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (jsonResponse.containsKey('error') && !jsonResponse['error']) {
        pageNo = pageNo + 1;
        dataSize = jsonResponse['data_size'];
        limit = jsonResponse['limit'];
        for (Map user in jsonResponse['data']) {
          _userDetails.add(UserDetails.fromJson(user));
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureAlbum = fetchAlbum();
    _userDetails.clear(); //removing previous data
    loadData();
  }

  void showArrowButton() {
    setState(() {
      _isArrowButtonVisible = !_isArrowButtonVisible;
    });
  }

  void showChangingLayout() {
    setState(() {
      _isChangingLayoutVisible = !_isChangingLayoutVisible;
      _isArrowButtonVisible = !_isArrowButtonVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(organizationName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(firstName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )),
                    ])
              ]),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                iconSize: 25.0,
                tooltip: 'User',
                onPressed: _showUserDetails,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: PopupMenuButton(
                  itemBuilder: (context) => [
/*                  PopupMenuItem(
                      child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.home,
                        color: Colors.blue,
                        size: 18.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Home',
                        ),
                      )
                    ],
                  )),*/
/*
                  PopupMenuItem(
                      child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.help,
                        color: Colors.blue,
                        size: 18.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Help',
                        ),
                      )
                    ],
                  ))
*/
                  ],
                  child: const Icon(
                    Icons.more_vert,
                    size: 25.0,
                  ),
                ))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    // image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                                    image: AssetImage(
                                        "assets/images/person_midold.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 14.0,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            userEmail,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          size: 14.0,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              userPhone,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        Visibility(
                          visible: _isArrowButtonVisible,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                IconButton(
                                    onPressed: showChangingLayout,
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      size: 24,
                                      color: Colors.blue,
                                    ))
                              ],
                            ),
                          ),
                        ),

                        //User data Update Layout
                        Visibility(
                          visible: _isChangingLayoutVisible,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          //first name
                                          //First Name input
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: TextField(
                                              controller: firstNameController,
                                              // obscureText: true,
                                              maxLines: 1,

                                              decoration: const InputDecoration(
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText:
                                                      "Enter first name here...",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black87),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: "First name",
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 10.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: TextField(
                                              controller: nidController,
                                              // obscureText: true,
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText: "Enter NID here...",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black87),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: "NID",
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 10.0)),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 25, left: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all(Size
                                                                  .fromWidth(
                                                                      120)),
                                                      elevation:
                                                          MaterialStateProperty
                                                              .all(3.0),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.grey),
                                                    ),
                                                    onPressed:
                                                        showChangingLayout,
                                                    child: const Text(
                                                      'Close',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          //first name
                                          //First Name input
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: TextField(
                                              controller: lastNameController,
                                              // obscureText: true,
                                              maxLines: 1,

                                              decoration: const InputDecoration(
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText:
                                                      "Enter last name here...",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black87),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: "Last name",
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 10.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: TextField(
                                              controller: lastNameController,
                                              // obscureText: true,
                                              maxLines: 1,

                                              decoration: const InputDecoration(
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText:
                                                      "Enter designation here...",
                                                  labelStyle: TextStyle(
                                                      color: Colors.black87),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  labelText: "Designation",
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 10.0)),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 25, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all(Size
                                                                  .fromWidth(
                                                                      120)),
                                                      elevation:
                                                          MaterialStateProperty
                                                              .all(3.0),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .blue[50]),
                                                    ),
                                                    onPressed: null,
                                                    child: const Text(
                                                      'Save Changes',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /**
                 * Rofiqul's part...
                 */
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8.0,
                          child: ListTile(
                            leading: Icon(Icons.search),
                            title: TextField(
                              controller: searchTextController,
                              decoration: InputDecoration(
                                  hintText: 'Search Here',
                                  border: InputBorder.none),
                              onChanged: onSearchTextChanged,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                searchTextController.clear();
                                onSearchTextChanged('');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            child: RefreshIndicator(
                                onRefresh: _refresh,
                                child: LoadMore(
                                  isFinish: dataSize < limit,
                                  onLoadMore: _loadMore,
                                  child: ListView.separated(
                                    itemCount: _userDetails.isEmpty
                                        ? 0
                                        : _userDetails.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: CircleAvatar(
                                              child: Text(
                                                _userDetails[index]
                                                    .projectno
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  _userDetails[index]
                                                      .projecttitle
                                                      .toString(),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 2),
                                                  child: Text(
                                                      _userDetails[index]
                                                              .upname +
                                                          ',' +
                                                          _userDetails[index]
                                                              .uzname,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                      ),
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ]),
                                          Expanded(
                                              child: Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                        _userDetails[index]
                                                                    .lastupdatetime ==
                                                                null
                                                            ? ""
                                                            : _userDetails[
                                                                    index]
                                                                .lastupdatetime,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left),
                                                  )))
                                        ],
                                      ));
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      );
                                    },
                                  ),
                                  whenEmptyLoad: false,
                                  delegate: DefaultLoadMoreDelegate(),
                                  textBuilder:
                                      DefaultLoadMoreTextBuilder.english,
                                ))))
                  ],
                )
              ],
            )));
  }

  void _showUserDetails() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              // Retrieve the text the user has entered by using the
              // TextEditingController.

              );
        },
      );
    });
  }


  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    setState(() {
      searchKey = "";
    });
    loadData();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    _userDetails.clear();
    setState(() {
      pageNo = 1;
      searchKey = "";
    });
    loadData();
  }

  onSearchTextChanged(String text) async {
    if (text.length >= 3) {
      print(text);
      _userDetails.clear();
      setState(() {
        pageNo = 1;
        searchKey = searchTextController.text;
        print(searchKey);
      });
      loadData();
    }
  }
}

List<UserDetails> _userDetails = [];

class UserDetails {
  final int projectno, birno, upno, projectamount, pstatusno;
  final String projectid,
      projecttitle,
      referenceid,
      description,
      upname,
      uzname,
      districtname,
      lastupdatetime;

  UserDetails(
      {required this.projectno,
        required this.birno,
        required this.upno,
        required this.projectamount,
        required this.pstatusno,
        required this.projectid,
        required this.projecttitle,
        required this.referenceid,
        required this.description,
        required this.upname,
        required this.uzname,
        required this.districtname,
        required this.lastupdatetime});

  factory UserDetails.fromJson(Map<dynamic, dynamic> json) {
    return new UserDetails(
        projectno: json['projectno'],
        birno: json['birno'],
        upno: json['upno'],
        projectamount: json['projectamount'],
        pstatusno: json['pstatusno'],
        projectid: json['projectid'],
        projecttitle: json['projecttitle'],
        referenceid: json['referenceid'],
        description: json['description'],
        upname: json['upname'],
        uzname: json['uzname'],
        districtname: json['districtname'],
        lastupdatetime: json['lastupdatetime']);
  }
}
