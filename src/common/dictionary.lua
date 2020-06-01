local dictionary = {}

local english = {
  StartGame = 'Start Game',
  Settings = 'Settings',
  Exit = 'Exit',
  ToggleFullscreen = 'Toggle Fullscreen',
  ChooseLanguage = 'Choose language',
  GoBack = 'Go back',
  ['type your name'] = 'type your name',
  ['press enter to continue'] = 'press enter to continue',
  ['choose your name:'] = 'choose your name:',
  ['1.1'] = 'Hello ',
  ['1.2'] = "Memory!--It's what's left when we go. We can be hero or villain we can be many things because everything is history.",
}

local portuguese = {
  StartGame = 'Começar jogo',
  Settings = 'Configurações',
  Exit = 'Sair',
  ToggleFullscreen = 'Alternar tela cheia',
  ChooseLanguage = 'Escolher língua',
  GoBack = 'Voltar',
  ['type your name'] = 'digite seu nome',
  ['press enter to continue'] = 'aperte enter para continuar',
  ['choose your name:'] = 'escolha seu nome:',
  ['1.1'] = 'Olá ',
  ['1.2'] = 'Memória!--É o que podemos deixar de melhor ou pior quando partimos. Podemos ser inspiração ou frustração, podemos ser heróis ou vilões, podemos ser várias coisas, pois tudo é história.',
}

function dictionary.localize(word)
  if language == 'english' then
    return english[word]
  else
    return portuguese[word]
  end
end

return dictionary;
