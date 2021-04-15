Dir[File.join(File.dirname(__FILE__),"screens/*_screen.rb")].each { |file| require file }

module ScreenHelper

    def base
        @base || BaseScreen.new
    end

    def exemplo
        @exemplo ||= ExemploScreen.new
    end

end