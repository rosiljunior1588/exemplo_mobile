Before do |scenario|
    ## Responsável por criar o diretório com evidencias, antes de iniciar o cenário.

    $scenario_name = scenario.name.gsub(/[#+ (),-]/,'#' => '', '+' => '', 'exemplos' => '',' ' => '_', '(' => '', ')' => '', ',' => '', '-' => '')
    $result_path = "features/evidences"
    $folder_name = "#{$result_path}/#{Time.now.strftime('%Y%m%d%H%M%S')}_#{$scenario_name.downcase!}_#{ENV['PLATFORM']}"
    Dir.mkdir($folder_name) unless File.exists?($folder_name)
  
  end
  
  After do |scenario|

    ## Geracao de evidencia caso o cenario falhe.

    if scenario.failed?
        $file_name_failed = "screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}_FAILED.png"
        Utils.convert_driver_nativo
        evidence = $driver.screenshot(File.join("#{$folder_name}", $file_name_failed))
        Utils.convert_driver_webview
        Allure.add_attachment(name: "Evidence - Test Failed", source: evidence, type: Allure::ContentType::PNG, test_case: true)
        #embed("#{$folder_name}/#{$file_name_failed}", 'image/png') - Para anexar a evidencia dentro do Cucumber Report
        $driver.driver_quit
    end
  
  end
  
  AfterStep do |scenario|

    ## Geracao de evidencias apos cada step concluido.

    $file_name_success = "screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}_OK.png"
    Utils.convert_driver_nativo
    evidence = $driver.screenshot(File.join($folder_name,$file_name_success))
    Utils.convert_driver_webview
    Allure.add_attachment(name: "Evidence - Test Step", source: evidence, type: Allure::ContentType::PNG, test_case: false)
    #embed("#{$folder_name}/#{$file_name_success}", 'image/png') - Para anexar a evidencia dentro do Cucumber Report

  end