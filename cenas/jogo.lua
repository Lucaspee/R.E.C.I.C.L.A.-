local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaJogo = self.view

  -- VARIAVEIS DE POSICIOMENTO
  local x = display.contentWidth
  local y = display.contentHeight

  -- DECLARACAO DOS GRUPOS (CAMADAS)
  local grupoFundo = display.newGroup()
  local grupoUm = display.newGroup()
  local grupoDois = display.newGroup()
  local grupoTres= display.newGroup()
  local grupoQuatro = display.newGroup()
  local grupoCinco = display.newGroup()
  local grupoSeis = display.newGroup()
  local grupoSete=display.newGroup()
  local grupoOito=display.newGroup()
  local grupoNove=display.newGroup()
  local grupoDez=display.newGroup()
  local grupoTela = display.newGroup()
  local grupoDerrota = display.newGroup()
  local grupoVitoria = display.newGroup()

  cenaJogo:insert( grupoFundo )
  cenaJogo:insert( grupoUm )
  cenaJogo:insert( grupoDois )
  cenaJogo:insert( grupoTres)
  cenaJogo:insert( grupoQuatro )
  cenaJogo:insert( grupoCinco )
  cenaJogo:insert( grupoSeis )
  cenaJogo:insert( grupoSete )
  cenaJogo:insert( grupoOito )
  cenaJogo:insert( grupoNove )
  cenaJogo:insert( grupoDez )
  cenaJogo:insert( grupoTela )
  cenaJogo:insert( grupoDerrota )
  cenaJogo:insert( grupoVitoria )

  local foto = display.newImageRect(cenaJogo, 'recursos/imagens/reciclagem.png', x*0.35, y*0.15 )
  foto.x = x*0.5
  foto.y = y*0.13

  -- DECLARACAO DAS PERGUNTAS

  -- Resposta: c) Lixeira verde.
  local pergunta = {
    um= {
      p1={'1 - Qual a cor de lixeira que se\n refere ao descarte de vidros?'  },
      respostas = { 'A) Lixeira azul', 'B) Lixeira amarela', 'C) Lixeira Verde' }
    },

    -- Resposta: b) Separar e coletar materiais recicláveis específicos.
    dois = {
      p1={'2 - O que significa o termo\n"coleta seletiva"?'  },
      respostas = {'A) Coletar resíduos de maneira\naleatória', 'B) Separar e coletar materiais\nrecicláveis específicos', 'C) Coletar apenas resíduos\norgânicos'},
    },

    -- Resposta: b) Liberação de substâncias tóxicas no solo e na água.
    tres = {
      p1={'3 - Qual é um dos principais\nproblemas causados pelo descarte\ninadequado de resíduos eletrônicos?'  },
      respostas = {'A) Diminuição da demanda\npor eletrônicos novos', 'B) Liberação de substâncias\ntóxicas no solo e na água', 'C) Aumento da durabilidade\ndos eletrônicos'}
    },

    -- Resposta: b) Processo de decomposição de resíduos orgânicos em material fertilizante.
    quatro = {
      p1={'4 - O que é compostagem?'  },
      respostas = {'A) Processo de transformar\nplástico em energia', 'B) Decomposição de resíduos\nem material fertilizante', 'C) Processo de reciclagem\nde papel'}
    },

    --Resposta: a) De 200 a 500 anos
    cinco = {
       p1={'5 - Quanto tempo demora uma lata\nde alumínio para se decompor?'  },
       respostas = {'A) De 200 a 500 anos', 'B) De 20 a 40 anos', 'C) De 7 a 60 anos'}
    }, 
    -- Resposta: a) Papel.
    seis= {
       p1={'6 - Qual é um exemplo de material\nbiodegradável que pode ser\nreciclado por meio da compostagem?'  },
       respostas = {'A) Papel', 'B) Plástico PET', 'C) Isopor (EPS)'}
    }, 
    -- Resposta: b) Criação de empregos na indústria de reciclagem.
    sete = {
       p1={'7 - Além de reduzir o desperdício,\nqual é outro benefício social \nda reciclagem?'  },
       respostas = {'A) Aumento dos custos\nde produção', 'B) Criação de empregos na\nindústria de reciclagem', 'C) Diminuição da\nconscientização ambiental.'}
    }, 
    -- Resposta: a) Azul.
    oito = {
       p1={'8 - Qual é a cor de uma lixeira\nnormalmente associada à reciclagem\nde papel?'  },
       respostas = {'A) Azul', 'B) Vermelha', 'C) Amarela'}
    }, 

    -- Resposta: a) Redução da demanda por matéria-prima virgem.
    nove = {
       p1={'9 - Qual é a principal vantagem\nda reciclagem de vidro?'  },
       respostas = {'A) Redução da demanda por\nmatéria-prima virgem', 'B) Economia de água', 'C) Aumento das emissões\nde carbono'}
    }, 

    -- Resposta: c) Reduzir o consumo e reutilizar produtos sempre que possível.
    dez = {
       p1={'10 - Além de reciclar, o que mais\npodemos fazer para contribuir\ncom a sustentabilidade?'  },
      respostas = {'A) Desperdiçar mais recursos', 'B) Comprar produtos não\nrecicláveis', 'C) Reduzir o consumo e reutilizar\nprodutos sempre que possível'}
    }, 

  }

  -- DECLARACAO DOS AUDIOS

  --EFEITOS SONOROS
  local audioCerto = audio.loadSound( 'recursos/audios/certo.mp3' )
  local audioErro = audio.loadSound( 'recursos/audios/Erro.mp3' )
  

  -- VARIAVEL QUE LIMITA O TOQUE NAS RESPOSTAS
  local limitaToque = true

  -- DECLARACAO DO FUNDO
  local fundo = display.newImageRect(grupoFundo, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5
  

  -- DECLARAÇÃO DO TEMPO
  local tempo = 15
  local tempoTexto = display.newText(grupoTela, tempo, x*0.1, y*0.07, fonte, 130 )

  -- DECLARACAO DERROTA
  local fundoDerrota = display.newRect(grupoDerrota ,x*0.5, y*0.5, x, y )
  fundoDerrota:setFillColor(0, 0, 0)
  fundoDerrota.alpha = 0.9

  local textoDerrota = display.newText(grupoDerrota,'DERROTA' ,x*0.5, y*0.4, fonte, 130 )

  local botaoDerrota = display.newRoundedRect(grupoDerrota, x*0.5, y*0.55, x*0.6, y*0.08, 80 )

  local botaoDerrotaTexto = display.newText(grupoDerrota, 'REINICIAR', botaoDerrota.x, botaoDerrota.y, fonte, 80 )
  botaoDerrotaTexto:setFillColor(0,0,0)

  grupoDerrota.alpha = 0


  -- DECLARACAO VITORIA
  local fundoVitoria = display.newRect(grupoVitoria ,x*0.5, y*0.5, x, y )
  fundoVitoria:setFillColor(0, 0, 0)
  fundoVitoria.alpha = 0.9

  local textoVitoria = display.newText(grupoVitoria,'VOCE GANHOU' ,x*0.5, y*0.4, fonte, 130 )

  local botaoVitoria = display.newRoundedRect(grupoVitoria, x*0.5, y*0.55, x*0.6, y*0.08, 80 )

  local botaoVitoriaTexto = display.newText(grupoVitoria, 'CREDITOS', botaoVitoria.x, botaoVitoria.y, fonte, 80 )
  botaoVitoriaTexto:setFillColor(0,0,0)

  grupoVitoria.alpha = 0


  -- DECLARACAO UM

  local blocoUm = display.newRoundedRect(grupoUm, x*0.5, y*0.64, x*0.9, y*0.55, 80 )
  blocoUm.alpha = 0.7

  local r1Um = display.newRoundedRect(grupoUm, x*0.5, y*0.48, x*0.85, y*0.09, 80 )
  r1Um:setFillColor(0, 0.4, 0.0) 

  local r1UmTexto = display.newText(grupoUm, pergunta.um.respostas[1], r1Um.x, r1Um.y, fonte, 80)

  local r1UmTexto = display.newText(grupoUm, pergunta.um.p1[1], x*0.5, y*0.27, fonte, 55)
 
  local r2Um = display.newRoundedRect(grupoUm, x*0.5, y*0.65, x*0.85, y*0.09, 80 )
  r2Um:setFillColor(0, 0.4, 0.0) 

  local r2UmTexto = display.newText(grupoUm, pergunta.um.respostas[2], r2Um.x, r2Um.y, fonte, 70)

  local r3Um = display.newRoundedRect(grupoUm, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Um:setFillColor(0, 0.4, 0.0) 

  local r3UmTexto = display.newText(grupoUm, pergunta.um.respostas[3], r3Um.x, r3Um.y, fonte, 80)

  -- DECLARACAO DOIS

  local blocoDois = display.newRoundedRect(grupoDois, x*0.5, y*0.64, x*0.9, y*0.55, 80 )
  blocoDois.alpha = 0.7

  local r1Dois = display.newRoundedRect(grupoDois, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Dois:setFillColor(0, 0.4, 0.0) 

  local r1DoisTexto = display.newText(grupoDois, pergunta.dois.respostas[1], r1Dois.x, r1Dois.y, fonte, 45)

  local r1DoisTexto = display.newText(grupoDois, pergunta.dois.p1[1], x*0.5, y*0.27, fonte, 60)

  local r2Dois = display.newRoundedRect(grupoDois, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Dois:setFillColor(0, 0.4, 0.0) 

  local r2DoisTexto = display.newText(grupoDois, pergunta.dois.respostas[2], r2Dois.x, r2Dois.y, fonte, 45)

  local r3Dois = display.newRoundedRect(grupoDois, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Dois:setFillColor(0, 0.4, 0.0) 

  local r3DoisTexto = display.newText(grupoDois, pergunta.dois.respostas[3], r3Dois.x, r3Dois.y, fonte, 45)

  grupoDois.alpha = 0

  -- DECLARACAO TRES

  local blocoTres = display.newRoundedRect(grupoTres, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
  blocoTres.alpha = 0.7

  local r1Tres = display.newRoundedRect(grupoTres, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Tres:setFillColor(0, 0.4, 0.0) 

  local r1TresTexto = display.newText(grupoTres, pergunta.tres.respostas[1], r1Tres.x, r1Tres.y, fonte, 50)

  local r1TresTexto = display.newText(grupoTres, pergunta.tres.p1[1], x*0.5, y*0.27, fonte, 45)

  local r2Tres = display.newRoundedRect(grupoTres, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Tres:setFillColor(0, 0.4, 0.0) 

  local r2TresTexto = display.newText(grupoTres, pergunta.tres.respostas[2], r2Tres.x, r2Tres.y, fonte, 50)

  local r3Tres = display.newRoundedRect(grupoTres, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Tres:setFillColor(0, 0.4, 0.0) 

  local r3TresTexto = display.newText(grupoTres, pergunta.tres.respostas[3], r3Tres.x, r3Tres.y, fonte, 50)

  grupoTres.alpha = 0

  -- DECLARACAO QUATRO

  local blocoQuatro = display.newRoundedRect(grupoQuatro, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
  blocoQuatro.alpha = 0.7

  local r1Quatro = display.newRoundedRect(grupoQuatro, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Quatro:setFillColor(0, 0.4, 0.0) 

  local r1QuatroTexto = display.newText(grupoQuatro, pergunta.quatro.respostas[1], r1Quatro.x, r1Quatro.y, fonte, 50)

  local r1QuatroTexto = display.newText(grupoQuatro, pergunta.quatro.p1[1], x*0.5, y*0.27, fonte, 70)
 

  local r2Quatro = display.newRoundedRect(grupoQuatro, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Quatro:setFillColor(0, 0.4, 0.0) 

  local r2QuatroTexto = display.newText(grupoQuatro, pergunta.quatro.respostas[2], r2Quatro.x, r2Quatro.y, fonte, 50)

  local r3Quatro = display.newRoundedRect(grupoQuatro, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Quatro:setFillColor(0, 0.4, 0.0) 

  local r3QuatroTexto = display.newText(grupoQuatro, pergunta.quatro.respostas[3], r3Quatro.x, r3Quatro.y, fonte, 50)

  grupoQuatro.alpha = 0

  -- DECLARACAO CINCO

  local blocoCinco = display.newRoundedRect(grupoCinco, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
  blocoCinco.alpha = 0.7

  local r1Cinco = display.newRoundedRect(grupoCinco, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Cinco:setFillColor(0, 0.4, 0) 

  local r1CincoTexto = display.newText(grupoCinco, pergunta.cinco.respostas[1], r1Cinco.x, r1Cinco.y, fonte, 70)

  local r1CincoTexto = display.newText(grupoCinco, pergunta.cinco.p1[1], x*0.5, y*0.27, fonte, 50)

  local r2Cinco = display.newRoundedRect(grupoCinco, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Cinco:setFillColor(0, 0.4, 0) 

  local r2CincoTexto = display.newText(grupoCinco, pergunta.cinco.respostas[2], r2Cinco.x, r2Cinco.y, fonte, 70)

  local r3Cinco = display.newRoundedRect(grupoCinco, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Cinco:setFillColor(0, 0.4, 0) 

  local r3CincoTexto = display.newText(grupoCinco, pergunta.cinco.respostas[3], r3Cinco.x, r3Cinco.y, fonte, 70)

  grupoCinco.alpha = 0

--DECLARACAO SEIS

  local blocoSeis = display.newRoundedRect(grupoSeis, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
  blocoSeis.alpha = 0.7

  local r1Seis = display.newRoundedRect(grupoSeis, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Seis:setFillColor(0, 0.4, 0) 

  local r1SeisTexto = display.newText(grupoSeis, pergunta.seis.respostas[1], r1Seis.x, r1Seis.y, fonte, 70)

  local r1SeisTexto = display.newText(grupoSeis, pergunta.seis.p1[1], x*0.5, y*0.27, fonte, 45)

  local r2Seis = display.newRoundedRect(grupoSeis, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Seis:setFillColor(0, 0.4, 0) 

  local r2SeisTexto = display.newText(grupoSeis, pergunta.seis.respostas[2], r2Seis.x, r2Seis.y, fonte, 70)

  local r3Seis = display.newRoundedRect(grupoSeis, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Seis:setFillColor(0, 0.4, 0) 

  local r3SeisTexto = display.newText(grupoSeis, pergunta.seis.respostas[3], r3Seis.x, r3Seis.y, fonte, 70)

  grupoSeis.alpha = 0


--DECLARACAO SETE

  local blocoSete = display.newRoundedRect(grupoSete, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
  blocoSete.alpha = 0.7

  local r1Sete = display.newRoundedRect(grupoSete, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Sete:setFillColor(0, 0.4, 0) 

  local r1SeteTexto = display.newText(grupoSete, pergunta.sete.respostas[1], r1Sete.x, r1Sete.y, fonte, 50)

  local r1SeteTexto = display.newText(grupoSete, pergunta.sete.p1[1], x*0.5, y*0.27, fonte, 50)

  local r2Sete = display.newRoundedRect(grupoSete, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Sete:setFillColor(0, 0.4, 0) 

  local r2SeteTexto = display.newText(grupoSete, pergunta.sete.respostas[2], r2Sete.x, r2Sete.y, fonte, 50)

  local r3Sete = display.newRoundedRect(grupoSete, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Sete:setFillColor(0, 0.4, 0) 

  local r3SeteTexto = display.newText(grupoSete, pergunta.sete.respostas[3], r3Sete.x, r3Sete.y, fonte, 50)

  grupoSete.alpha = 0

--DECLARACAO OITO

  local blocoOito = display.newRoundedRect(grupoOito, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
  blocoOito.alpha = 0.7

  local r1Oito = display.newRoundedRect(grupoOito, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
  r1Oito:setFillColor(0, 0.4, 0) 

  local r1OitoTexto = display.newText(grupoOito, pergunta.oito.respostas[1], r1Oito.x, r1Oito.y, fonte, 70)

  local r1OitoTexto = display.newText(grupoOito, pergunta.oito.p1[1], x*0.5, y*0.27, fonte, 45)

  local r2Oito = display.newRoundedRect(grupoOito, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
  r2Oito:setFillColor(0, 0.4, 0) 

  local r2OitoTexto = display.newText(grupoOito, pergunta.oito.respostas[2], r2Oito.x, r2Oito.y, fonte, 70)

  local r3Oito = display.newRoundedRect(grupoOito, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
  r3Oito:setFillColor(0, 0.4, 0) 

  local r3OitoTexto = display.newText(grupoOito, pergunta.oito.respostas[3], r3Oito.x, r3Oito.y, fonte, 70)

  grupoOito.alpha = 0


  --DECLARACAO NOVE

local blocoNove = display.newRoundedRect(grupoNove, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
blocoNove.alpha = 0.7

local r1Nove = display.newRoundedRect(grupoNove, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
r1Nove:setFillColor(0, 0.4, 0) 

local r1NoveTexto = display.newText(grupoNove, pergunta.nove.respostas[1], r1Nove.x, r1Nove.y, fonte, 50)
  
local r1NoveTexto = display.newText(grupoNove, pergunta.nove.p1[1], x*0.5, y*0.27, fonte, 50)

local r2Nove = display.newRoundedRect(grupoNove, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
r2Nove:setFillColor(0, 0.4, 0) 

local r2NoveTexto = display.newText(grupoNove, pergunta.nove.respostas[2], r2Nove.x, r2Nove.y, fonte, 52)

local r3Nove = display.newRoundedRect(grupoNove, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
r3Nove:setFillColor(0, 0.4, 0) 

local r3NoveTexto = display.newText(grupoNove, pergunta.nove.respostas[3], r3Nove.x, r3Nove.y, fonte, 50)

grupoNove.alpha = 0


--DECLARACAO DEZ

local blocoDez = display.newRoundedRect(grupoDez, x*0.5, y*0.67, x*0.9, y*0.6, 80 )
blocoDez.alpha = 0.7

local r1Dez = display.newRoundedRect(grupoDez, x*0.5, y*0.53, x*0.85, y*0.09, 80 )
r1Dez:setFillColor(0, 0.4, 0.0) 

local r1DezTexto = display.newText(grupoDez, pergunta.dez.respostas[1], r1Dez.x, r1Dez.y, fonte, 50)

local r1DezTexto = display.newText(grupoDez, pergunta.dez.p1[1], x*0.5, y*0.27, fonte, 50)  

local r2Dez = display.newRoundedRect(grupoDez, x*0.5, y*0.67, x*0.85, y*0.09, 80 )
r2Dez:setFillColor(0, 0.4, 0.0) 

local r2DezTexto = display.newText(grupoDez, pergunta.dez.respostas[2], r2Dez.x, r2Dez.y, fonte, 50)

local r3Dez = display.newRoundedRect(grupoDez, x*0.5, y*0.81, x*0.85, y*0.09, 80 )
r3Dez:setFillColor(0, 0.4, 0.0) 

local r3DezTexto = display.newText(grupoDez, pergunta.dez.respostas[3], r3Dez.x, r3Dez.y, fonte, 42)

grupoDez.alpha = 0


  -- DECLARACAO DAS FUNCIONALIDADES
  function verificaUm( event )
    if event.phase == 'began' and grupoUm.alpha == 1 and limitaToque == true then
      if event.target == r3Um then
        r3Um:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )
        
        timer.performWithDelay( 1000, function()
          transition.to( grupoUm, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoDois, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


      elseif event.target == r2Um then
        r2Um:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r1Um then  
        r1Um:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1Um:addEventListener('touch', verificaUm)
  r2Um:addEventListener('touch', verificaUm)
  r3Um:addEventListener('touch', verificaUm)


  function verificaDois( event )
    if event.phase == 'began' and grupoDois.alpha == 1 and limitaToque == true then
      if event.target == r2Dois then
        r2Dois:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoDois, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoTres, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      elseif event.target == r1Dois then
        r1Dois:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Dois then
        r3Dois:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1Dois:addEventListener('touch', verificaDois)
  r2Dois:addEventListener('touch', verificaDois)
  r3Dois:addEventListener('touch', verificaDois)


  function verificaTres( event )
    if event.phase == 'began' and grupoTres.alpha == 1 and limitaToque == true then
      if event.target == r2Tres then
        r2Tres:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoTres, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoQuatro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      elseif event.target == r1Tres then
        r1Tres:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Tres then
        r3Tres:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1Tres:addEventListener('touch', verificaTres)
  r2Tres:addEventListener('touch', verificaTres)
  r3Tres:addEventListener('touch', verificaTres)


  function verificaQuatro( event )
    if event.phase == 'began' and grupoQuatro.alpha == 1 and limitaToque == true then
      if event.target == r1Quatro then
        r1Quatro:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r3Quatro then
        r3Quatro:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r2Quatro then
        r2Quatro:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoQuatro, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoCinco, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Quatro:addEventListener('touch', verificaQuatro)
  r2Quatro:addEventListener('touch', verificaQuatro)
  r3Quatro:addEventListener('touch', verificaQuatro)


  function verificaCinco( event )
    if event.phase == 'began' and grupoCinco.alpha == 1 and limitaToque == true then
      if event.target == r3Cinco then
        r3Cinco:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Cinco then
        r2Cinco:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r1Cinco then
        r1Cinco:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoCinco, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoSeis, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Cinco:addEventListener('touch', verificaCinco)
  r2Cinco:addEventListener('touch', verificaCinco)
  r3Cinco:addEventListener('touch', verificaCinco)


  function verificaSeis( event )
    if event.phase == 'began' and grupoSeis.alpha == 1 and limitaToque == true then
      if event.target == r3Seis then
        r3Seis:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Seis then
        r2Seis:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r1Seis then
        r1Seis:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoSeis, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoSete, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Seis:addEventListener('touch', verificaSeis)
  r2Seis:addEventListener('touch', verificaSeis)
  r3Seis:addEventListener('touch', verificaSeis)


  function verificaSete( event )
    if event.phase == 'began' and grupoSete.alpha == 1 and limitaToque == true then
      if event.target == r1Sete then
        r1Sete:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r3Sete then
        r3Sete:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r2Sete then
        r2Sete:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoSete, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoOito, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Sete:addEventListener('touch', verificaSete)
  r2Sete:addEventListener('touch', verificaSete)
  r3Sete:addEventListener('touch', verificaSete)


  function verificaOito( event )
    if event.phase == 'began' and grupoOito.alpha == 1 and limitaToque == true then
      if event.target == r3Oito then
        r3Oito:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Oito then
        r2Oito:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r1Oito then
        r1Oito:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoOito, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoNove, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Oito:addEventListener('touch', verificaOito)
  r2Oito:addEventListener('touch', verificaOito)
  r3Oito:addEventListener('touch', verificaOito)


  function verificaNove( event )
    if event.phase == 'began' and grupoNove.alpha == 1 and limitaToque == true then
      if event.target == r3Nove then
        r3Nove:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Nove then
        r2Nove:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r1Nove then
        r1Nove:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoNove, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoDez, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Nove:addEventListener('touch', verificaNove)
  r2Nove:addEventListener('touch', verificaNove)
  r3Nove:addEventListener('touch', verificaNove)


  function verificaDez( event )
    if event.phase == 'began' and grupoDez.alpha == 1 and limitaToque == true then
      if event.target == r1Dez then
        r1Dez:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r2Dez then
        r2Dez:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Dez then
        r3Dez:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoDez, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVitoria, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      end
    end
  end

  r1Dez:addEventListener('touch', verificaDez)
  r2Dez:addEventListener('touch', verificaDez)
  r3Dez:addEventListener('touch', verificaDez)

  function atualizaTempo()
    if tempo > 0 and grupoVitoria.alpha == 0 then
      tempo = tempo - 1
      tempoTexto.text = tempo
    end
  end
  timer.performWithDelay( 1000, atualizaTempo, 0 )
  
  function adicionaTempo()
    if tempo > 0 then
      tempo = tempo + 10
      tempoTexto.text = tempo
    end
  end

  function diminuiTempo()
    if tempo >= 5 then
      tempo = tempo - 5
      tempoTexto.text = tempo

    elseif tempo < 5 then
      tempo = 0
      tempoTexto.text = tempo
    end
  end

  function verificaTempo()
    if tempo == 0 then
      grupoDerrota.alpha = 1
      grupoDois.alpha = 0
      grupoUm.alpha = 0
    end
  end
  Runtime:addEventListener('enterFrame', verificaTempo )

  function reinicia()
    composer.removeScene( 'cenas.jogo' )
  end

  function derrota( event )
    if event.phase == 'began' and grupoDerrota.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.menu' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoDerrota:addEventListener('touch', derrota)


  function vitoria( event )
    if event.phase == 'began' and grupoVitoria.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.creditos' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoVitoria:addEventListener('touch', vitoria)


end
cena:addEventListener('create', cena)
return cena