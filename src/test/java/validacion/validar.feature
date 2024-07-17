Feature: Test login demoblaze

  Background:
    * url urlBase
    * def bodyDemoBlaze = read ('body.json')

  Scenario: Crear un nuevo usuario en signup
    Given path 'signup'
    And set body.username = getStringRandom()
    And set body.password = getStringRandom()
    And request bodyDemoBlaze
    When method post
    Then status 200

  Scenario: Intentar crear un usuario ya existente
    Given path 'signup'
    And set body.username = "Intento"
    And set body.password = "Intento1"
    And request bodyDemoBlaze
    When method post
    Then status 200
    And match response == { "errorMessage": "This user already exist." }

  Scenario: Usuario y password correcto en login
    Given path 'login'
    And set body.username = "Intento"
    And set body.password = "Intento1"
    And request bodyDemoBlaze
    When method post
    Then status 200

  Scenario: Usuario y password incorrecto en login
    Given path 'login'
    And set body.username = "Intento"
    And set body.password = "Intento12"
    And request bodyDemoBlaze
    When method post
    Then status 200
    And match response == { "errorMessage": "Wrong password." }