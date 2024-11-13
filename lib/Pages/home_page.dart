import 'package:employee_details/Models/employee_model.dart';
import 'package:employee_details/Pages/details_page.dart';
import 'package:employee_details/Services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final TextEditingController _searchController = TextEditingController();
  final HTTPService _httpsService = HTTPService();
  List<UserModel> _userList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUserList();
  }

  // Method to fetch user list
  Future<void> _fetchUserList() async {
    setState(() {
      _isLoading = true;
    });
    _userList = await _httpsService.getUserList();
    _userList.clear();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Info'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
              child: TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search with name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _fetchUserList,
                child: _isLoading
                    ? _buildShimmerEffect() // Show shimmer effect while loading
                    : _buildUserList(), // Build the user list view
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build shimmer effect
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade700,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              ListTile(
                title: Container(
                  height: 10,
                  width: 20,
                  color: Colors.white,
                ),
                subtitle: Container(
                  height: 10,
                  width: 20,
                  color: Colors.white,
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget to build user list view
  Widget _buildUserList() {
    return FutureBuilder(
      future: _httpsService.getUserList(),
      builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (!snapshot.hasData) {
          return _buildShimmerEffect();
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              String name = snapshot.data![index].name.toString();

              if (_searchController.text.isEmpty) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  name: name,
                                  username:
                                      snapshot.data![index].username.toString(),
                                  email: snapshot.data![index].email.toString(),
                                  address:
                                      snapshot.data![index].name.toString(),
                                  website:
                                      snapshot.data![index].name.toString(),
                                )));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data![index].name.toString()),
                        subtitle: Text(snapshot.data![index].email.toString()),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          child: Text(
                            snapshot.data![index].name!
                                .substring(0, 1)
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (name
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  name: name,
                                  username:
                                      snapshot.data![index].username.toString(),
                                  email: snapshot.data![index].email.toString(),
                                  address:
                                      snapshot.data![index].name.toString(),
                                  website:
                                      snapshot.data![index].name.toString(),
                                )));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data![index].name.toString()),
                        subtitle: Text(snapshot.data![index].email.toString()),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        }
      },
    );
  }
}
