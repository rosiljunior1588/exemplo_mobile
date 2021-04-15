## Classe de funções genéricas para auxiliar nos scripts.

class Utils
    def get_status_appium
      begin
        Process.getpgid('appium')
        return true
      rescue Errno::ESRCH
        return false
      end
    end
  
    def start_appium
  
      unless get_status_appium true
  
      end
    end
  
    def quit_appium
  
      unless get_status_appium false
  
      end
    end
  
    def self.convert_driver_nativo
      context = $driver.available_contexts
      $driver.set_context("NATIVE_APP")
    end
  
    def self.convert_driver_webview
      context=$driver.available_contexts
      if ENV['PLATFORM'] == "android"
        $driver.set_context("WEBVIEW_com.accenture.appvarejo")
        #$driver.set_context("WEBVIEW_io.ionic.starter")
      else
        $driver.set_context(context[1])
      end
  
    end
  
    def self.apaga_dados_input(tamanho)
      i = 0
      while i < tamanho do
        $driver.press_keycode(67)
        i = i + 1
      end
    end

    def self.load_url_home
      $driver.get("file:///android_asset/www/index.html")
    end

    def self.escrevelog(msg)
      File.exists?("#{$folder_name}/#{$txt_name}.txt")
      arq=File.open("#{$folder_name}/#{$txt_name}.txt",'a+')
      arq.puts"#{Time.now.strftime('%Y/%m/%d-%H:%M:%S')} - #{msg}"
      arq.close
    end
  
  end