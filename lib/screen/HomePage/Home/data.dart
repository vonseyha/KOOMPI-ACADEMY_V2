class RecommendedModel {
  String title;
  String url;
  RecommendedModel(this.title,this.url);
}

List<RecommendedModel> recommendations = recommendationsData.map((item) => RecommendedModel(item['title'] ,item['url'])).toList();

var recommendationsData = [
  {
    "title" : "បំណិនជីវិត",
     "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/life-skill-1.svg"
  },
  {
    "title" : "បច្ចេកវិទ្យា និងកុំព្យូទ័រ",
     "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/technology.svg"
  },
  {
   "title" : "វិទ្យាសាស្រ្តមនុស្ស និងសង្គម",
     "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/human-resource.svg"
  },
  {
  "title" : "សិល្បះ",
  "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/art.svg"
  },
  {
  "title" : "វិទ្យាសាស្រ្ត",
  "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/science.svg"
  },
  {
   "title" : "គណិតវិទ្យា",
    "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/math.svg"
  },
  {
   "title" : "សាលា",
    "url" : "https://sala.koompi.com//icons/menu-icons/fill-icons/school.svg"
  },
  {
    "title":"បំណិនជីវិត",
    "url":"https://sala.koompi.com//icons/menu-icons/fill-icons/life-skill-1.svg",
  }
];