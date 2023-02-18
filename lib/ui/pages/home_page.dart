import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:modern_calculator/bloc/theme_switch/theme_switch_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var input = "";
  var output = "0";
  bool hideInput = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        topSection(context),
        bottomSection(context),
      ],
    ));
  }

  Expanded bottomSection(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Spacer(),
                      Expanded(flex: 2, child: firstRow(context)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Expanded(flex: 2, child: secondRow(context)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Expanded(flex: 2, child: thirdRow(context)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Expanded(flex: 2, child: fourthRow(context)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Expanded(flex: 2, child: fifthRow(context)),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Expanded topSection(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                toggle(context),
                texts(),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/images/history.svg",
                      height: 30,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (input.length >= 1)
                          input = input.substring(0, input.length - 1);
                        setState(() {});
                      },
                      child: SvgPicture.asset(
                        "assets/images/delete.svg",
                        height: 30,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }

  Expanded toggle(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
              builder: (context, state) {
                return FlutterSwitch(
                  value: state.switchValue,
                  inactiveIcon: SvgPicture.asset(
                    'assets/images/light.svg',
                    color: Color(0xff6F9395),
                  ),
                  inactiveColor: Color(0xff6F9395),
                  activeColor: Color(0xfffafafa),
                  activeToggleColor: Color(0xff6F9395),
                  toggleColor: Color(0xfffafafa),
                  inactiveToggleColor: Color(0xfffafafa),
                  activeIcon: SvgPicture.asset(
                    'assets/images/dark.svg',
                  ),
                  onToggle: (value) {
                    value
                        ? context
                            .read<ThemeSwitchBloc>()
                            .add(ThemeSwitchOnEvent())
                        : context
                            .read<ThemeSwitchBloc>()
                            .add(ThemeSwitchOffEvent());
                  },
                );
              },
            ),
          ],
        ));
  }

  Row firstRow(BuildContext context) {
    return Row(
      children: [
        calculatorButton(
          text: "AC",
          cardColor: Color(0xff353535),
          textColor: Color(0xffffffff),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "( )",
          cardColor: Color(0xff353535),
          textColor: Color(0xffffffff),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "%",
          cardColor: Color(0xff353535),
          textColor: Color(0xffffffff),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "/",
          cardColor: Color(0xff353535),
          textColor: Color(0xffffffff),
        )
      ],
    );
  }

  Row secondRow(BuildContext context) {
    return Row(
      children: [
        calculatorButton(
          text: "7",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "8",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "9",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "X",
          cardColor: Color(0xff3C6E71),
          textColor: Color(0xffffffff),
        ),
      ],
    );
  }

  Row thirdRow(BuildContext context) {
    return Row(
      children: [
        calculatorButton(
          text: "4",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "5",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "6",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "-",
          cardColor: Color(0xff3C6E71),
          textColor: Color(0xffffffff),
        ),
      ],
    );
  }

  Row fourthRow(BuildContext context) {
    return Row(
      children: [
        calculatorButton(
          text: "1",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "2",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "3",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "+",
          cardColor: Color(0xff3C6E71),
          textColor: Color(0xffffffff),
        ),
      ],
    );
  }

  Row fifthRow(BuildContext context) {
    return Row(
      children: [
        calculatorButton(
          text: ",",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
          size: 25,
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "0",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "00",
          cardColor: Color(0xfffafafa),
          textColor: Color(0xff000000),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        calculatorButton(
          text: "=",
          cardColor: Color(0xff3C6E71),
          textColor: Color(0xffffffff),
        ),
      ],
    );
  }

  Expanded texts() {
    return Expanded(
        flex: 4,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hideInput ? "" : input,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                        color: Theme.of(context).accentColor)),
              ),
              Text(
                output,
                maxLines: 1,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 50,
                        color: Theme.of(context).accentColor)),
              )
            ],
          ),
        ));
  }

  Widget calculatorButton({
    required String text,
    required Color cardColor,
    required Color textColor,
    double size = 30,
  }) {
    return Expanded(
        flex: 4,
        child: InkWell(
          onTap: () {
            if (text == "AC") {
              hideInput = false;
              isFirst = true;
              input = "";
              output = "0";
            } else if (text == "%") {
              input += "x 0.01";
            } else if (text == ",") {
              input += ".";
            } else if (text == "( )") {
              input += isFirst ? "(" : ")";
              isFirst = !isFirst;
            } else if (text == "=") {
              var userInput = input;
              userInput = input.replaceAll("X", "*");
              Parser p = Parser();
              Expression expression = p.parse(userInput);
              ContextModel contextModel = ContextModel();
              var finalValue = expression
                  .evaluate(EvaluationType.REAL, contextModel)
                  .toStringAsFixed(4);
              output = finalValue.toString();
              if (output.endsWith(".0")) {
                output = output.substring(0, output.length - 2);
              }
              input = output;
              hideInput = true;
            } else {
              input = input + text;
              hideInput = false;
            }
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: size)),
              ),
            ),
          ),
        ));
  }
}
