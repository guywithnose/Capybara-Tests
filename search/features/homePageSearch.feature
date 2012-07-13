Feature: Viewer uses home page search
  In order to search quickly
  As a viewer
  I want to see use a search that is fast and simple.

Scenario: Search by make 
  Given I am on the "cycletrader" home page

  When I select "BMW" make
  And I click the search button
  Then The search should include "Bmw"
