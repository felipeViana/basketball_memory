local globals = require 'src/common/globals'
local dictionary = {}

local function getEnglishDict()
  return {
    -- characters
    Narrador = 'Narrator',
    Criador = 'Creator',

    -- words
    e = 'and',

    -- menus
    StartGame = 'Start Game',
    Settings = 'Settings',
    StageSelection = 'Choose Stage',
    ExitToMenu = 'Exit to menu',
    ExitGame = 'Exit game',
    ToggleFullscreen = 'Toggle Fullscreen',
    ChooseLanguage = 'Choose language',
    GoBack = 'Go back',
    ['type your name'] = 'type your name',
    ['press enter to continue'] = 'press enter to continue',
    ['choose your name:'] = 'choose your name:',
    ['Choose your language'] = 'Choose your language',

    -- cutScenes
    ['1.1'] = 'Olá ' .. globals.playerName .. '!',
    ['1.2'] = 'Memória!--É o que podemos deixar de melhor ou pior quando partimos. Podemos ser inspiração ou ' ..
      'frustração, podemos ser heróis ou vilões, podemos ser várias coisas, pois tudo é história.',

    ['2.1'] = 'Bom dia cidadãos da nossa belíssima cidade da memória, onde memórias se tornam história. ' ..
      'Hoje será realizada a inscrição para o campeonato de jogo da memória virtual que ' ..
      'decidi realizar aqui na cidade.',
    ['2.2'] = 'As vagas são limitadas, só temos 16. Como o local é um ginásio nós teremos muito espaço para ' ..
      'assistir ao campeonato. Vocês só terão que pagar 10 cérebros para entrar e se divertir lá dentro. Mas ' ..
      'agora que temos bastante gente aqui deixa eu começar a explicar como será.',
    ['2.3'] = 'Os participantes irão se inscrever, em seguida nós faremos um sorteio e serão definidos ' ..
      'chaves de 8 jogadores. ' ..
      'De cada chave 4 se classificam para as quartas de final e todas as partidas serão definidas por sorteio. ' ..
      'Neste campeonato os jogadores irão se enfrentar um contra um. Serão 4 estilos de jogos da memória mas cada ' ..
      'estilo só vai mudar depois de cada classificação. Ou seja, é um estilo para as oitavas de final, outro para ' ..
      'as quartas de final, outro para as semifinais e outro para a final. ' ..
      'Cada estilo de jogo terá 5 níveis nos quais os jogadores irão se enfrentar. ' ..
      'Antes de cada partida será explicado melhor como funcionará como modo de jogo.',
    ['2.4'] = 'Então quem estiver interessado apareça no ginásio de memorial esportivo hoje às 10 horas ' ..
      'da manhã pois é o horário de início da inscrição e só vai até acabar as vagas. Para quem for assistir ' ..
      'ao campeonato eu começarei as inscrições de vocês as 15:00 da tarde. Ah e mais uma coisa, ' ..
      'terá uma homenagem surpresa no campeonato, garanto que pelo estilo da nossa cidade vocês irão gostar, ' ..
      'então participem, venham assistir, pois vai ser de arrepiar hehehehe!',
    ['2.5'] = 'E para finalizar os prêmios serão: O campeão vai ganhar um jogo da memória novinho, ' ..
      'um troféu, uma medalha de ouro, uma bola de basquete, uma camisa de basquete homenagem, um brinde ' ..
      'bem especial e um bom dinheiro. O segundo lugar irá ganhar uma medalha de prata, um jogo da memória ' ..
      'novo, uma bola de basquete homenagem e uma quantia razoável de dinheiro. E o terceiro lugar ganhará ' ..
      'uma medalha de bronze, um jogo da memória novo, uma camisa de basquete homenagem e uma quantia ' ..
      'menor de dinheiro. Então, chega de papo e vamos se inscrever!',

    ['3-1.1'] = 'Então, o jovem anuncia o campeonato na cidade do basquete pensante, o seu local de origem ' ..
      'e muitos ficam animados com essa inovação. Um garoto de 18 anos então se interessa e vai tentar se ' ..
      'inscrever. Ele e seu amigo Bob estavam animados para participar do campeonato e antes do ato da ' ..
      'inscrição Bob pergunta:',
    ['3-1.2'] = 'Você tem certeza que quer se inscrever? Acha que consegue vencer?',
    ['3-1.3'] = globals.playerName .. ' pensa bastante e diz:',
    ['3-1.4'] = 'Sim! Tenho certeza! Preciso aproveitar essa oportunidade para recuperar minha memória, ' ..
      'pois não lembro do que me aconteceu e porque moro com você e não com meus pais. ' ..
      'Não lembro nem se tive pais um dia.',
    ['3-1.5'] = 'Bob fica arrasado e pensa:',
    ['3-1.6'] = 'O que eu devo dizer agora? Já contei a ele várias vezes sobre a história do acidente e ele ' ..
      'não lembra. Vou ficar na minha e quando for possível, mostrarei tudo a ele.',
    ['3-1.7'] = 'Então o jovem garoto vai se inscrever, mas percebe que está sem dinheiro e então... ',

    ['4.1'] = '4.1',
    ['4.2'] = '4.2',
    ['4.3'] = '4.3',
    ['4.4'] = '4.4',
    ['4.5'] = '4.5',
    ['4.6'] = '4.6',
    ['4.7'] = '4.7',
    ['4.8'] = '4.8',
    ['4.9'] = '4.9',
    ['4.10'] = '4.10',
    ['4.11'] = '4.11',
    ['4.12'] = '4.12',
    ['4.13'] = '4.13',

    ['5.1'] = '5.1',
    ['5.2'] = '5.2',
    ['5.3'] = '5.3',
    ['5.4'] = '5.4',

    ['6.1'] = '6.1',
    ['6.2'] = '6.2',

    ['11.1'] = '11.1',
    ['11.2'] = '11.2',

    ['11-2.1'] = '11-2.1',
    ['11-2.2'] = '11-2.2',
    ['11-2.3'] = '11-2.3',
    ['11-2.4'] = '11-2.4',

    credits = 'créditos',
  }
end

local function getPortugueseDict()
  return {
    -- characters
    Narrador = 'Narrador',
    Criador = 'Criador',

    -- words
    e = 'e',

    -- menus
    StartGame = 'Começar jogo',
    Settings = 'Configurações',
    StageSelection = 'Escolher fase',
    ExitToMenu = 'Sair pro menu',
    ExitGame = 'Sair do jogo',
    ToggleFullscreen = 'Alternar tela cheia',
    ChooseLanguage = 'Escolher língua',
    GoBack = 'Voltar',
    ['type your name'] = 'digite seu nome',
    ['press enter to continue'] = 'aperte enter para continuar',
    ['choose your name:'] = 'escolha seu nome:',
    ['Choose your language'] = 'Escolha sua língua',

    -- cutScenes
    ['1.1'] = 'Olá ' .. globals.playerName .. '!',
    ['1.2'] = 'Memória!--É o que podemos deixar de melhor ou pior quando partimos. Podemos ser inspiração ou ' ..
      'frustração, podemos ser heróis ou vilões, podemos ser várias coisas, pois tudo é história.',

    ['2.1'] = 'Bom dia cidadãos da nossa belíssima cidade da memória, onde memórias se tornam história. ' ..
      'Hoje será realizada a inscrição para o campeonato de jogo da memória virtual que ' ..
      'decidi realizar aqui na cidade.',
    ['2.2'] = 'As vagas são limitadas, só temos 16. Como o local é um ginásio nós teremos muito espaço para ' ..
      'assistir ao campeonato. Vocês só terão que pagar 10 cérebros para entrar e se divertir lá dentro. Mas ' ..
      'agora que temos bastante gente aqui deixa eu começar a explicar como será.',
    ['2.3'] = 'Os participantes irão se inscrever, em seguida nós faremos um sorteio e serão definidos ' ..
      'chaves de 8 jogadores. ' ..
      'De cada chave 4 se classificam para as quartas de final e todas as partidas serão definidas por sorteio. ' ..
      'Neste campeonato os jogadores irão se enfrentar um contra um. Serão 4 estilos de jogos da memória mas cada ' ..
      'estilo só vai mudar depois de cada classificação. Ou seja, é um estilo para as oitavas de final, outro para ' ..
      'as quartas de final, outro para as semifinais e outro para a final. ' ..
      'Cada estilo de jogo terá 5 níveis nos quais os jogadores irão se enfrentar. ' ..
      'Antes de cada partida será explicado melhor como funcionará como modo de jogo.',
    ['2.4'] = 'Então quem estiver interessado apareça no ginásio de memorial esportivo hoje às 10 horas ' ..
      'da manhã pois é o horário de início da inscrição e só vai até acabar as vagas. Para quem for assistir ' ..
      'ao campeonato eu começarei as inscrições de vocês as 15:00 da tarde. Ah e mais uma coisa, ' ..
      'terá uma homenagem surpresa no campeonato, garanto que pelo estilo da nossa cidade vocês irão gostar, ' ..
      'então participem, venham assistir, pois vai ser de arrepiar hehehehe!',
    ['2.5'] = 'E para finalizar os prêmios serão: O campeão vai ganhar um jogo da memória novinho, ' ..
      'um troféu, uma medalha de ouro, uma bola de basquete, uma camisa de basquete homenagem, um brinde ' ..
      'bem especial e um bom dinheiro. O segundo lugar irá ganhar uma medalha de prata, um jogo da memória ' ..
      'novo, uma bola de basquete homenagem e uma quantia razoável de dinheiro. E o terceiro lugar ganhará ' ..
      'uma medalha de bronze, um jogo da memória novo, uma camisa de basquete homenagem e uma quantia ' ..
      'menor de dinheiro. Então, chega de papo e vamos se inscrever!',

    ['3-1.1'] = 'Então, o jovem anuncia o campeonato na cidade do basquete pensante, o seu local de origem ' ..
      'e muitos ficam animados com essa inovação. Um garoto de 18 anos então se interessa e vai tentar se ' ..
      'inscrever. Ele e seu amigo Bob estavam animados para participar do campeonato e antes do ato da ' ..
      'inscrição Bob pergunta:',
    ['3-1.2'] = 'Você tem certeza que quer se inscrever? Acha que consegue vencer?',
    ['3-1.3'] = globals.playerName .. ' pensa bastante e diz:',
    ['3-1.4'] = 'Sim! Tenho certeza! Preciso aproveitar essa oportunidade para recuperar minha memória, ' ..
      'pois não lembro do que me aconteceu e porque moro com você e não com meus pais. ' ..
      'Não lembro nem se tive pais um dia.',
    ['3-1.5'] = 'Bob fica arrasado e pensa:',
    ['3-1.6'] = 'O que eu devo dizer agora? Já contei a ele várias vezes sobre a história do acidente e ele ' ..
      'não lembra. Vou ficar na minha e quando for possível, mostrarei tudo a ele.',
    ['3-1.7'] = 'Então o jovem garoto vai se inscrever, mas percebe que está sem dinheiro e então... ',

    ['3-2.1'] = 'Você tem certeza?',
    ['3-2.2'] = 'Tenho sim.',
    ['3-2.3'] = '"Será que ele vai longe? Ele consegue? Devo deixar de graça pra ele?"',
    ['3-2.4'] = 'Eita, esqueci o dinheiro, posso pagar daqui a pouco? Vou só buscar e já volto.',
    ['3-2.5'] = 'Pode, vá. Quero ver até onde chega, vou deixar você pré inscrito aqui, ' ..
      'mas não posso segurar a vaga por muito tempo.',
    ['3-2.6'] = 'Tudo bem, muito obrigado.',
    ['3-2.7'] = 'Por favor, guarde a vaga dele, é a melhor chance dele recuperar a  memória.',
    ['3-2.8'] = 'Sério? Acredita que isso irá acontecer com a participação dele no campeonato?',
    ['3-2.9'] = 'Acredito, mas quero te fazer uma proposta.',
    ['3-2.10'] = 'Qual?',
    ['3-2.11'] = 'Dificulte nossa vida no campeonato, deixe mais complicado, pois acredito que ' ..
      'quanto mais ele trabalhar a memória dele, melhor vai ser para fazer funcionar seu cérebro normalmente. ' ..
      'Ah, também queria que sempre que ele passasse por um lugar diferente do campeonato tivesse uma foto na ' ..
      'parede que o fizesse lembrar do seu passado. Eu estou com as fotos aqui, posso te entregar. ' ..
      'Você pode ampliar e coloca-las nas paredes?',
    ['3-2.12'] = 'Posso sim, farei isso por vocês.',
    ['3-2.13'] = 'Não faça por mim, faça por ele, é um grande amigo, só quero ajudá-lo.',
    ['3-2.14'] = 'Tudo bem garoto. Ele tem sorte de ter você como amigo. Posso ver as fotos?',
    ['3-2.15'] = 'Sim, claro, são da mãe dele, do pai, da casa que morava, da bola de basquete que dei ' ..
      'a ele no seu aniversário, do local do seu primeiro arremesso e de um jogador que ele é fã',
    ['3-2.16'] = 'Tudo bem garoto, vou fazer isso por ele. Mas e se ele vencer?',
    ['3-2.17'] = 'O que tem se ele vencer?',
    ['3-2.18'] = 'Não seria marmelada?',
    ['3-2.19'] = 'Não. É por isso que você vai dar um jeito de dificultar a vida de todo mundo no campeonato. ' ..
      'Não sei como, mas o gênio aqui é você.',
    ['3-2.20'] = 'Tudo bem, já sei o que fazer.',
    ['3-2.21'] = 'Certo. Agradeço muito. ',

    ['3-3.1'] = 'De repente o jovem garoto chega apressado em casa e dá um susto no pai do Bob',
    ['3-3.2'] = 'Eiiiiii! Vai pra onde tão apressado filho? O que aconteceu? Cadê o Bob?',
    ['3-3.3'] = 'Esqueci de levar o dinheiro pro campeonato e não pude me inscrever tenho que ' ..
      'ser rápido senão perco a vaga.',
    ['3-3.4'] = 'Ah, ok, pois vá logo, vai.',
    ['3-3.5'] = 'Depois de pegar o dinheiro dele e chegar na sala da casa, ele olha para o pai do Bob e ...',
    ['3-3.6'] = 'Não sei se consigo. Muitas vezes me dou mal no jogo porque não lembro aonde estão as cartas. ' ..
      'Minha memória é muito fraca',
    ['3-3.7'] = 'Filho, você vai conseguir sim, só tem que acreditar. Vou lhe dizer algo agora que ouvi ' ..
      'recentemente e achei muito interessante: é preciso se atrever a ser grande. Então vai lá e se atreva ' ..
      'a vencer, seja uma rodada, duas ou o campeonato todo, só vá. Eu, Bob e Samanta temos muito orgulho de ter ' ..
      'você conosco e com certeza teremos mais ainda depois do campeonato.',
    ['3-3.8'] = 'Nossa, obrigado tio Sam. Vocês são minha família! Tenho que ir, desculpa, fui!',
    ['3-3.9'] = 'Hahahaha! Vai lá filho, boa sorte!',
    ['3-3.10'] = 'Obrigadoooo!',

    ['3-4.1'] = 'Então o personagem principal chega no local do campeonato e diz:',
    ['3-4.2'] = 'Chegueiiiii. Está aqui o dinheiro, ainda da tempo?',
    ['3-4.3'] = 'Hehehehe, calma garoto, sua vaga está garantida.',
    ['3-4.4'] = 'Ufaa, obrigadoo!',

    ['4.1'] = 'Quando Bob e ' .. globals.playerName .. ' saem do local do campeonato, dois caras aparecem e os ' ..
      'humilham dizendo coisas ruins para eles.',
    ['4.2'] = 'Vocês estão no campeonato? Kkkkkk. Até parece que vão longe né Trevis?',
    ['4.3'] = 'Kkkkkkkkk, isso é piada? Com esse moleque sem memória aí vai ser fácil fácil vencer esse campeonato ' ..
      'hahahaha.',
    ['4.4'] = 'Vocês serão humilhados e vai ser por nós hahahha!',
    ['4.5'] = 'Boa Shad. Nós é que iremos vencer!',
    ['4.6'] = 'Em seguida eles ficam com muita raiva (principalmente Bob) e tentam revidar, mas são interrompidos ' ..
      'por duas garotas que aparecem e falam:',
    ['4.7'] = 'O que está acontecendo aqui?',
    ['4.8'] = 'Não vale a pena brigar com eles aqui. Deixem isso pro campeonato.',
    ['4.9'] = 'Não se preocupem com eles, não chegarão longe.',
    ['4.10'] = 'Quem são vocês?',
    ['4.11'] = 'Somos as garotas que vão acabar com a raça de vocês no campeonato hahaha!',
    ['4.12'] = 'Vocês? E sabem jogar? Isso não é coisa pra menininha.',
    ['4.13'] = 'Espere e verá!',
    ['4.14'] = 'Nossa, obrigado, mas pode deixar que cuidamos deles.',
    ['4.15'] = 'É, deixe comigo, por mais que minha memória seja ruim ainda, isso eu não vou esquecer.',
    ['4.16'] = 'De nada! Só viemos ajudar, afinal vocês parecem ser interessantes né melissa?',
    ['4.17'] = 'Sim, bastante.',
    ['4.18'] = 'O jovem garoto e Bob ficam todo errados e então Bob fala:',
    ['4.19'] = 'Temos que ir, nos vemos depois!',
    ['4.20'] = 'Iremos com vocês não nos deixem aqui com eles.',
    ['4.21'] = 'Podemos?',
    ['4.22'] = 'Sim, claro, vamos pra casa.',
    ['4.23'] = 'Eles então vão para a casa do Bob e antes de se despedirem Melissa diz a eles:',
    ['4.24'] = 'Tudo de negativo, pressão, desafios, é uma oportunidade para que eu me levante.',
    ['4.25'] = 'Os dois ficam abismados com isso e agradecem todo cuidado que elas tiveram e ' ..
      'se apresentam oficialmente.',
    ['4.26'] = 'Nossa, obrigado!',
    ['4.27'] = 'Uau! Belas palavras. Como é o nome de vocês mesmo?',
    ['4.28'] = 'O meu é Wind.',
    ['4.29'] = 'O meu é Melissa. E o de vocês?',
    ['4.30'] = 'O meu é ' .. globals.playerName,
    ['4.31'] = 'O meu é Bob.',
    ['4.32'] = 'Prazer em conhecê-los.',
    ['4.33'] = 'O prazer é nosso!',
    ['4.34'] = 'Depois disso elas vão embora e os dois entram em casa e vão dormir. ',




    ['5.1'] = 'No dia seguinte ' .. globals.playerName .. ' acorda e vai até a casa do Bob. ' ..
      'Eles já estão um pouco atrasados, mas ele precisava pesquisar algo sobre dor no computador e só podia ' ..
      'fazer isso na casa do Bob porque não tinha um em casa. Lá ele faz a pesquisa sobre dor e acaba encontrando a seguinte frase:',
    ['5.2'] = 'A dor não diz quando você deve parar. A dor é a vozinha em sua cabeça que tenta impedi-lo, pois sabe que, se você continuar, você irá mudar.',
    ['5.3'] = globals.playerName .. ' então ele ergue a cabeça e diz para Bob:',
    ['5.4'] = 'Vamo vencer esse campeonato meu rival!',



    ['6.1'] = 'Chegando no local do campeonato, um pouco atrasados, eles vêem o Criador prestes a começar o torneio e a plateia já está no local. ' ..
      'Os jogadores terão um computador para poder visualizar o jogo. Será dividido agora as chaves e cada jogador irá para seu lugar.',
    ['6.2'] = 'Prestem atenção, porque agora a partida está apenas começando. Este é o lugar onde a diversão começa. Que comecem os jogos!',

    ['11.1'] = 'Meu povo, hehe, o final do campeonato chegou, finalmente conhecemos o campeão, agora vamos para a cerimônia de premiação. ' ..
      'Mas antes quero revelar a vocês a homenagem que fiz aqui e olha que me surpreendi, pois andando por aí eu escutei algumas frases ' ..
      'da pessoa que estou homenageando aqui, nao tinha como ser mais incrivel esse campeonato. Dêem uma salva de palmas pra todos agora por favor!',
    ['11.2'] = 'Agora sim vou divulgar o segredo desse campeonato! Lá vai. ' ..
      'Esse jogo foi realizado não só para meu ganho pessoal, mas para homenagear uma lenda do basquete juntamente com sua filha, ' ..
      'pois eles morreram muito cedo e está muito recente também. Eu sou fã dos dois e encerro essa premiação mostrando essa imagem para vocês:',

    ['11-2.1'] = 'E também com uma frase que ele mesmo disse:  Heróis vem e vão, mas lendas são para sempre',
    ['11-2.2'] = 'Em seguida a platéia vai a loucura, os participantes também e o criador olha para o vencedor e diz:',
    ['11-2.3'] = 'Haverá um campeonato maior que esse na cidade cérebro, e você como foi campeão tem o direito de participar sem ' ..
      'se inscrever porque você já está dentro dele e na fase de grupos, sem precisar passar do primeiro mata-mata.',
    ['11-2.4'] = 'Fico muito feliz por isso e agradeço a você e à todos que me ajudaram aqui e também quero dizer que sou fã ' ..
      'do Kobe e sua filha e muitas das frases que ele falou durante sua vida me inspiraram a estar aqui hoje. ' ..
      'Parabéns pelo seu trabalho e mais uma vez obrigado.',

    credits = 'Eles se tornaram inspiração para muitas pessoas nessa vida e deixaram um bom exemplo para nós.' ..
      '\nFaça como eles, seja uma Lenda.' ..
      '\nSua memória é o que você pode deixar de melhor para as pessoas depois de partir pois você é responsável por como as pessoas se lembram de você.' ..
      '\nEntão, qual será a memória que os outros irão ter de você?' ..
      '\n#Lendasnuncamorrem' ..
      '\n\nFim',
  }
end

function dictionary.localize(word)
  if globals.language == 'english' then
    return getEnglishDict()[word]
  else
    return getPortugueseDict()[word]
  end
end

return dictionary;
