Feature: Viewer uses home page search
  In order to search quickly
  As a viewer
  I want to see use a search that is fast and simple.

@javascript
Scenario: Search by make 
  Given I am on the "cycletrader" home page

  When I select "BMW" make
  And I click search
  Then My search should include "Make=BMW"
