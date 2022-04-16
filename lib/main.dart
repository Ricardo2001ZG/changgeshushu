
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// 此处为路由实现，处理页面跳转
class ChangGeShuShuRoute extends StatefulWidget {
  @override
  _ChangGeShuShuRouteState createState() => _ChangGeShuShuRouteState();
}

class _ChangGeShuShuRouteState extends State<ChangGeShuShuRoute> {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:"/main",
      routes:{
        "/main":(context) => ChanggeShushuMain(),
      },
    );
  }
}

// 分页面实现
// 110桑柔计算器
class SangRouCalcMain extends StatefulWidget {
  SangRouCalcMain ({Key key}) : super(key : key);
  @override
  _SangRouCalcMainState createState() =>  _SangRouCalcMainState();
}

class _SangRouCalcMainState extends State<SangRouCalcMain> {
  TextEditingController _dController;
  TextEditingController _hController;
  TextEditingController _cController;
  TextEditingController _pController;
  TextEditingController _wController;
  double _dDouble;
  double _hDouble;
  double _cDouble;
  double _pDouble;
  double _wDouble;
  double _calc1Double;
  double _calc2Double;
  double _calc3Double;
  double _calc4Double;
  double _result;

  void initState() {
    super.initState();
    _dController = TextEditingController();
    _dController.text = '0';
    _hController = TextEditingController();
    _hController.text = '26982';
    _cController = TextEditingController();
    _cController.text = '12531';
    _pController = TextEditingController();
    _pController.text = '0';
    _wController = TextEditingController();
    _wController.text = '0';
    _dDouble = 0;
    _hDouble = 0;
    _cDouble = 0;
    _pDouble = 0;
    _wDouble = 0;
    _calc1Double = 0;
    _calc2Double = 0;
    _calc3Double = 0;
    _calc4Double = 0;
    _result = 0;
  }

  void dispose() {
    _dController.dispose();
    _hController.dispose();
    _cController.dispose();
    _pController.dispose();
    _wController.dispose();
    super.dispose();
  }

  Container numTextField(String numDesc, TextEditingController _numController) {
    return Container(
      width: 300,
      height: 85,
      child: Column(children: [
        Container(width: double.infinity, height: 5), // 空白填充
        Container(
          width: double.infinity,
          height: 20,
          child: Row(children: [
            Text(numDesc),
            Expanded(child: Container(width: double.infinity,),),
          ],),
        ),
        Container(
          width: 300,
          height: 60,
          child: Row(children: [
            Container(
              width: 300,
              height: 60,
              child: TextField(
                // decoration: null,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff009688)),
                  ),
                ),
                cursorColor: Color(0xff009688),
                maxLength: 6,
                maxLines: 1,
                controller: _numController,
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded(child: Container(width: double.infinity,height: 60),), // 空白填充
          ],),
        ),
      ],),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Expanded(child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Row(children: [
            Expanded(child: Container(width: double.infinity, height: double.infinity,),), // 空白填充
            Container(
              width: 300,
              height: double.infinity,
              child: ListView(children: [
                Container(width: double.infinity, height: 20), // 空白填充
                numTextField('内功攻击:', _dController),
                numTextField('基础治疗:', _hController),
                numTextField('会心等级:', _cController),
                numTextField('破防等级:', _pController),
                numTextField('无双等级:', _wController),
                Container(
                  width: double.infinity,
                  height: 30,
                  child: Row(children: [
                    Container(width: 40,height: double.infinity,), // 空白填充
                    RaisedButton(
                      child: Text('计算',style: TextStyle(color: Colors.white),),
                      color: Color(0xff4db6ac),
                      onPressed: (){
                        setState(() {
                          /*
                            Result = (d+h) * (1+c/35737.5*0.75) * (1+p/35357.5) * (1+w/34458.75)
                            d = 内功攻击
                            h = 基础治疗（不受棋宫等奇穴影响）
                            c = 会心等级
                            p = 破防等级
                            w = 无双等级
                            */
                          _dDouble = NumUtil.getDoubleByValueStr(_dController.text);
                          _hDouble = NumUtil.getDoubleByValueStr(_hController.text);
                          _calc1Double = NumUtil.add(_dDouble, _hDouble);
                          _cDouble = NumUtil.getDoubleByValueStr(_cController.text);
                          _calc2Double = NumUtil.divide(_cDouble, 35737.5);
                          _calc2Double = NumUtil.getNumByValueDouble(_calc2Double, 2);
                          _calc2Double = NumUtil.multiply(_calc2Double, 0.75);
                          _calc2Double = NumUtil.getNumByValueDouble(_calc2Double, 2);
                          _pDouble = NumUtil.getDoubleByValueStr(_pController.text);
                          _calc3Double = NumUtil.divide(_pDouble, 35357.5);
                          _calc3Double = NumUtil.getNumByValueDouble(_calc3Double, 2);
                          _calc3Double = NumUtil.add(_calc3Double, 1);
                          _wDouble = NumUtil.getDoubleByValueStr(_wController.text);
                          _calc4Double = NumUtil.divide(_wDouble, 34458.75);
                          _calc4Double = NumUtil.getNumByValueDouble(_calc4Double, 2);
                          _calc4Double = NumUtil.add(_calc4Double, 1);
                          _result = NumUtil.multiply(_calc1Double, _calc2Double);
                          _result = NumUtil.getNumByValueDouble(_result, 2);
                          _result = NumUtil.multiply(_result, _calc3Double);
                          _result = NumUtil.getNumByValueDouble(_result, 2);
                          _result = NumUtil.multiply(_result, _calc4Double);
                          _result = NumUtil.getNumByValueDouble(_result, 2);
                          _result = NumUtil.multiply(_result, 0.65);
                          _result = NumUtil.getNumByValueDouble(_result, 0).toDouble();
                        });
                      },
                    ),
                    Expanded(child: Container(width: double.infinity,height: double.infinity,),),
                    RaisedButton(
                      child: Text('清空',style: TextStyle(color: Colors.white),),
                      color: Color(0xff4db6ac),
                      onPressed: (){
                        setState(() {
                          _dController.text = '0';
                          _hController.text = '26982';
                          _cController.text = '12531';
                          _pController.text = '0';
                          _wController.text = '0';
                          _dDouble = 0;
                          _hDouble = 0;
                          _cDouble = 0;
                          _pDouble = 0;
                          _wDouble = 0;
                          _calc1Double = 0;
                          _calc2Double = 0;
                          _calc3Double = 0;
                          _calc4Double = 0;
                          _result = 0;
                        });
                      },
                    ),
                    Container(width: 40,height: double.infinity,), // 空白填充
                  ],),
                ),
                Container(width: double.infinity, height: 20), // 空白填充
                Text('桑柔期望dps：' + _result.toInt().toString()),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('桑柔期望dps(*25)：' + NumUtil.multiply(_result, 25).toInt().toString()),
                Container(width: double.infinity, height: 30), // 空白填充
                Container(
                  width: double.infinity,
                  height: 20,
                  child: Text('下拉可查看更多介绍',textAlign: TextAlign.center,),
                ),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('常见问题解答：'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('反馈qq群：418483739'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('无属性项请填0。'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('会心、破防、无双请填整数等级。'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('公式为 Result = (d+h) * (1+c/35737.5*0.75) * (1+p/35357.5) * (1+w/34458.75) * 0.65'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('d = 内功攻击'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('h = 基础治疗'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('c = 会心等级'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('p = 破防等级'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('w = 无双等级'),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('公式作者：左谓雨@念破'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('开发者：泠泉喵@飞龙在天'),
                Container(width: double.infinity, height: 5), // 空白填充
              ],),
            ),
            Expanded(child: Container(width: double.infinity, height: double.infinity,),), // 空白填充
          ],),
        ),),
      ],),
    );
  }
}

// 100治疗收益计算
class Jx3CalcOfGuguguMain extends StatefulWidget {
  Jx3CalcOfGuguguMain ({Key key}) : super(key : key);
  @override
  _Jx3CalcOfGuguguMainState createState() =>  _Jx3CalcOfGuguguMainState();
}

class _Jx3CalcOfGuguguMainState extends State<Jx3CalcOfGuguguMain> {
  TextEditingController _aController;
  TextEditingController _cController;
  TextEditingController _hController;
  double _aDouble;
  double _cDouble;
  double _hDouble;
  double _cExpectation;
  double _hExpectation;
  double _nowExpectation;
  double _nowAll;
  double _cOptimization;
  double _hOptimization;
  double _optimizationExpectation;
  double _endImprove;

  void initState() {
    super.initState();
    _aController = TextEditingController();
    _aController.text = '175.00';
    _cController = TextEditingController();
    _cController.text = '30.00';
    _hController = TextEditingController();
    _hController.text = '12000';
    _aDouble = 0;
    _cDouble = 0;
    _hDouble = 0;
    _cExpectation = 0;
    _hExpectation = 0;
    _nowExpectation = 0;
    _nowAll = 0;
    _cOptimization = 0;
    _hOptimization = 0;
    _optimizationExpectation = 0;
    _endImprove = 0;
  }

  void dispose() {
    _aController.dispose();
    _cController.dispose();
    _hController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Expanded(child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Row(children: [
            Expanded(child: Container(width: double.infinity, height: double.infinity,),), // 空白填充
            Container(
              width: 300,
              height: double.infinity,
              child: ListView(children: [
                Container(width: double.infinity, height: 20), // 空白填充
                Container(width: double.infinity,height: 20,child: Text('指定会效：'),),
                Container(
                  width: 300,
                  height: 60,
                  child: Row(children: [
                    Container(
                      width: 250,
                      height: 60,
                      child: TextField(
                        // decoration: null,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff009688)),
                          ),
                        ),
                        cursorColor: Color(0xff009688),
                        maxLength: 6,
                        maxLines: 1,
                        controller: _aController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(child: Container(width: double.infinity,height: 60),), // 空白填充
                    Text('%'),
                  ],),
                ),
                Container(width: double.infinity, height: 20), // 空白填充
                Container(
                  width: double.infinity,
                  height: 20,
                  child: Row(children: [
                    Text('指定会心：'),
                    Expanded(child: Container(width: double.infinity,),),
                    Text('对应期望面板治疗：'+_hExpectation.toString()),
                  ],),
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: Row(children: [
                    Container(
                      width: 250,
                      height: 60,
                      child: TextField(
                        // decoration: null,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff009688)),
                          ),
                        ),
                        cursorColor: Color(0xff009688),
                        maxLength: 6,
                        maxLines: 1,
                        controller: _cController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(child: Container(width: double.infinity,height: 60),), // 空白填充
                    Text('%'),
                  ],),
                ),
                Container(width: double.infinity, height: 20), // 空白填充
                Container(
                  width: double.infinity,
                  height: 20,
                  child: Row(children: [
                    Text('指定面板治疗：'),
                    Expanded(child: Container(width: double.infinity,),),
                    Text('对应期望会心：'+_cExpectation.toString()+'%'),
                  ],),
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: Row(children: [
                    Container(
                      width: 250,
                      height: 60,
                      child: TextField(
                        // decoration: null,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff009688)),
                          ),
                        ),
                        cursorColor: Color(0xff009688),
                        maxLength: 6,
                        maxLines: 1,
                        controller: _hController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(child: Container(width: double.infinity,height: 60),), // 空白填充
                  ],),
                ),
                Container(width: double.infinity, height: 20), // 空白填充
                Text('指定面板治疗：' + _hController.text),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('指定面板会心：' + _cController.text + '%'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('指定面板会效：' + _aController.text + '%'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('指定期望收益：' + _nowExpectation.toString()),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('同装分优化后会心：' + _cOptimization.toString() + '%'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('同装分优化后治疗：' + _hOptimization.toString()),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('同装分优化后期望：' + _optimizationExpectation.toString()),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('同装分优化后提升：' + _endImprove.toString() + '%'),
                Container(width: double.infinity, height: 20), // 空白填充
                Container(
                  width: double.infinity,
                  height: 30,
                  child: Row(children: [
                    Container(width: 40,height: double.infinity,), // 空白填充
                    RaisedButton(
                      child: Text('计算',style: TextStyle(color: Colors.white),),
                      color: Color(0xff4db6ac),
                      onPressed: (){
                        setState(() {
                          /*
                            H'=C*(A-1)+1
                            C'=H*(A-1)
                            8047.337*[C*(A-1)+1]=H*(A-1)
                            H=8047.337*[C*(A-1)+1]/(A-1)
                            C=CA+1-[(A-1)H]/8047.337
                            */
                          _aDouble = double.parse(_aController.text)/100;
                          _cDouble = double.parse(_cController.text)/100;
                          _hDouble = double.parse(_hController.text);
                          _hExpectation = 8047.337*(_cDouble*(_aDouble-1)+1)/(_aDouble-1);
                          _cExpectation = _hDouble/8047.337-(1/(_aDouble-1));
                          _hExpectation = ((_hExpectation*100).round())/100;
                          _cExpectation = ((_cExpectation*10000).round())/100;
                          _nowExpectation = _hDouble*(_cDouble*(_aDouble-1)+1);
                          _nowExpectation = ((_nowExpectation*100).round())/100;
                          _nowAll = _hDouble + 8047.337 * _cDouble;
                          _nowAll = ((_nowAll*100).round())/100;
                          _cOptimization = ((_aDouble-1)*_nowAll-8047.337)/(2*8047.337*(_aDouble-1));
                          _hOptimization = _nowAll-8047.337*_cOptimization;
                          _hOptimization = (_hOptimization*100).round()/100;
                          _optimizationExpectation = _hOptimization*((_aDouble-1)*_cOptimization+1);
                          _optimizationExpectation = (_optimizationExpectation*100).round()/100;
                          _endImprove = _optimizationExpectation/_nowExpectation-1;
                          _cOptimization = (_cOptimization*10000).round()/100;
                          _endImprove = (_endImprove*10000).round()/100;
                        });
                      },
                    ),
                    Expanded(child: Container(width: double.infinity,height: double.infinity,),),
                    RaisedButton(
                      child: Text('清空',style: TextStyle(color: Colors.white),),
                      color: Color(0xff4db6ac),
                      onPressed: (){
                        setState(() {
                          _aController.text = '175.00';
                          _cController.text = '30.00';
                          _hController.text = '12000';
                          _aDouble = 0;
                          _cDouble = 0;
                          _hDouble = 0;
                          _cExpectation = 0;
                          _hExpectation = 0;
                        });
                      },
                    ),
                    Container(width: 40,height: double.infinity,), // 空白填充
                  ],),
                ),
                Container(width: double.infinity, height: 30), // 空白填充
                Container(
                  width: double.infinity,
                  height: 20,
                  child: Text('下拉可查看更多介绍',textAlign: TextAlign.center,),
                ),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('常见问题解答：'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('会效必填，会心与面板治疗选填一项；或两项均填，对比两个期望数值与所填数值的差距。'),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('三项均填可计算优化配装结果。'),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('面板治疗对应会心远远高于当前会心，说明应调整比例，提高会心降低治疗量。'),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('会心对应面板治疗远远高于当前面板治疗，说明应调整比例，提高面板治疗降低会心。'),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('此计算器并未说明精简收益低于普通装备，因精简装备属性上有多于普通装备的属性。'),
                Container(width: double.infinity, height: 10), // 空白填充
                Text('计算器作用在于将过量的会心或面板治疗属性有效化。'),
                Container(width: double.infinity, height: 20), // 空白填充
                Text('本程序公式基于 铿尔琴歇 的简要excel计算器'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('计算指定会效下的最优会心或面板治疗'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('100%会心等于8047.337点面板治疗'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('定义会心为C、会效为A、面板治疗为H'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('期望总收益为 H*(C*A+1-C)'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('对H求导为 C*(A-1)+1'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('对C求导为 H*(A-1)'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('此处求导结果即为属性单分收益。 '),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('极值符合求导结果相等，因此'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('当两个属性的单分收益相同时，收益最大。'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('因此收益目标为 8047.337*对H求导=对C求导'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('Q.E.D. (滑稽)'),
                Container(width: double.infinity, height: 20), // 空白填充
                Text('特别感谢 左谓雨@念破 的协助与建议'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('公式作者：铿尔琴歇'),
                Container(width: double.infinity, height: 5), // 空白填充
                Text('开发者：泠泉喵@飞龙在天'),
                Container(width: double.infinity, height: 5), // 空白填充
              ],),
            ),
            Expanded(child: Container(width: double.infinity, height: double.infinity,),), // 空白填充
          ],),
        ),),
      ],),
    );
  }
}

// 主页面实现
class ChanggeShushuMain extends StatefulWidget {
  ChanggeShushuMain ({Key key}) : super(key : key);
  @override
  _ChanggeShushuMainState createState() =>  _ChanggeShushuMainState();
}

class _ChanggeShushuMainState extends State<ChanggeShushuMain> with SingleTickerProviderStateMixin{
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 3);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      /*启用本地化设置，对中文启用支持。*/
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
        // Chinese *See Advanced Locales below*
      ],
      title: 'ChanggeShushu',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff009688),
          title: Center(
            child: Text(
              "长鸽门术数集 v2.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "110桑柔计算器"),
              Tab(text: "110属性收益计算器"),
              Tab(text: "100属性收益计算器"),
            ],
            controller: _tabController,  // 记得要带上tabController
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
                child: SangRouCalcMain(),
            ),
            Center(
                child: Text(
                  "这是没有公式写不出来的内容",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,),
                ),
            ),
            Center(
                child: Jx3CalcOfGuguguMain(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(ChangGeShuShuRoute());