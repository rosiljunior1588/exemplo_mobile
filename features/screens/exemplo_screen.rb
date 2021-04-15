Dir[File.join(File.dirname(__FILE__),"../elements/*.rb")].each { |file| require file }

## O < BaseScreen serve para herdar todos os métodos da classe BaseScreen.

class ExemploScreen < BaseScreen
    include Elementos_Tela_Exemplo  ### Incluindo os elementos mapeados do módulo Elementos_Tela_Exemplo

    def aguarda_tela_x
        wait_for_id elementos_tela_exemplo[:tela_login], 30
    end

    def pressionar_botao_y
        wait_for_id elementos_tela_exemplo[:botao_y], 30
        click_by_id elementos_tela_exemplo[:botao_y]
    end

    def mensagem
        wait_for_id elementos_tela_exemplo[:texto_mensagem], 30
        mensagem_retornada = get_text_for_id elementos_tela_exemplo[:texto_mensagem]
        return mensagem_retornada
    end

    def realizar_login(login,senha)
        wait_for_id elementos_tela_exemplo[:login], 30
        send_keys_by_id elementos_tela_exemplo[:login], login
        wait_for_id elementos_tela_exemplo[:senha], 30
        send_keys_by_id elementos_tela_exemplo[:senha], senha
    end

end