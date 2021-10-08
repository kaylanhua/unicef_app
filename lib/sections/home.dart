import 'package:flutter/material.dart';

// Tag with name and flag of country
// Wanted stateless, couldn't really get navigator to work with that, unsure why
// TODO: Convert to stateless if possible
class CountryTag extends StatefulWidget {
  // Image as string to file for now
  String _country = "";
  String _image = "";

  CountryTag(String country, String image) {
    this._country = country;
    this._image = image;
  }

  // State for Country Tag
  @override
  _CountryTagState createState() =>
      _CountryTagState(this._country, this._image);
}

// State for Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon searchBarIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Search country by name');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (searchBarIcon.icon == Icons.search) {
                  searchBarIcon = const Icon(Icons.cancel);
                  searchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search country by name',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  searchBarIcon = const Icon(Icons.search);
                  searchBar = const Text('Search country by name');
                }
              });
            },
            icon: searchBarIcon,
          )
        ],
        centerTitle: true,
      ),
      body: Container(
          child: Center(
              child: ListView(
        children: [
          CountryTag("Afghanistan", 'assets/flags/Afghanistan.jpg'),
          CountryTag("Bangladesh", 'assets/flags/Bangladesh.png'),
          CountryTag("Bhutan", 'assets/flags/Bhutan.png')
        ],
      ))),
    );
  }
}

// State for country tag
class _CountryTagState extends State<CountryTag> {
  String _country = "", _image = "";

  _CountryTagState(String country, String image) {
    this._country = country;
    this._image = image;
  }

  // Push page to categories using navigator
  void _pushInfo() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      // Return scaffold of the app
      return Scaffold(
        appBar: AppBar(
          // Title is the country
          title: Text(_country),
          centerTitle: true,
        ),
        body: Center(
          // Category page is centered on the page
          child: CategoryPage(),
        ),
        // Bottom nav bar
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats),
              label: 'Compare',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open),
              label: 'Reporting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
            ),
          ],

          // TODO: implement indices back in for the navbar
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
        ),
      );
    }));
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _pushInfo();
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
            )),
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      child:
                          Image.asset(_image, fit: BoxFit.fitHeight, width: 90),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 0.0),
                    ),
                    Text(_country,
                        textScaleFactor: 1.8, textAlign: TextAlign.center)
                  ],
                ))));
  }
}

//State for Category Page
// State for Home Page
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Icon searchBarIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Search category by name');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (searchBarIcon.icon == Icons.search) {
                  searchBarIcon = const Icon(Icons.cancel);
                  searchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for category',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  searchBarIcon = const Icon(Icons.search);
                  searchBar = const Text('Search category by name');
                }
              });
            },
            icon: searchBarIcon,
          )
        ],
        centerTitle: true,
      ),
      body: Container(
          child: Center(
              child: ListView(
        children: [CategoryTag("Population"), CategoryTag("Mortality")],
      ))),
    );
  }
}

// Create tag listing a category
// TODO: Convert to stateless if possible
class CategoryTag extends StatefulWidget {
  String _category = "";

  CategoryTag(String category) {
    this._category = category;
  }

  @override
  _CategoryTagState createState() => _CategoryTagState(this._category);
}

// State for category tag
class _CategoryTagState extends State<CategoryTag> {
  String _category = "";

  _CategoryTagState(String category) {
    this._category = category;
  }

  // Function to push section for category
  void _pushInfo() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_category),
          centerTitle: true,
        ),
        body: Center(
            // Container with info on category
            child: CategoryInfoPage()),
        // Navbar
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats),
              label: 'Compare',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open),
              label: 'Reporting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
            ),
          ],
          // TODO: fix navbar if possible
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
        ),
      );
    }));
  }

  // Tag with name of category, detects tap
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _pushInfo();
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
            )),
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(_category,
                        textScaleFactor: 1.8, textAlign: TextAlign.center)
                  ],
                ))));
  }
}

// SECOND LAYER
// List of categories (eg. population)
class CategoryInfoPage extends StatelessWidget {
  // No state (like list of countries), return list of tags
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: ListView(
      children: [
        CategoryInfo("Population Under 18"),
        CategoryInfo("Population Over 65")
      ],
    )));
  }
}

// Create tag listing a category
// TODO: Convert to stateless if possible
class CategoryInfo extends StatefulWidget {
  String _statName = "";

  CategoryInfo(String statName) {
    this._statName = statName;
  }

  @override
  _CategoryInfoState createState() => _CategoryInfoState(this._statName);
}

// State for category tag
class _CategoryInfoState extends State<CategoryInfo> {
  String _statName = "";

  _CategoryInfoState(String statName) {
    this._statName = statName;
  }

  // Function to push section for category
  void _pushInfo() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_statName),
          centerTitle: true,
        ),
        body: Center(
          // Container with info on category
          child: Container(
            child: Text(_statName, textScaleFactor: 2),
            color: Colors.lightGreen,
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 80.0),
          ),
        ),
        // Navbar
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats),
              label: 'Compare',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open),
              label: 'Reporting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
            ),
          ],
          // TODO: fix navbar if possible
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
        ),
      );
    }));
  }

  // Tag with name of category, detects tap
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _pushInfo();
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
            )),
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(_statName,
                        textScaleFactor: 1.8, textAlign: TextAlign.center)
                  ],
                ))));
  }
}
