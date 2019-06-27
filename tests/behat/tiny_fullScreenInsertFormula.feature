@editor @tinymce @tinymce_tiny_mce_wiris
Feature: Checks if formula can be inserted correctly in full screen

  Background:
    Given the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | admin  | C1     | editingteacher |

  @javascript
  Scenario: Checks if formula can be inserted correctly in full screen
    And I log in as "admin"
    And I follow "Preferences" in the user menu
    And I follow "Editor preferences"
    And I set the field "Text editor" to "TinyMCE HTML editor"
    And I press "Save changes"
    And I navigate to "Plugins" in site administration
    And I follow "Manage filters"
    And I click on "On" "option" in the "MathType by WIRIS" "table_row"
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Forum" to section "0"
    And I set the following fields to these values:
      | Forum name | News Forum |
    And I press "Save and return to course"
    And I follow "News Forum"
    And I press "Add a new discussion topic"
    And I set the following fields to these values:
      | Subject | Test MathType for Atto on Moodle |
    And I press "Toolbar Toggle"
    And I press "Toggle full screen mode"
    And I press "mce_fullscreen_tiny_mce_wiris_formulaEditor"
    And I set MathType formula to '<math><msqrt><mn>2</mn><mi>&#x3c0;</mi></msqrt></math>'
    And I press accept button in MathType Editor
    Then Wirisformula should has width 39 with error of 4 in full screen mode
    And I press "mce_fullscreen_fullscreen"
    And I press "Post to forum"
    And I follow "Test MathType for Atto on Moodle"
    Then a Wirisformula containing "square root of 2 pi end root" should exist
    And I follow "Edit"
    Then Wirisformula should has width 39 with error of 4 in Message field



