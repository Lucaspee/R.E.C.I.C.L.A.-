local composer = require('composer')

local cena = composer.newScene()

-- Variáveis para controlar o estado do som e os botões de som
local somLigado = true
local botaoSomLigado
local botaoSomDesligado


-- Variáveis para controlar o fundo, a imagem de dica e o botão JOGAR
local fundo
local imagemDica
local botaoJogar

function cena:create(event)
  local cenaTutorial = self.view

  local x = display.contentWidth
  local y = display.contentHeight

  local group = display.newGroup() 

  -- Volume original da música
  local volumeOriginal = 0.2

  -- Música do menu
  local musica = audio.loadStream('recursos/audios/Alternate.mp3')

  audio.play(musica, { channel = 32, loops = -1 })
  audio.setVolume(volumeOriginal, { channel = 32 })

  local fundo = display.newImageRect(group, 'recursos/imagens/fundorecicle.png', x, y)
  fundo.x = x * 0.5
  fundo.y = y * 0.5

  local textoTutorial = display.newText(group, 'TUTORIAL', x * 0.5, y * 0.10, fonte, 130)
  textoTutorial:setFillColor(0, 0, 0)

  local bloco = display.newRoundedRect(group, x * 0.5, y * 0.535, x * 0.8, y * 0.72, 100)
  bloco.alpha = 0.7

  local texto = display.newText(group, 'Objetivo: Responda perguntas sobre reciclagem corretamente.', x * 0.5, y * 0.45, x * 0.7, y * 0.5, fonte, 45)
  texto:setFillColor(0, 0, 0)

  local texto = display.newText(group, 'Respostas: Clique na opção correta entre três escolhas.', x * 0.5, y * 0.54, x * 0.7, y * 0.5, fonte, 45)
  texto:setFillColor(0, 0, 0)

  local texto = display.newText(group, 'Temporizador: Começa com 15 segundos. Acerto +5s, erro -5s.', x * 0.5, y * 0.63, x * 0.7, y * 0.5, fonte, 45)
  texto:setFillColor(0, 0, 0)

  local texto = display.newText(group, 'Pontuação: Quanto mais rápido e correto, melhor a pontuação.', x * 0.5, y * 0.72, x * 0.7, y * 0.5, fonte, 45)
  texto:setFillColor(0, 0, 0)

  local texto = display.newText(group, 'Fim: Quando acabar o tempo ou todas as perguntas.', x * 0.5, y * 0.81, x * 0.7, y * 0.5, fonte, 45)
  texto:setFillColor(0, 0, 0)

  local texto = display.newText(group, 'Dica: Divirta-se enquanto aprende a importância da reciclagem para o nosso planeta!', x * 0.5, y * 0.90, x * 0.7, y * 0.5, fonte, 45)
  texto:setFillColor(0, 0, 0)

  -- Botão Dica
  local botaoDica = display.newRoundedRect(group, x * 0.5, y * 0.84, x * 0.55, y * 0.09, 80)
  botaoDica:setFillColor(0, 0.4, 0.0)

  local textoDica = display.newText(group, 'DICA', botaoDica.x, botaoDica.y, fonte, 80)

  function exibirDica(event)
    if event.phase == 'began' then
      -- Remova o fundo inicial
      fundo:removeSelf()

      -- Carregue e exiba a imagem de dica
      imagemDica = display.newImageRect(group, 'recursos/imagens/tutorial.jpg', x, y)
      imagemDica.x = x * 0.5
      imagemDica.y = y * 0.5

      -- Botão "JOGAR"
      botaoJogar = display.newRoundedRect(group, x * 0.5, y * 0.93, x * 0.55, y * 0.09, 80)
      botaoJogar:setFillColor(0, 0.4, 0.0)

      local textoJogar = display.newText(group, 'JOGAR', botaoJogar.x, botaoJogar.y, fonte, 80)

      function verificaToque(event)
        if event.phase == 'began' then
          -- Vá para a cena de jogo quando o botão "JOGAR" é clicado
          composer.gotoScene('cenas.jogo', {
            time = 500,
            effect = 'fade'
          })
        end
      end

      botaoJogar:addEventListener('touch', verificaToque)
    end
  end

  botaoDica:addEventListener('touch', exibirDica)

  -- Botão de som ligado
  botaoSomLigado = display.newImageRect(group, 'recursos/imagens/som_ligado.png', x * 0.2, y * 0.1)
  botaoSomLigado.x = x * 0.9
  botaoSomLigado.y = y * 0.04

  -- Botão de som desligado
  botaoSomDesligado = display.newImageRect(group, 'recursos/imagens/som_desligado.png', x * 0.2, y * 0.1)
  botaoSomDesligado.x = x * 0.9
  botaoSomDesligado.y = y * 0.04
  botaoSomDesligado.isVisible = false

  function alternarSom()
    if somLigado then
      -- Desliga o som
      audio.setVolume(0, { channel = 32 })
      somLigado = false
      botaoSomLigado.isVisible = false
      botaoSomDesligado.isVisible = true
    else
      -- Liga o som
      audio.setVolume(volumeOriginal, { channel = 32 })
      somLigado = true
      botaoSomLigado.isVisible = true
      botaoSomDesligado.isVisible = false
    end
  end

  botaoSomLigado:addEventListener('tap', alternarSom)
  botaoSomDesligado:addEventListener('tap', alternarSom)

  cenaTutorial:insert(group) 
end

cena:addEventListener('create', cena)
return cena
