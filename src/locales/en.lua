local globals = require 'src/common/globals'


local function locales()
  return {
    -- characters
    Narrador = 'Narrator',
    Criador = 'Creator',

    -- words
    e = 'and',

    -- menus
    Go = 'Go',
    CustomStage = 'Custom Level',
    Restart = 'Restart',
    Paused = 'Paused',
    StartGame = 'Start Game',
    Settings = 'Settings',
    StageSelection = 'Levels',
    ExitToMenu = 'Menu',
    ExitGame = 'Quit',
    ToggleFullscreen = 'Fullscreen',
    ChooseLanguage = 'Language',
    GoBack = 'Resume',
    ['Next Level'] = 'Next Level',
    ['You Won'] = 'You Won',
    ['Game Over'] = 'Game Over',
    ['Get prepared'] = 'Get prepared',
    ['type your name'] = 'type your name',
    ['press enter to continue'] = 'press enter to continue',
    ['choose your name:'] = 'choose your name:',
    ['Choose your language'] = 'Choose your language',
    ['total time:'] = 'total time:',
    ['number of tries:'] = 'number of tries:',
    ['errors discount time ?:'] = 'errors discount time ?:',
    ['show cards before starting ?:'] = 'show cards before starting ?:',

    -- gameplay
    ['Infinite tries'] = 'Infinite tries',
    ['Tries left'] = 'Tries left',
    ['Time left'] = 'Time left',
    Score = 'Score',
    Missed = 'Missed',

    -- cutScenes
    ['1.1'] = 'Hello ' .. globals.playerName .. '!',

    ['1.2'] = 'Memory!--It\'s what we can leave for better or worse when we leave. We can be inspiration or frustration, we can be heroes or villains, we can be many things, because everything is history.',

    ['2.1'] = 'Good morning citizens of our beautiful city Cérebro, where memories become history. Today there will be registration for the virtual memory game championship that I decided to hold here at the city.',
    ['2.2'] = 'Slots are limited, we only have 16. As the venue is a gym, we will have plenty of space to watch the championship. You\'ll only have to pay 10 cérebros to get in and have fun in there. But now that we have a lot of people here, let me start to explain what it will be like.',
    ['2.3'] = 'Participants will register, then we will make a draw to decide the brackets for the 16 players. In this championship, players will face off one against another in a death match.',
    ['2.4'] = 'There will be 4 styles of memory games but each style will only change after each classification. In other words, it is a style for the round of 16, another for the quarterfinals, another for the semifinals and another for the final. Each style of play will have 5 levels in which players will face off. Before each match it will be explained better how it will work as a game mode.',
    ['2.5'] = 'So whoever is interested, show up at the sports memorial gym today at 10 am as it\'s the start time for registration and it\'s only going to run out. Oh and one more thing, there will be a surprise tribute in the championship, I guarantee that because of the style of our city you will like it, so participate, come and watch, it will be awesome hehehehe!',
    ['2.6'] = 'Finally, the prizes will be: The champion will win a brand new memory game, a trophy, a gold medal, a basketball, a basketball jersey, a very special gift and good money. Second place will win a silver medal, a new memory game, a homage basketball and a fair amount of money.',
    ['2.7'] = 'And third place will win a bronze medal, a new memory game, a homage basketball jersey and a smaller amount of money.\nSo enough of chat and let\'s sign up!',

    ['3-1.1'] = 'Therefore, the young man announced the championship in the city of thinking basketball, his place of origin, and many are excited by this innovation. An 18-year-old boy then becomes interested and will try to apply. He and his friend Bob were excited to participate in the championship and before the registration act Bob asks:',
    ['3-1.2'] = 'Are you sure you want to sign up? Think you can win?',
    ['3-1.3'] = globals.playerName .. ' thinks a lot and says:',
    ['3-1.4'] = 'Yes! I am sure! I need to take this opportunity to recover my memory, because I don\'t remember what happened to me and because I live with you and not my parents. I don\'t even remember if I ever had parents.',
    ['3-1.5'] = 'Bob is devastated and thinks:',
    ['3-1.6'] = '"What am I supposed to say now? I\'ve told him several times about the accident story and he doesn\'t remember. I\'ll keep it to me and when possible, I\'ll show him everything."',
    ['3-1.7'] = 'So the young boy goes to apply, but realizes he\'s out of money ...',

    ['3-2.1'] = 'Are you sure?',
    ['3-2.2'] = 'Yes i am.',
    ['3-2.3'] = '"Does he go far? Can he? Should I leave it free for him?"',
    ['3-2.4'] = 'Jeez, I forgot the money, can I pay it back in a little while? I\'ll just get it and I\'ll be right back.',
    ['3-2.5'] = 'Yes, go. I want to see how far you can go, I\'ll let you pre-registered here, but I can\'t hold the vacancy for too long.',
    ['3-2.6'] = 'All good thank you so much.',
    ['3-2.6-1'] = 'While the young boy runs to get the money, Bob talks to the Creator ...',
    ['3-2.7'] = 'Please save his spot, it\'s his best chance to regain his memory.',
    ['3-2.8'] = 'Seriously? Do you believe this will happen with his participation in the championship?',
    ['3-2.9'] = 'I believe, but I want to make you a proposal.',
    ['3-2.10'] = 'Which?',
    ['3-2.11'] = 'Make it difficult for us in the championship, because I believe that the more he works on his memory, the better it will be to make his brain work normally. Oh, I also wish that whenever he passes through a different place in the championship, to have a picture on the wall that reminds him of his past. I have the photos here, I can give it to you. Could you enlarge and put them on the walls?',
    ['3-2.12'] = 'Yes I can, I will do it for you.',
    ['3-2.13'] = 'Don\'t do it for me, do it for him, he\'s a great friend, I just want to help him.',
    ['3-2.14'] = 'Alright boy. He\'s lucky to have you as a friend. Can I see the photos?',
    ['3-2.15'] = 'Yes, of course, they are from his mother, father, the house he used to live in, the basketball I gave him for his birthday, the location of his first basketball throw and a player he is a fan',
    ['3-2.16'] = 'Alright boy, I\'ll do this for him. But what if he wins?',
    ['3-2.17'] = 'What if he wins?',
    ['3-2.18'] = 'Wouldn\'t that be unfair?',
    ['3-2.19'] = 'No. That\'s why you\'re going to find a way to make life difficult for everyone in the championship. I don\'t know how, but the genius here is you.',
    ['3-2.20'] = 'All right, I know what to do.',
    ['3-2.21'] = 'Right. Thank you very much.',

    ['3-3.1'] = 'De repente o jovem garoto chega apressado em casa e dá um susto no pai do Bob',
    ['3-3.2'] = 'Eiiiiii! Vai pra onde tão apressado filho? O que aconteceu? Cadê o Bob?',
    ['3-3.3'] = 'Esqueci de levar o dinheiro pro campeonato e não pude me inscrever tenho que ser rápido senão perco a vaga.',
    ['3-3.4'] = 'Ah, ok, pois vá logo, vai.',
    ['3-3.5'] = 'Depois de pegar o dinheiro dele e chegar na sala da casa, ele olha para o pai do Bob e ...',
    ['3-3.6'] = 'Não sei se consigo. Muitas vezes me dou mal no jogo porque não lembro aonde estão as cartas. Minha memória é muito fraca',
    ['3-3.7'] = 'Filho, você vai conseguir sim, só tem que acreditar. Vou lhe dizer algo agora que ouvi recentemente e achei muito interessante: é preciso se atrever a ser grande. Então vai lá e se atreva a vencer, seja uma rodada, duas ou o campeonato todo, só vá. Eu, Bob e Samanta temos muito orgulho de ter você conosco e com certeza teremos mais ainda depois do campeonato.',
    ['3-3.8'] = 'Nossa, obrigado tio Sam. Vocês são minha família! Tenho que ir, desculpa, fui!',
    ['3-3.9'] = 'Hahahaha! Vai lá filho, boa sorte!',
    ['3-3.10'] = 'Obrigadoooo!',

    ['3-4.1'] = 'Então o personagem principal chega no local do campeonato e diz:',
    ['3-4.2'] = 'Chegueiiiii. Está aqui o dinheiro, ainda da tempo?',
    ['3-4.3'] = 'Hehehehe, calma garoto, sua vaga está garantida.',
    ['3-4.4'] = 'Ufaa, obrigadoo!',
    ['3-4.5'] = 'Quer mesmo se inscrever?',

    ['4.1'] = 'Quando Bob e ' .. globals.playerName .. ' saem do local do campeonato, dois caras aparecem e os humilham dizendo coisas ruins para eles.',
    ['4.2'] = 'Vocês estão no campeonato? Kkkkkk. Até parece que vão longe né Trevis?',
    ['4.3'] = 'Kkkkkkkkk, isso é piada? Com esse moleque sem memória aí vai ser fácil fácil vencer esse campeonato hahahaha.',
    ['4.4'] = 'Vocês serão humilhados e vai ser por nós hahahha!',
    ['4.5'] = 'Boa Shad. Nós é que iremos vencer!',
    ['4.6'] = 'Em seguida eles ficam com muita raiva (principalmente Bob) e tentam revidar, mas são interrompidos por duas garotas que aparecem e falam:',
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
    ['4.25'] = 'Os dois ficam abismados com isso e agradecem todo cuidado que elas tiveram e se apresentam oficialmente.',
    ['4.26'] = 'Nossa, obrigado!',
    ['4.27'] = 'Uau! Belas palavras. Como é o nome de vocês mesmo?',
    ['4.28'] = 'O meu é Wind.',
    ['4.29'] = 'O meu é Melissa. E o de vocês?',
    ['4.30'] = 'O meu é ' .. globals.playerName,
    ['4.31'] = 'O meu é Bob.',
    ['4.32'] = 'Prazer em conhecê-los.',
    ['4.33'] = 'O prazer é nosso!',
    ['4.34'] = 'Depois disso elas vão embora e os dois entram em casa e vão dormir. ',

    ['5-1.1'] = 'Quando o dia do campeonato chega, o jovem garoto já está um pouco melhor do que tinhaacontecido, mas ainda estava com um pouco de raiva e se sentindo estranho, como se tivesse doídobastante o que aqueles garotos disseram, e o pior é que ele e Bob iam encontrá-los de novo.',
    ['5-1.2'] = 'Mas antes de sair eles fizeram uma pesquisa no computador do Bob sobre dor e acharamuma frase interessante a qual dizia:',
    ['5-1.3'] = 'A dor não diz quando você deve parar. A dor é a vozinha em sua cabeça que tentaimpedí-lo, pois sabe que, se você continuar, você irá mudar.',
    ['5-1.4'] = 'Eles então erguem a cabeça e olham um para o outro e ' .. globals.playerName .. ' diz:',
    ['5-1.5'] = 'Vamos vencer esse campeonato meu rival!',
    ['5-1.6'] = 'Você sabe que só um vence né, e serei eu! Hahahah!',
    ['5-1.7'] = 'hehehe! Eu não vou perder pra você!',
    ['5-1.8'] = 'Em seguida ambos vão até o local do campeonato.',

    ['5-2.1'] = 'Chegando lá o Criador vai estar prestes a começar, a plateia já está no local, o jogo será transmitido em um telão para a plateia e os jogadores terão um computador para poder visualizar o jogo.',
    ['5-2.2'] = 'Depois de todos os participantes chegarem eles irão ser divididos em chaves e em seguida o criador os mandará para seus lugares. Quando estiverem todos em seus lugares o criador irá falar para todos:',
    ['5-2.3'] = 'A partida? Está apenas começando. Este é o lugar onde a diversão começa. Que comecem os jogos!',

    ['6.1'] = 'Início das Quartas de Final. Os participantes que nela estão são: ' .. globals.playerName .. ', Bob, Wind, Melissa, Shad, Travis, Jake e Blake.',
    ['6.2'] = 'Neste momento, Shad e Travis irão se vingar das garotas e começam a xingá-las, dizendo:',
    ['6.3'] = 'Ei vocês duas, tiveram sorte, mas podem ter certeza que vamos humilhar vocês se nos enfrentarmos. Hahaha',
    ['6.4'] = 'Pode vir seu louco, estamos preparadas.',
    ['6.5'] = 'Pra quê? Para serem humilhadas?  Hahaha , vocês são umas fracassadas, não sabem nem jogar, esses que perderam pra vocês deviam ser muito ruins mesmo, se nos enfrentarmos nós acabaremos com vocês suas ...',
    ['6.6'] = 'Melissa começa a ficar com raiva e ao mesmo tempo chateada e fala:',
    ['6.7'] = 'Vocês vão pagar seus chatos, ahhhhh! Vamos sair daqui Wind.',
    ['6.8'] = 'Wind começa a chorar junto com Melissa e quando estão saindo se deparam com ' .. globals.playerName .. ' e Bob, então eles perguntam:',
    ['6.9'] = 'O que aconteceu?',
    ['6.10'] = 'Wind e Melissa não respondem mas apontam para Shad e Travis.',
    ['6.11'] = 'Ahhhh, seus .... Não se preocupem meninas, nós iremos vencê-los e mudaremos essa situação, não importa o que eles disseram, não acreditem.',
    ['6.12'] = 'É, prestem atenção as duas. Quando você conhece a sensação de fracasso, a determinação persegue o sucesso. Então não desistam, estamos com vocês.',
    ['6.13'] = 'Em seguidas elas se aliviam um pouco, mas recebem uma má notícia.',
    ['6.14'] = 'O sorteio vai começar, vamos ver quem vamos enfrentar, estou doido pra acabar com a raça daqueles dois.',
    ['6.15'] = 'Calma aí rapaz, só dá pra enfrentar um, vamos ver no que dá, porque também estou doido pra acabar com eles.',
    ['6.16'] = 'O sorteio então acontece e vem à má notícia para as meninas. Shad e Travis irão enfrentá-las nas quartas de final. Será Shad vs Melissa e Travis vs Windy.',
    ['6.17'] = 'Mas as meninas vencem. Depois da vitória, elas agradecem a cada um (' .. globals.playerName .. ' e Bob) com um beijo no rosto.',

    ['7.1'] = 'Depois da vitória das garotas, Shad e Travis ficam muito abalados, mas são consolados por ' .. globals.playerName .. ', que mesmo tendo sofrido algumas coisas ruins com eles e tendo visto o que eles fizeram com as garotas, resolve perdoá-los e os encoraja a erguerem a cabeça.',
    ['7.2'] = 'Não fiquem assim, vocês podem melhorar, se sairão melhor na próxima vez, são bons jogadores, só precisam melhorar como pessoas.',
    ['7.3'] = 'Porém eles não dão ouvidos e saem com raiva dizendo:',
    ['7.4'] = 'Não precisamos da sua ajuda, quem você pensa que é?',
    ['7.5'] = 'Só sou alguém que tenta ser o melhor para todo mundo, até pra vocês que nem merecem.',
    ['7.6'] = 'Cala a boca, você não é ninguém, você não tem nada e não vai vencer esse campeonato.',
    ['7.7'] = 'É num vai vencer não!',
    ['7.8'] = 'É o que vamos ver.',
    ['7.9'] = 'E assim ele sai do local e vai ao encontro das garotas parabenizá-las pela vitória.',

    ['8-1.1'] = globals.playerName .. ' e Bob enfrentam Jake e Blake.',
    ['8-1.2'] = 'Agora é a nossa vez, não vai perder!',
    ['8-1.3'] = 'Humm, claro que não vou, quero te enfrentar na final!',

    ['8-2.1'] = 'E depois que termina essa disputa, aparece o Bob vencendo também.',
    ['8-2.2'] = 'Então um olha para o outro e fazem um sinal de que mostra que eles conseguiram.',
    ['8-2.3'] = 'Em seguida ocorre outro sorteio para as semifinais, e a disputa fica entre ' .. globals.playerName ..  ' vs Windy e Bob vs Melissa.',

    ['9.1'] = 'Depois do sorteio, Bob e Melissa se enfrentam, mas antes há uma pequena conversa entre os dois e Bob começa falando:',
    ['9.2'] = 'Saiba de uma coisa melissa, eu estou gostando de você, mas é minha rival agora. Não vou perder, treinei muito para estar aqui.',
    ['9.3'] = 'Eu também Bob. Digo o mesmo, porém acrescento que estou sempre no meu limite. Eu tomei todos os meus treinos e jogos como se fosse o último, então pode ter certeza que estou mais que preparada para enfrentá-lo.',
    ['9.4'] = 'Uau! Agora gosto mais ainda de você. Bom jogo!',
    ['9.5'] = 'Melissa dá um sorriso e diz:',
    ['9.6'] = 'Bom jogo fofinho.',
    ['9.7'] = 'Bob fica todo errado e vai para seu lugar e melissa também.',

    ['10.1'] = 'Em seguida a história se volta para ' .. globals.playerName .. ' e Windy. Eles estão conversando antes de sua vez chegar, então Windy fala:',
    ['10.2'] = 'Quem é você? Existe algo diferente em você. Como conseguiu perdoar aqueles chatos? Ainda estou com muita raiva deles.',
    ['10.3'] = 'Mesmo com minhas dificuldades eu tento inspirar as pessoas a serem excelentes no que querem fazer, só isso. Não foi fácil perdoá-los, mas foi melhor do que guardar rancor deles, além do mais, não vou sair por aí andando com eles, porém também não os quero como meus inimigos, nem eles, nem ninguém. Temos que fazer o melhor pelos outros por mais difícil que às vezes seja.',
    ['10.4'] = 'Uau! Que bela resposta. Aprendeu isso aonde?',
    ['10.5'] = 'Com um grande esportista que não tive a oportunidade de vê-lo jogar tanto em sua época, mas que me inspirou muito a estar aqui. E também, é o meu jeito de ser. Faz uma fusão disso tudo e fica bem melhor. Hehehe.',
    ['10.6'] = 'Nossa, sério? Gostei, muito interessante, estou começando a gostar de você. Mas quem foi esse esportista?',
    ['10.7'] = 'Nessa hora soa o gongo e eles são chamados para começar a partida. Então ' .. globals.playerName .. ' diz:',
    ['10.8'] = 'Só agora está gostando de mim? Sério? Hummm... Eu digo o mesmo. Hahaha. Quanto ao jogador, não posso te dizer quem é agora, mas tem algo acontecendo aqui para que a gente descubra. Enfim, bom Jogo!',
    ['10.9'] = 'Bom Jogo!',
    ['10.10'] = 'Os dois saem com sorrisos nos rostos e vão para seus lugares.',

    ['11.1'] = 'Depois de vencer a partida ' .. globals.playerName .. ' vai ao encontro de Bob e diz:',
    ['11.2'] = 'Cumpriu a promessa né, agora é a hora da verdade.',
    ['11.3'] = 'Mas é claro, porém foi bastante difícil, essa garota além de linda é uma belíssima jogadora. Mas agora é hora de saber quem é o melhor no momento.',
    ['11.4'] = 'Digo o mesmo, Windy foi demais, foi muito difícil vencer também, mas agora vamos para o que interessa, boa sorte mano!',
    ['11.5'] = 'Boa sorte mano!',
    ['11.6'] = 'Em seguida soa o gongo e eles vão para os seus lugares. Mas antes de começar o jogo o Criador fala:',
    ['11.7'] = 'Senhoras e senhores, temos aqui os nossos finalistas, e olha só, os dois melhores amigos da cidade vão agora se enfrentar, o que será que vai acontecer? E ' .. globals.playerName .. ', eu lhe digo uma coisa, vê essas fotos que estão espalhadas por aqui?',
    ['11.8'] = 'Sim, desde que chegamos, me perguntei o campeonato inteiro o porquê disso, mas fiquei feliz pois me ajuda a lembrar um pouco do meu passado.',
    ['11.9'] = 'Foi o seu amigo aí que me deu pra eu colocá-las aqui, você tem sorte de tê-lo como amigo.',
    ['11.10'] = 'Amigo? Não, ele é um irmão.',
    ['11.11'] = 'Bob fica emocionado, mas se segura e diz:',
    ['11.12'] = 'Vamos deixar isso pra depois? Está na hora de eu te vencer.',
    ['11.13'] = 'Hahahaha! Na hora! Vamo nessa!',
    ['11.14'] = 'Chegou a hora pessoal, vamos apreciar mais uma bela jogatina de jogo da memória com esses dois aqui! Boa sorte para vocês. Que os jogos comecem!',

    ['12.1'] = 'Depois de vencer o campeonato ' .. globals.playerName .. ' chega para Bob e diz:',
    ['12.2'] = 'Obrigado por ter cumprido a promessa e pelas fotos que colocou aqui, me ajudou a lembrar que  você desde sempre foi mais que uma amigo pra mim, e seus pais são como se fossem os meus. Mas você sabe dizer se os meus pais ainda estão vivos?',
    ['12.3'] = 'Fico feliz que tenha gostado, e você é também um irmão pra mim, e sinceramente eu não sei, mas podemos procurar saber, Você e seus pais se separaram depois do acidente e eu e meus pais ainda não conseguimos achá-los. Já te falamos, mas acho que você não lembra.',
    ['12.4'] = 'É, não lembro muito bem, mas obrigado. Pelo menos agora eu lembro deles especificamente, principalmente com essa foto do acidente.',
    ['12.5'] = 'Nossa, sinto muito, mas nós vamos achá-los. Eu prometo.',
    ['12.6'] = 'Muito obrigado irmão.',
    ['12.7'] = 'Os dois então dão as mãos e sorriem um para o outro e Bob fala:',
    ['12.8'] = 'Vamos para a cerimônia de premiação, está na hora.',
    ['12.9'] = 'Simbora!',

    ['13-1.1'] = 'Senhoras e Senhores, o que foi esse campeonato ein? Me digam, não foi uma loucura? E olha, esses quatro últimos competidores, minha nossa, são de tirar o fôlego, parabéns a todos vocês. Agora, deixa eu explicar uma coisa, esse jogo foi realizado não só para meu ganho pessoal, mas para homenagear uma lenda do basquete juntamente com sua filha, pois eles morreram muito cedo e está muito recente também.',
    ['13-1.2'] = 'Eu sou fã dos dois e encerro essa premiação mostrando essa imagem para vocês. Heróis vem e vão, mas lendas são para sempre.',

    ['13-2.1'] = 'A plateia vai a loucura, os participantes também, e o criador olha para o vencedor e diz:',
    ['13-2.2'] = 'Haverá um campeonato maior que esse na cidade cérebro, e você como foi campeão tem o direito de participar sem se inscrever porque você já está dentro dele, mas precisa passar pelo desafio dos selos antes, porém você já começa com um.',
    ['13-2.3'] = 'Annnhh??? Como assim?',
    ['13-2.4'] = 'Esse é o brinde especial, um selo deste campeonato e assim você já começa na frente dos outros participantes.',
    ['13-2.5'] = 'Sério???? Não acredito!!! Uhuuuuuu!',
    ['13-2.6'] = 'Hehehe, parabéns garoto e a propósito, eu vi a sua conversa com seu amigo e acredito que seus pais podem estar na cidade cérebro, pois lá é um lugar onde pessoas que perderam a memória totalmente ou parte dela são enviadas e tratadas.',
    ['13-2.7'] = 'Isso é verdade?',
    ['13-2.8'] = 'Calma, é só um palpite, então não crie muitas esperanças.',
    ['13-2.9'] = 'Ai caramba, blz, pode deixar, mas obrigado, me ajudou bastante. Bob, faz as malas que vamos viajar!',
    ['13-2.10'] = 'Mas é claro, tô dentro, vamo nessa.',
    ['13-2.11'] = 'Windy e Melissa que estavam na premiação também falam.',
    ['13-2.12'] = 'Como vocês irão para lá?',
    ['13-2.13'] = 'Sem nós vocês não vão.',
    ['13-2.14'] = 'Não é de avião que vamos?',
    ['13-2.15'] = 'kkkkk! Bobinho, não dá pra ir de avião. A cidade cérebro fica numa ilha, ao redor de várias outras, então temos que ir de Navio.',
    ['13-2.16'] = 'Vixe, e agora, como iremos? Não temos dinheiro para pagar a passagem.',
    ['13-2.17'] = 'E esse dinheiro do campeonato?',
    ['13-2.18'] = 'É mais que o suficiente para vocês. Mas não se preocupem, eu tenho aqui quatro passagens para vocês, usem-as e nos veremos lá.',
    ['13-2.19'] = 'Como assim? Sério?',
    ['13-2.20'] = 'E eu to com cara de quem ta brincando, não perguntem e vão logo. Vocês merecem. Mas antes peguem isso.',
    ['13-2.21'] = 'Aqui o segundo, terceiro e quarto lugar recebem suas premiações e em seguida ' .. globals.playerName .. ' recebe o troféu de campeão, levanta ele, a plateia vai a loucura, aplaudem a todos e é mostrado que a mãe e pai do Bob estão lá assistindo também.',
    ['13-2.22'] = 'Em seguida a cerimônia de premiação termina e começa a homenagem ao Kobe e a Gianna com os quatro vestidos com as camisas do Kobe e da Gianna Bryant',

    credits = 'Eles se tornaram inspiração para muitas pessoas nessa vida e deixaram um bom exemplo para nós.' ..
      '\nFaça como eles, seja uma Lenda.' ..
      '\nSua memória é o que você pode deixar de melhor para as pessoas depois de partir pois você é responsável ' ..
        'por como as pessoas se lembram de você.' ..
      '\nEntão, qual será a memória que os outros irão ter de você?' ..
      '\n#Lendasnuncamorrem' ..
      '\n\nFim',
  }
end

return {
  locales = locales
}