local dictionary = {}

local english = {
  -- characters
  Narrador = 'Narrator',
  Criador = 'Creator',

  -- words
  e = 'and',

  -- menus
  StartGame = 'Start Game',
  Settings = 'Settings',
  Exit = 'Exit',
  ToggleFullscreen = 'Toggle Fullscreen',
  ChooseLanguage = 'Choose language',
  GoBack = 'Go back',
  ['type your name'] = 'type your name',
  ['press enter to continue'] = 'press enter to continue',
  ['choose your name:'] = 'choose your name:',
  ['Choose your language'] = 'Choose your language',

  -- cutScenes
  ['1.1'] = 'Hello ',
  ['1.2'] = "Memory!--It's what's left when we go. We can be hero or villain we can be many things because everything is history.",

  ['2.1'] = '2.1',
  ['2.2'] = '2.2',
  ['2.3'] = '2.3',
  ['2.4'] = '2.4',
  ['2.5'] = '2.5',
  ['2.6'] = '2.6',
  ['2.7'] = '2.7',

  ['3.1'] = '3.1',
  ['3.2'] = '3.2',
  ['3.3'] = '3.3',

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

local portuguese = {
  -- characters
  Narrador = 'Narrador',
  Criador = 'Criador',

  -- words
  e = 'e',

  -- menus
  StartGame = 'Começar jogo',
  Settings = 'Configurações',
  Exit = 'Sair',
  ToggleFullscreen = 'Alternar tela cheia',
  ChooseLanguage = 'Escolher língua',
  GoBack = 'Voltar',
  ['type your name'] = 'digite seu nome',
  ['press enter to continue'] = 'aperte enter para continuar',
  ['choose your name:'] = 'escolha seu nome:',
  ['Choose your language'] = 'Escolha sua língua',

  -- cutScenes
  ['1.1'] = 'Olá ',
  ['1.2'] = 'Memória!--É o que podemos deixar de melhor ou pior quando partimos. Podemos ser inspiração ou frustração, podemos ser heróis ou vilões, podemos ser várias coisas, pois tudo é história.',

  ['2.1'] = 'Senhoras e senhores, estamos próximos de começar um excelente campeonato de jogo da memória, mas esse está relacionado ao basquete. ' ..
    'Todas as cartas e modos de jogo vão estar ligadas ao basquete, irá ocorrer uma homenagem aqui, mas vocês terão que descobrir durante o torneio ' ..
    'hehehe! O campeonato será realizado da seguinte forma: nós teremos 16 participantes e já começaremos nas oitavas de final de final.',
  ['2.2'] = 'Cada participante terá três chances em cada modo de jogo. ' ..
    'Os modos de jogo serão dois, o jogo de memória clássico e o que você vê por um curto período de tempo e ' ..
    'em seguida você terá que lembrar onde estão as cartas iguais. E o melhor disso tudo é que tudo vai estar relacionado ao basquete hahaha!',
  ['2.3'] = 'Teremos tempo no jogo e alguns critérios de pontuação para os participantes. Um deles será passar dos níveis dos modos do jogo em menos tempo, ' ..
    'passar de cada modo e seus níveis sem perder nenhuma chance, perdendo só uma chance, perdendo duas chances. Cada uma terá uma certa pontuação. ' ..
    'Mas se perder todas as três chances o jogador será desclassificado. Cada jogador tem que ir até o fim e fazer a melhor pontuação possível.',
  ['2.4'] = 'Dos 16 participantes irão passar 8. Em seguidas iremos paras as quartas de final, depois semifinal com 4 e a final com 2 participante e em fim ' ..
    'terminamos.',
  ['2.5'] = 'A premiação será: o terceiro lugar ganhará uma medalha de bronze, um jogo da memória novo, uma camisa de basquete e uma quantia ' ..
    'mínima de dinheiro (200R$). O segundo lugar irá ganhar a medalha de prata, um jogo da memória novo, uma bola de basquete e uma quantia razoável ' ..
    'em dinheiro(500R$).',
  ['2.6'] = 'O campeão vai ganhar um jogo da memória novinho, um troféu, uma medalha de ouro, uma bola de basquete, uma camisa de basquete, ' ..
    'um brinde bem especial e um bom dinheiro(1000R$).',
  ['2.7'] = 'E vocês irão assistir isso tudo em um telão! Só não vale assoprar para os participantes em, ' ..
     'eu estarei de olho, porque se não eles serão desclassificados hahahaha! Então, Quem quer se inscrever?',

  ['3.1'] = playerName .. ' então vai até sua casa e quando ele pega o dinheiro, ele para e senta no sofá de sua casa e pensa se devia fazer isso ou não. ' ..
    'Ele então muito pensativo recebe a visita de seu melhor amigo (Bob) que o viu chegando às pressas em sua casa. ' ..
    'Eles conversam rapidamente e Bob diz pra ele:',
  ['3.2'] = 'Vamos, é preciso se atrever para ser grande.',
  ['3.3'] = 'De onde ele tirou isso?',

  ['4.1'] = 'Quando Bob e ' .. playerName .. ' saem do local do campeonato, dois caras aparecem e os humilham dizendo coisas ruins para eles.',
  ['4.2'] = 'Vocês não vão vencer, vão ser humilhados, nós vamos acabar com vocês, como é que pode um campeonato ' ..
    'desse deixar dois zé ninguém participar, vocês não são de nada, vão perder feio hahahaha',
  ['4.3'] = 'Ambos ficam com muita raiva e tentam partir para cima, mas duas garotas aparecem e os salvam dos dois babacas que estavam humilhando eles. ' ..
    'Elas os levam até a casa de ' .. playerName .. ' e conversam com eles. Uma delas (Melissa) diz:',
  ['4.4'] = 'Tudo de negativo, pressão, desafios, é uma oportunidade para que eu me levante.',
  ['4.5'] = 'Os dois ficam abismados com isso e agradecem todo cuidado que elas tiveram e então se conhecem.',
  ['4.6'] = 'Quem são vocês, como são seus nomes?',
  ['4.7'] = 'Eu sou Melissa.',
  ['4.8'] = 'Eu sou Windy e vocês?',
  ['4.9'] = 'Eu sou Bob',
  ['4.10'] = 'Eu sou ' .. playerName,
  ['4.11'] = 'Após conversar um pouco elas vão embora',
  ['4.12'] = 'Até logo!',
  ['4.13'] = 'Bob vai para sua casa e ' .. playerName .. ' vai dormir.',

  ['5.1'] = 'No dia seguinte ' .. playerName .. ' acorda e vai até a casa do Bob. ' ..
    'Eles já estão um pouco atrasados, mas ele precisava pesquisar algo sobre dor no computador e só podia ' ..
    'fazer isso na casa do Bob porque não tinha um em casa. Lá ele faz a pesquisa sobre dor e acaba encontrando a seguinte frase:',
  ['5.2'] = 'A dor não diz quando você deve parar. A dor é a vozinha em sua cabeça que tenta impedi-lo, pois sabe que, se você continuar, você irá mudar.',
  ['5.3'] = playerName .. ' então ele ergue a cabeça e diz para Bob:',
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

function dictionary.localize(word)
  if language == 'english' then
    return english[word]
  else
    return portuguese[word]
  end
end

return dictionary;
