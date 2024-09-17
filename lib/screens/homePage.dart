import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/screens/Carousel.dart';
import 'package:payluminix/screens/core_service.dart';
import 'package:payluminix/screens/notification.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLoading = false;

  final List _services = [
    {
      "Pay and Receive": [
        {
          "label": "Prepaid\nRecharge",
          "icon": "assets/images/Prepaid_Recharge.png",
        },
        {
          "label": "PostPaid\nRecharge",
          "icon": "assets/images/Postpaid_Recharge.png",
        },
        {
          "label": "Electricity\nBills",
          "icon": "assets/images/Electricity_Bills.png",
        },
        {
          "label": "DTH\nRecharge",
          "icon": "assets/images/DTH_Recharge.png",
        },
        {
          "label": "Fastag\nRecharge",
          "icon": "assets/images/imag_7.png",
        },
        {
          "label": "Water\nBill",
          "icon": "assets/images/water.png",
        },
        {
          "label": "Gas\nCylinder",
          "icon": "assets/images/lpg.png",
        },
        {
          "label": "OTT\nRecharge",
          "icon": "assets/images/ott.png",
        },
      ]
    },
  ];

  final List _peoples = [
    {
      "categoryName": "People",
      "services": [
        {
          "label": "Prepaid\nRecharge",
          "icon": "assets/images/Floyd_Miles.png",
        },
        {
          "label": "PostPaid\nRecharge",
          "icon": "assets/images/Ellipse_4.png",
        },
        {
          "label": "Electricity\nBills",
          "icon": "assets/images/Kathryn_Murphy.png",
        },
        {
          "label": "DTH\nRecharge",
          "icon": "assets/images/Jenny_Wilson.png",
        },
        {
          "label": "Fastag\nRecharge",
          "icon": "assets/images/Ralph_Edwards.png",
        },
      ],
      "showButton": true,
    },
    {
      "categoryName": "Offers & Rewards",
      "services": [
        {
          "label": "Offers",
          "icon": "assets/images/offers.png",
        },
        {
          "label": "Refer & Earn",
          "icon": "assets/images/reffral.png",
        },
      ],
      "showButton": false,
    },
  ];

  final List _offers_rewards = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getHome();
    }
  }

  _getHome() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _isLoading = false;
      });
    }
  }

  int _sectionCallCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _getHome();
        },
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _isLoading
                ? Center(
                    child: LoadingAnimationWidget.flickr(
                        size: 50,
                        leftDotColor: Colors.red,
                        rightDotColor: Colors.green),
                  )
                : SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  // controller: _searchController,
                                  decoration: const InputDecoration(
                                    labelText: 'Pay By Name or Phone Number',
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 139, 139, 139)),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(188, 188, 188, 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    // _filterContacts(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              NotificationPage(
                                hasNotification: true,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                              onTap: () {
                                print("wallet tapped");
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 17, right: 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    border: Border.all(width: 0.2)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/image.png",
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "₹1,010",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 19),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 35,
                          ),
                          CarouselBanners(),
                          ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: _services.map<Widget>((category) {
                                String categoryName = category.keys.first;
                                List services = category.values.first;

                                return Column(children: [
                                  _buildSectionTitle(categoryName),
                                  GridView.count(
                                    crossAxisCount: 4,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 0.99,
                                    children: services.map<Widget>((service) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoreService()),
                                            );
                                          },
                                          customBorder: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: _buildItem(
                                            service['icon'],
                                            service['label'],
                                          ));
                                    }).toList(),
                                  )
                                ]);
                              }).toList()),
                          SizedBox(
                            height: 25,
                          ),
                          _build2ndwholeseciton(
                              "assets/images/Send_money_abroad.png",
                              "Track your transactions"),
                          ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: _peoples.map<Widget>((category) {
                                String categoryName = category["categoryName"];
                                List services = category["services"];
                                bool showButton = category["showButton"];

                                return Column(children: [
                                  _buildSectionTitle3(categoryName, showButton),
                                  GridView.count(
                                    crossAxisCount: 5,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 0.75,
                                    children: services.map<Widget>((service) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoreService()),
                                            );
                                          },
                                          child: _buildItem3(
                                            service['icon'],
                                            service['label'],
                                          ));
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ]);
                              }).toList()),
                          _build5thwholeseciton(
                              "assets/images/Send_money_abroad.png",
                              "Recent Transactions"),
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Widget _buildItem(String iconPath, String iconTitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 30,
          child: Image.asset(
            iconPath,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            iconTitle,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _build2ndwholeseciton(String iconPath, String iconTitle) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              iconTitle,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    iconPath,
                    height: 115,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Keep Track of Your\nTransactions",
                        style: textStyles.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          print("View Now Tapped");
                          print(_sectionCallCount);
                        },
                        child: Text(
                          "View Now >",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.only(left: 20, right: 20)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(32, 62, 76, 1))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildSectionTitle3(String title, bool showButton) {
    _sectionCallCount++;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
            if (showButton)
              TextButton(
                  onPressed: () {
                    print("See all Clicked");
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 101, 53, 53)),
                  ))
          ],
        ));
  }

  Widget _buildItem3(String iconPath, String iconTitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 55,
          width: 65,
          child: Image.asset(
            iconPath,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            iconTitle,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _build5thwholeseciton(String iconPath, String iconTitle) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              iconTitle,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/chocolate.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chocolate',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '15 Sep 2023, 8:50 PM',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Price
                      Text(
                        '₹ 148.00',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'cancelled',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
