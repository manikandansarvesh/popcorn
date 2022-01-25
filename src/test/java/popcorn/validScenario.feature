Feature: retrieve the promotion info

  Background:

  @fetchPromoInfo
  Scenario:
    Given url 'http://api.intigral-ott.net/popcorn-api-rs-7.9.17/v1/promotions'
    And param apikey = 'webB2BGDMSTGExy0sVDlZMzNDdUyZ'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = 'webB2BGDMSTGExy0sVDlZMzNDdUyZ'
    When method get
    Then status 200
    * print response
    And assert response.promotions.length == 6
    And match response.promotions[0].promotionId == '#string'
    And match response.promotions[0].orderId == '#number'
    And match response.promotions[1].promoType == 'REWIND'
    * def children = $response[*].promotions[*].promoArea[*]
    * def schema = { "home": "#string"}
    * match each children == schema
    And match response.promotions[0].showPrice == false
    And match response.promotions[0].showText == false
    And assert response.promotions[0].localizedTexts.ar[0].length == 10

    * def localizedTextsValue =
      """
      {

        "ar": [
         "Sabe movie",
          " ",
         " "
         ],
      "en": [
      "Sabe movie",
      " ",
     " "
   ]
  }
     """
    And match response.promotions[0].localizedTexts == localizedTextsValue
    * def localizedTextResponse = response.promotions[0].localizedTexts
    * def array = [{ar: 'Sabe movie'},{ar: ''},{ar: ''}]
    Then match each array contains
    """
    {
          ar : '#string'
       }
    """
    And match response.promotions[*].localizedTexts.ar[0] contains '#string'
    And match response.promotions[*].localizedTexts.en[0] contains '#string'
    And match response.promotions[*].localizedTexts[*] contains []
    * def programType = 'movie'
    * def programType1 = 'episode'
    * def list = ['episode','movie']
    * def data = karate.mapWithKey(list, 'programType')
    * match data == [{ programType: 'episode' }, { programType: 'movie' }]
    And match response.promotions[0].properties[0].programType == programType
    And match response.promotions[4].properties[0].programType == programType1


  @InvalidScenario
  Scenario:
    Given url 'http://api.intigral-ott.net/popcorn-api-rs-7.9.17/v1/promotions'
    And param apikey = 'webB2BGDMSTGExy0sVDlZMzNDdUyZ_InvalidKey'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    When method get
    Then status 403
    And match response.error.message == 'invalid api key'
    And match response.error.code == '8001'
    * def requestId = response.error.requestId
    * print requestId









