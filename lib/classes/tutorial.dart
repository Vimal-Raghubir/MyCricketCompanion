class Tutorial {
  String name;
  String summary;
  String url;
  String credits;
  int type;

  Tutorial(tutorialName, tutorialSummary, tutorialURL, tutorialCredits,
      tutorialType) {
    name = tutorialName;
    summary = tutorialSummary;
    url = tutorialURL;
    credits = tutorialCredits;
    type = tutorialType;
  }
}

var bowling1 = new Tutorial(
    "How to bowl faster",
    "Ben Williams provides a drill that can be used to increase a fast bowler's pace.",
    "https://www.youtube.com/watch?v=kOc1zn-WFiE",
    "“How to Bowl Faster - Cricket Bowling Tips.” YouTube, uploaded by  Ben Williams - My Cricket Coach, 11 Aug. 2017, www.youtube.com/watch?v=kOc1zn-WFiE.",
    1);
var bowling2 = new Tutorial(
    "Mcdermott master class - swing bowling",
    "Former Australian coach Craig McDermott, gives an in-depth explanation on swing bowling and how you can achieve this.",
    "https://www.youtube.com/watch?v=r_iwEuFknHg",
    "“McDermott Master Class: Swing Bowling.” YouTube, uploaded by cricket.com.au, 13 Aug. 2014, www.youtube.com/watch?v=r_iwEuFknHg.",
    1);
var bowling3 = new Tutorial(
    "How to bowl leg spin",
    "In this video, Tom Scollay and his team provides a few simple drills to develop leg spinners and their actions.",
    "https://www.youtube.com/watch?v=Lbk8k8_ukkA",
    "“HOW TO BOWL LEG SPIN | LEG SPIN DRILLS.” YouTube, uploaded by  Cricket Mentoring- Online coaching, tips & advice, 1 Feb. 2020, www.youtube.com/watch?v=Lbk8k8_ukkA.",
    1);
var bowling4 = new Tutorial(
    "James Anderson Running Tips",
    "In this video, James Anderson explains the importance of a good run-up and what to focus on in it.",
    "https://www.youtube.com/watch?v=3qtDWt3iBnc",
    "“James Anderson Running Tips - England Cricket Tips.” YouTube, uploaded by England & Wales Cricket Board, 26 Apr. 2017, www.youtube.com/watch?v=3qtDWt3iBnc.",
    1);
var bowling5 = new Tutorial(
    "Cricket Bowling Tips",
    "Richard Pybus curates a list of sites and sources that cover the top ten bowling tips.",
    "http://www.cricketlab.co/cricket-bowling-tips.html",
    "Pybus, Richard. “Cricket Bowling Tips.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 1 Sept. 2016, www.cricketlab.co/cricket-bowling-tips.html.",
    1);

List<Tutorial> bowlingList = [bowling1, bowling2, bowling3, bowling4, bowling5];

var batting1 = new Tutorial(
    "The key to facing good fast bowling",
    "Tom Scollay, a cricket coach, provides tips on positioning and playing off the back foot against pace bowling.",
    "https://www.youtube.com/watch?v=eIg117MWUQs",
    "'THE KEY TO FACING GOOD FAST BOWLING | Net session with Scolls.' Youtube, uploaded by Cricket Mentoring- Online coaching, tips & advice, 17 January 2020, https://www.youtube.com/watch?v=eIg117MWUQs",
    2);
var batting2 = new Tutorial(
    "Batting for Beginners - Cricket Batting Tips",
    "Ben Williams, a cricket coach, teaches batting basics including hand position on the bat and feet positioning.",
    "https://www.youtube.com/watch?v=8oOj2x4_OMs",
    "'Batting for Beginners - Cricket Batting Tips.' Youtube, uploaded by Ben Williams - My Cricket Coach, 28 August 2017, https://www.youtube.com/watch?v=8oOj2x4_OMs",
    2);
var batting3 = new Tutorial(
    "A handy drill to improve against fast bowling",
    "In this video, a drill using tennis balls and a tennis racket is used to develop reflexes against quicker bowlers.",
    "https://www.youtube.com/watch?v=f_D-Ki_4WY8",
    "'How to Destroy Fast Bowling - Batting Drill.' Youtube, uploaded by weCricket, 30 March 2018, https://www.youtube.com/watch?v=f_D-Ki_4WY8",
    2);
var batting4 = new Tutorial(
    "3 of the best drills to improve your batting",
    "In this article, 3 drills are used to help focus on your hand grip, the length of the ball, and practice aggressive strokes.",
    "https://australiancricketinstitute.com/3-best-drills-improve-batting/",
    "Fitzpatrick, Nick. '3 OF THE BEST DRILLS TO IMPROVE YOUR BATTING.' Australian Cricket Institute, https://australiancricketinstitute.com/3-best-drills-improve-batting/. Accessed 19 April 2020.",
    2);
var batting5 = new Tutorial(
    "Batting Placement Drills",
    "A simple drill used to develop the habit of picking gaps while batting.",
    "https://cricket.co.za/category/15/Coach-Education/2374/Batting-Placement-drills/",
    "'Batting - Placement drills.' Cricket South Africa, 30 Nov 2014, https://cricket.co.za/category/15/Coach-Education/2374/Batting-Placement-drills/",
    2);

List<Tutorial> battingList = [batting1, batting2, batting3, batting4, batting5];

var fielding1 = new Tutorial(
    "Cricket Fielding Tips",
    "Richard Pybus shares 10 of the best cricket fielding tips he learnt from professional cricketers around the world.",
    "http://www.cricketlab.co/fielding-tips.html",
    "Pybus, Richard. “Fielding Tips.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 2 Sept. 2016, www.cricketlab.co/fielding-tips.html.",
    3);
var fielding2 = new Tutorial(
    "Wicket Keeping Tips",
    "Richard Pybus shares the 10 best wicket keeping tips he learnt from professional keepers around the world.",
    "http://www.cricketlab.co/wicket-keeping-tips.html",
    "Pybus, Richard. “Wicket Keeping Tips.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 2 Sept. 2016, www.cricketlab.co/wicket-keeping-tips.html.",
    3);
var fielding3 = new Tutorial(
    "Bailey Master Class: Fielding",
    "George Bailey, former Australian T20 Captain, shares some essential fielding tips that all cricket players should know.",
    "https://www.youtube.com/watch?v=pyjZ-9eO5FI",
    "“Bailey Master Class: Fielding.” YouTube, uploaded by cricket.com.au, 12 Aug. 2014, www.youtube.com/watch?v=pyjZ-9eO5FI&t=.",
    3);
var fielding4 = new Tutorial(
    "Cricket Throwing Technique - Coaching Tips",
    "Ben Williams discuss proper technique and tips to improve your throws in fielding.",
    "https://www.youtube.com/watch?v=NShiz8XbJhM",
    "“Cricket Throwing Technique - Coaching Tips.” YouTube, uploaded by Ben Williams - My Cricket Coach, 28 Aug. 2017, www.youtube.com/watch?v=NShiz8XbJhM.",
    3);
var fielding5 = new Tutorial(
    "Faf Du Plessis's Top Ten cricket fielding tips",
    "Faf Du Plessis, a world class fielder, shares his top ten fielding tips to be successful in the field.",
    "http://www.cricketlab.co/faf-du-plessis-top-ten-cricket-fielding-tips.html",
    "Pybus, Richard. “Faf Du Plessis’s Top Ten Cricket Fielding Tips.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 31 Aug. 2016, www.cricketlab.co/faf-du-plessis-top-ten-cricket-fielding-tips.html.",
    3);

List<Tutorial> fieldingList = [
  fielding1,
  fielding2,
  fielding3,
  fielding4,
  fielding5
];

var mental1 = new Tutorial(
    "Cricket Mental Training: Goal Setting",
    "Richard Pybus explains the importance of setting goals which all users should try to do on this app.",
    "http://www.cricketlab.co/cricket-mental-training-goal-setting.html",
    "Pybus, Richard. “Cricket Mental Training: Performance Goal Setting.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 2 Sept. 2016, www.cricketlab.co/cricket-mental-training-goal-setting.html.",
    4);
var mental2 = new Tutorial(
    "Cricket Mental Training: Quieting the mind",
    "Richard Pybus explains the effectiveness of quieting the mind for performance.",
    "http://www.cricketlab.co/cricket-mental-training-quiet-mind.html",
    "Pybus, Richard. “Cricket Mental Training: Quiet Mind For Optimal Performance.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 2 Sept. 2016, www.cricketlab.co/cricket-mental-training-quiet-mind.html.",
    4);
var mental3 = new Tutorial(
    "Cricket Mental Training: Positive Self Talk",
    "In this article, Richard explains the benefits of positive self talk and why you should start using it.",
    "http://www.cricketlab.co/cricket-mental-training-self-talk.html",
    "Pybus, Richard. “Cricket Mental Training - Positive Self Talk.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 2 Sept. 2016, www.cricketlab.co/cricket-mental-training-self-talk.html.",
    4);
var mental4 = new Tutorial(
    "What to think about when batting - Adam Voges",
    "In this video Tom Scollay asks Adam Voges what should batters be thinking about when they are out in the middle.",
    "https://www.youtube.com/watch?v=PHuJEyb-7EE",
    "“What to Think about When Batting - Adam Voges.” YouTube, uploaded by  Cricket Mentoring- Online coaching, tips & advice, 17 July 2017, www.youtube.com/watch?v=PHuJEyb-7EE.",
    4);
var mental5 = new Tutorial(
    "Performance visualization and imagery for cricket",
    "This is an amazing article about the importance of visualizing your desired outcome in order to achieve it.",
    "http://www.cricketlab.co/visualization.html",
    "Pybus, Richard. “Performance Visualization and Imagery for Cricket.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 9 Sept. 2016, www.cricketlab.co/visualization.html.",
    4);

List<Tutorial> mentalList = [mental1, mental2, mental3, mental4, mental5];

var physical1 = new Tutorial(
    "Cricket Fitness: Plans and Programmes",
    "Richard Pybus shares a set of fitness plans and programmes curated by a cricket fitness coach named Greg King.",
    "http://www.cricketlab.co/cricket-fitness.html",
    "Pybus, Richard. “Cricket Fitness.” Cricketlab- Richard Pybus Online Cricket Coaching Tips, How To Play Cricket, Cricketlab, 1 Sept. 2016, www.cricketlab.co/cricket-fitness.html.",
    5);
var physical2 = new Tutorial(
    "England Cricket Fitness Challenge",
    "Very helpful video showing a fitness test that professional players need to pass.",
    "https://www.youtube.com/watch?v=6KkfgHfpsdg",
    "“England Players Face Gruelling Fitness Challenge - Toyota: Always A Better Way Series.” YouTube, uploaded by  England & Wales Cricket Board, 3 July 2017, www.youtube.com/watch?v=6KkfgHfpsdg.",
    5);
var physical3 = new Tutorial(
    "Intense Exercises every cricketer needs to do",
    "In this video several exercises were shown that focuses mostly on using your bodyweight for conditioning.",
    "https://www.youtube.com/watch?v=8tkVDTRCslk",
    "“Intense Exercises EVERY CRICKETER NEEDS TO DO! (NO EQUIPMENT).” YouTube, uploaded by weCricket, 25 Apr. 2018, www.youtube.com/watch?v=8tkVDTRCslk.",
    5);
var physical4 = new Tutorial(
    "10 Essential cricket strength and power exercises",
    "Rob Ahmun shares 10 exercises that cricketers should do for strength conditioning.",
    "https://www.pitchvision.com/10-essential-cricket-strength-and-power-exercises/",
    "Hinchliffe, David. “PitchVision - Live Local Matches | Tips & Techniques | Articles & Podcasts.” PitchVision - Advance Cricket Technology | Cricket Analytics, PitchVision, www.pitchvision.com/10-essential-cricket-strength-and-power-exercises. Accessed 20 Apr. 2020.",
    5);
var physical5 = new Tutorial(
    "Cricket Fitness: Bodyweight workout",
    "In this video, Tom Scollay shows several basic bodyweight exercises you should do to increase your fitness level.",
    "https://www.youtube.com/watch?v=xcs-6wtnrMw",
    "“Cricket Fitness: Body Weight Workout.” YouTube, uploaded by Cricket Mentoring- Online coaching, tips & advice, 24 Feb. 2017, www.youtube.com/watch?v=xcs-6wtnrMw.",
    5);

List<Tutorial> physicalList = [
  physical1,
  physical2,
  physical3,
  physical4,
  physical5
];
