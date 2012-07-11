Feature: Viewer uses advanced search
  In order to search more specifically
  As a viewer
  I want to see use a search that gives me a lot of power.

@javascript
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

@javascript
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
