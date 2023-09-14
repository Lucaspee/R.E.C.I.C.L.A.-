
local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaCreditos = self.view

  local x = display.contentWidth
  local y = display.contentHeight
  
  
  local fundo = display.newImageRect(cenaCreditos, 'recursos/imagens/fundorecicle.png', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local textoCreditos = display.newText(cenaCreditos, 'CREDITOS', x*0.5, y*0.10, fonte, 130 )
  textoCreditos:setFillColor( 0,0,0 )

  local bloco = display.newRoundedRect(cenaCreditos, x * 0.5, y * 0.5, x * 0.82, y * 0.58, 100)
  bloco.alpha = 0.7

  local botaoSite = display.newRoundedRect(cenaCreditos, x*0.5, y*0.35, x*0.55, y*0.09, 80 )
  botaoSite:setFillColor(0, 0.4, 0.0) 

  local textoSite = display.newText(cenaCreditos, 'Site', botaoSite.x, botaoSite.y, fonte, 80 )

  local botaoProjetos = display.newRoundedRect(cenaCreditos, x*0.5, y*0.5, x*0.55, y*0.09, 80 )
  botaoProjetos:setFillColor(0, 0.4, 0.0) 

  local textoProjetos = display.newText(cenaCreditos, 'Projetos\nalunos CPDI', botaoProjetos.x, botaoProjetos.y, fonte, 70 )

  local botaoVoltar = display.newRoundedRect(cenaCreditos, x*0.5, y*0.65, x*0.55, y*0.09, 80 )
  botaoVoltar:setFillColor(0, 0.4, 0.0) 

  local textoVoltar = display.newText(cenaCreditos, 'Voltar', botaoVoltar.x, botaoVoltar.y, fonte, 80 )

  local textoDireitos = display.newText(cenaCreditos, '© 2023 Todos os direitos reservados. \nFeito por Lucas, Carlos, Helena e Luiza', x*0.5, y*0.96, fonte, 40 )
  textoDireitos:setFillColor( 0,0,0 )

  function verificaToque( event )
    if event.phase == 'began' then
       if event.target == botaoSite then
         system.openURL( 'https://www.reciclamais.com' )

        elseif event.target == botaoProjetos then
          system.openURL( 'https://cpdi.org.br/projetos/' )

        elseif event.target == botaoVoltar then 
          composer.gotoScene( 'cenas.menu', {time = 500, effect = 'fade'} )
       end 
    end  
 end

botaoSite:addEventListener('touch', verificaToque)
botaoProjetos:addEventListener('touch', verificaToque)
botaoVoltar:addEventListener('touch', verificaToque)

end
cena:addEventListener('create', cena)
return cena