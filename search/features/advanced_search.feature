Feature: Viewer uses advanced search
  In order to search more specifically
  As a viewer
  I want to see use a search that gives me a lot of power.

Scenario Outline: Search by condition
  Given I am on the "cycletrader" advanced search page
  When I choose "<class>" class
  And I open the "condition" section
  And I click the "New" checkbox
  And I click search
  Then My search should include "Condition=New"

  Examples:
    | class       |
    | Motorcycles |
    | ATVs        |
    | PWCs        |
    | Snowmobiles |
    | Trailers    |

Scenario Outline: Search by condition
  Given I am on the "<site>" advanced search page
  When I open the "condition" section
  And I click the "New" checkbox
  And I click search
  Then My search should include "Condition=New"

  Examples:
    | site                   |
    | walnecks               |
    | pwctrader              |
    | atvtraderonline        |
    | snowmobiletraderonline |
    | aerotrader             |
    | rvtrader               |

Scenario Outline: Search by make
  Given I am on the "<site>" advanced search page
  When I open the "make" section
  And I click the "<make>" checkbox
  And I click search
  Then My search should include "Make=<make>"

  Examples:
    | site                   | make     |
    | walnecks               | BMW      |
    | pwctrader              | Yamaha   |
    | atvtraderonline        | Polaris  |
    | snowmobiletraderonline | Polaris  |
    | aerotrader             | Cessna   |
    | rvtrader               | Keystone |

Scenario Outline: Search by price
  Given I am on the "<site>" advanced search page
  When I open the "price" section
  And I set price range to $1000-$3000
  And I click search
  Then My search should include "Price Range=$1,000-$3,000"

  Examples:
    | site                   |
    | walnecks               |
    | pwctrader              |
    | atvtraderonline        |
    | snowmobiletraderonline |
    | aerotrader             |
    | rvtrader               |

Scenario Outline: Search by Year
  Given I am on the "<site>" advanced search page
  When I open the "year" section
  And I set year range to 2007-2012
  And I click search
  Then My search should include "Year=2007 - 2012"

  Examples:
    | site                   |
    | walnecks               |
    | pwctrader              |
    | atvtraderonline        |
    | snowmobiletraderonline |
    | aerotrader             |
    | rvtrader               |

Scenario Outline: Search by Keyword
  Given I am on the "<site>" advanced search page
  When I open the "keyword" section
  And I enter "big" into "keyword"
  And I click search
  Then My search should include "Keyword=Big"

  Examples:
    | site                   |
    | walnecks               |
    | pwctrader              |
    | atvtraderonline        |
    | snowmobiletraderonline |
    | aerotrader             |
    | rvtrader               |

Scenario Outline: Search by Ad Id
  Given I am on the "<site>" advanced search page
  When I open the "adid" section
  And I enter "12345" into "adid"
  And I click search
  Then My search should include "Ad Id=Ad Id: 12345"

  Examples:
    | site                   |
    | walnecks               |
    | pwctrader              |
    | atvtraderonline        |
    | snowmobiletraderonline |
    | aerotrader             |
    | rvtrader               |
