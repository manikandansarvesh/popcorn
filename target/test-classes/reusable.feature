Feature: Generate a random session id

  Background:

 #Random string will be generated. This is mainly used for the X-REQUEST-ID value
    * def randomString =
    """
    function(s) {
    var text = "";
    var possible = "1234-567-890";
    for (var i = 0; i < s; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
    }
    """
    * def requestId = randomString(20)

 #Current Time value is generated and assigned to a variable. This is used for the beneficiary value when creating a beneficiary
    * def now =
      """
     function(){ return java.lang.System.currentTimeMillis() }
      """
    * def currentTime = now()

 #Random UUID value is generated and assigned to a variable. This is used for the deviceId value
    * def randomUUID =
    """
    function(){ return java.util.UUID.randomUUID() + '' }
    """
    * def uuid = randomUUID()

#    TBC
    # * def tulipReferenceGen =
    # """
    # function(s) {
    #   var text = "";
    #   var possible = "abcdefghijklmnopqrstuv1234567890";
    #   for (var i = 0; i < s; i++)
    #     text += possible.charAt(Math.floor(Math.random() * possible.length));
    #   return text;

    # }
    # """


    * def getDate =
  """
  function() {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var date = new java.util.Date();
    return sdf.format(date);
  }
  """
    * def SimpleDateFormatDate = getDate()

    * def jsessionIDSplit =
    """
    function(list)
    {
     var session=list.split(" ", 14);
     return session
    }
    """

    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }

    * def internatiocnalDateFormat =

  """
  function() {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("yyyy-MM-dd");
    var date = new java.util.Date();
    return sdf.format(date);
  }

  """

    * def yesterday =

    """
function() {
    var currentDate = new Date();
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat')
    var sdf = new SimpleDateFormat("yyyy-MM-dd");
    var yesterday = currentDate.setDate(currentDate.getDate() - 1);
    return sdf.format(yesterday)
}
    """

    * def futureDate =

        """
    function() {
        var currentDate = new Date();
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat')
        var sdf = new SimpleDateFormat("yyyy-MM-dd");
        var futureDate = currentDate.setDate(currentDate.getDate() + 1);
        return sdf.format(futureDate)

    }
        """
 #Random future date generation
    * def randomFutureDate =

    """
    function() {
    var today = new Date();
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat')
    var sdf = new SimpleDateFormat("yyyy-MM-dd");
    var futureDate = new Date();
    var randomNumber = Math.floor( Math.random()*(7-1))+1
    var futuredate=futureDate.setDate(today.getDate()+randomNumber)
    if(futureDate.getDay() === 0 || futureDate.getDay() === 6){
     futuredate = futureDate.setDate(futureDate.getDate()+2) }
    return sdf.format(futuredate)
    }
   """
    * def weekEnd =
  """
    function()
    {
    var weekend = new Date();
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat')
    var sdf = new SimpleDateFormat("yyyy-MM-dd");
    var differnece = 7-weekend.getDay();
    result = sdf.format(weekend.setDate(weekend.getDate()+differnece))
    return result
    }
    """



  Scenario: ***** This line is required please do not delete - or the functions cannot be called *****
