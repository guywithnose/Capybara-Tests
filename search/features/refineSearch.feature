Feature: Refine search
  A more advanced search should be possible through the 
  left-rail refine element.

Background: On a blank search page
  Given I am on a cycletrader nationwide search with no criteria.

Scenario: Refine by make
  When I click the "Harley-Davidson" refine link
  Then The page should contain "Harley-Davidson"

Scenario: Refine by seller type
  When I click the "Private Seller" refine link
  Then The page should contain "Private Seller"

Scenario: Refine by condition
  When I click the "New 2012 - 2013" refine link
  Then The page should contain "New 2012 or newer"
