List<dynamic> dateMasterList = [];
List<dynamic> messagesList = [];
Map<dynamic, dynamic> messageDictionary = {};
int monthRange = 122; //n months * 30 days
int otherDaySmsCount = 28;
int todaySmsCount = 28;

Map<String, String> bankIcon = {
  'QP-CANBNK':
      'https://www.logotaglines.com/wp-content/uploads/2016/08/wp-1470410546498.jpg',
  'JD-CANBNK':
      'https://www.logotaglines.com/wp-content/uploads/2016/08/wp-1470410546498.jpg',
  'AD-CENTBK':
      'https://assets-netstorage.groww.in/stock-assets/logos/GSTK532885.png',
  'VM-CENTBK':
      'https://assets-netstorage.groww.in/stock-assets/logos/GSTK532885.png',
  'AX-CSFBNK':
      'https://www.armssecurities.com/wp-content/uploads/2018/12/Capital-Small-Finance-Bank-logo.jpg',
  'VM-FedFiB':
      'https://apprecs.org/gp/images/app-icons/300/14/com.fedmobile.jpg',
  'JM-ONJPTR':
      'https://apprecs.org/gp/images/app-icons/300/14/com.fedmobile.jpg',
  'VD-IDFCFB':
      'https://companieslogo.com/img/orig/IDFCFIRSTB.NS-6c6b4306.png?t=1613442190',
  'VM-IDFCFB':
      'https://companieslogo.com/img/orig/IDFCFIRSTB.NS-6c6b4306.png?t=1613442190',
  'JM-KOTAKB':
      'https://stn91-app.s3.ap-south-1.amazonaws.com/production/public/media/4IlwWJyD6.png',
  'JD-FLPKRT':
      'https://i.pinimg.com/originals/aa/70/8d/aa708d1f97a04f6f5a208213f89e1e67.png',
  'TM-ZOMATO':
      'https://cdn.iconscout.com/icon/free/png-256/free-zomato-1937646-1637644.png',
  'TX-SWIGGY':
      'https://1000logos.net/wp-content/uploads/2021/05/Swiggy-logo.png',
  'JM-MSHAPP':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Meesho_Logo_Full.png/480px-Meesho_Logo_Full.png'
};
