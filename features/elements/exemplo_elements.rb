## Módulo configurado para mapear todos os elementos da tela, cada tela deve se criar uma classe screen e elements.
## O Exemplo de utilizar elements deve ser aplicado quando o aplicativo é hibrido, ou seja, o mapeamento de elementos será da mesma forma tanto para iOS como para Android.

module Elementos_Tela_Exemplo
    
    def elementos_tela_exemplo
        {
            tela_login: 'id_tela_login',
            login: 'id_login',
            senha: 'id_senha',
            texto_mensagem: 'id_mensagem',
            botao_y: 'id_botao_y'
        }
    end
end