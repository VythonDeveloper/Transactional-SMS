List<dynamic> dateMasterList = [];
List<dynamic> messagesList = [];
Map<dynamic, dynamic> messageDictionary = {};
int monthRange = 6 * 30; //n months * 30 days
int otherDaySmsCount = 45;
int todaySmsCount = 80;

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
};
