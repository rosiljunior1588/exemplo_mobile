#!/usr/bin/env ruby
require 'appium_lib'
require 'appium_console'
require 'cucumber'
require 'allure-cucumber'
require_relative 'screen_helper'

####

#1- Saber quais capabilities devemos na nossa sessão
caps_path = File.join(File.dirname(__FILE__), 'capabilities','QA',"#{ENV['PLATFORM']}.txt")
caps = Appium.load_appium_txt file: caps_path, verbose: true

#2- Criar um cliente e preparar as capabilities
Appium::Driver.new caps, true

World(ScreenHelper)

class AppiumWorld
end 

Appium.promote_appium_methods AppiumWorld

#3- Iniciar sessão

Before {
    $driver.start_driver  ## Inicializar o Driver
    $driver.available_contexts ## Retorna todos os contextos do aplicativo, caso seja híbrido.
    $driver.set_context("WEBVIEW_com.accenture.exemplo") ## Alteração para o contexto informado no parametro.

## Relatório de execução.

    Allure.configure do |c|
        c.results_directory = "allure-results"
        c.clean_results_directory = true
        c.logging_level = Logger::INFO
    end

}

#4 - Encerrar sessao

After {
    $driver.driver_quit
}