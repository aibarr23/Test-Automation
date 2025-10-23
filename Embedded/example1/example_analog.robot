*** Settings ***
Library        EP.py ${ep_address}    gpio.ep-config
Suite Setup    DUT Flash Firmware    example_analog.bim

*** Test Cases ***
Set 1.5V Analog And Read  Matching Digital Value Range
    [Documentation]    Analog range between
    ... 0.0V (digital 0) and 3.0V (digital 16384)
    ...    1.5V ideal conversion is value 8192
    ANOUT1 Connect 26
    ANOUT1 Set Static 1.5V
    ${adc_value} = DUT Invoke    get_analog_value
    Should Be Equal    ${adc_value}    ${8192}