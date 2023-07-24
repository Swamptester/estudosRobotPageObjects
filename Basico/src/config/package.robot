*** Settings ***
Documentation    Aqui constarão todas as interações/ações dentro das páginas do Sauce Labs
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Variables    hooks.yml
Variables    ../auto/sauceLabsVar.yml   

#Resources
Resource    hooks.robot

#Keywords
Resource    ../auto/sauceLabsPages.robot
Resource    ../auto/API_kw.robot
