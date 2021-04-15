Dado("que estou na tela X") do
    exemplo.aguarda_tela_x
  end
  
  Quando("eu pressionar o botão Y") do
    exemplo.pressionar_botao_y
  end
  
  Então("será apresentado a mensagem Z") do
    expect(exemplo.mensagem).to eql 'Mensagem Z'
  end
  
  Quando("eu informar o {string} e {string} e pressionar o botão Y") do |login, senha|
    exemplo.realizar_login(login,senha)
  end
  
  Então("será apresentado a mensagem {string}") do |mensagem|
    expect(exemplo.mensagem).to eql mensagem
  end