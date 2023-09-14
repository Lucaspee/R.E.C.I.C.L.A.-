local composer = require('composer')

local cena = composer.newScene()

-- Variáveis globais para controlar o estado do som e os botões de som
local somLigado = true
local botaoSomLigado
local botaoSomDesligado

function cena:create(event)
  local cenaMenu = self.view

  local x = display.contentWidth
  local y = display.contentHeight

  -- Volume original da música
  local volumeOriginal = 0.2

  -- Música do menu
  local musica = audio.loadStream('recursos/audios/Alternate.mp3')

  audio.play(musica, { channel = 32, loops = -1 })
  audio.setVolume(volumeOriginal, { channel = 32 })

  local fundo = display.newImageRect(cenaMenu, 'recursos/imagens/fundorecicle.png', x, y)
  fundo.x = x * 0.5
  fundo.y = y * 0.5

  local textoMenu = display.newText(cenaMenu, 'R.E.C.I.C.L.A+', x * 0.5, y * 0.10, fonte, 130)
  textoMenu:setFillColor(0, 0, 0)

  local bloco = display.newRoundedRect(cenaMenu, x * 0.5, y * 0.5, x * 0.82, y * 0.58, 100)
  bloco.alpha = 0.7

  local botaoJogar = display.newRoundedRect(cenaMenu, x * 0.5, y * 0.35, x * 0.55, y * 0.09, 80)
  botaoJogar:setFillColor(0, 0.4, 0)

  local textoJogar = display.newText(cenaMenu, 'JOGAR', botaoJogar.x, botaoJogar.y, fonte, 80)

  local botaoTutorial = display.newRoundedRect(cenaMenu, x * 0.5, y * 0.5, x * 0.55, y * 0.09, 80)
  botaoTutorial:setFillColor(0, 0.4, 0)

  local textoTutorial = display.newText(cenaMenu, 'TUTORIAL', botaoTutorial.x, botaoTutorial.y, fonte, 80)

  local botaoCreditos = display.newRoundedRect(cenaMenu, x * 0.5, y * 0.65, x * 0.55, y * 0.09, 80)
  botaoCreditos:setFillColor(0, 0.4, 0)

  local textoCreditos = display.newText(cenaMenu, 'CREDITOS', botaoCreditos.x, botaoCreditos.y, fonte, 100)

  -- Botão de som ligado
  botaoSomLigado = display.newImageRect(cenaMenu, 'recursos/imagens/som_ligado.png', x*0.2, y*0.1)
  botaoSomLigado.x = x * 0.9
  botaoSomLigado.y = y * 0.04

  -- Botão de som desligado
  botaoSomDesligado = display.newImageRect(cenaMenu, 'recursos/imagens/som_desligado.png', x*0.2, y*0.1)
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

  function verificaToque(event)
    if event.phase == 'began' then
      if event.target == botaoJogar then
        composer.gotoScene('cenas.jogo', {
          time = 300,
          effect = 'fade'
        })

      elseif event.target == botaoTutorial then
        composer.gotoScene('cenas.tutorial', {
          time = 300,
          effect = 'fade'
        })

      elseif event.target == botaoCreditos then
        composer.gotoScene('cenas.creditos', {
          time = 300,
          effect = 'fade'
        })
      end
    end
  end

  botaoJogar:addEventListener('touch', verificaToque)
  botaoTutorial:addEventListener('touch', verificaToque)
  botaoCreditos:addEventListener('touch', verificaToque)

end

cena:addEventListener('create', cena)
return cena
