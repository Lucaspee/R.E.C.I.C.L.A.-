# ROTEIRO
local musica = audio.loadStream( 'recursos/audios/Alternate.mp3' )
audio.play( musica, {channel = 32, loops = -1} )
--   audio.setVolume( 0.3, {channel = 32} )


  local fundo = display.newImageRect(cenaMenu, 'recursos/imagens/nature.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5


  -- DECLARACAO DO FUNDO NA CENA JOGO
  local fundo = display.newImageRect(grupoFundo, 'recursos/imagens/nat2.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5





1 Qual a cor de lixeira que se refere ao descarte de vidros?

a) Lixeira azul.
b) Lixeira amarela.
c) Lixeira verde.

Resposta: c) Lixeira verde.

-------------------------

2 O que significa o termo "coleta seletiva"?

a) Coletar resíduos de maneira aleatória.
b) Separar e coletar materiais recicláveis específicos.
c) Coletar apenas resíduos orgânicos.

Resposta: b) Separar e coletar materiais recicláveis específicos.

---------------------------

3 Qual é um dos principais problemas causados pelo descarte inadequado de resíduos eletrônicos?

a) Diminuição da demanda por eletrônicos novos.
b) Liberação de substâncias tóxicas no solo e na água.
c) Aumento da durabilidade dos eletrônicos.

Resposta: b) Liberação de substâncias tóxicas no solo e na água.

------------------------------

4 O que é compostagem?

a) Processo de transformar plástico em energia.
b) Processo de decomposição de resíduos orgânicos em material fertilizante.
c) Processo de reciclagem de papel.

Resposta: b) Processo de decomposição de resíduos orgânicos em material fertilizante.

------------------------------------

5 Quanto tempo demora uma lata de alumínio para se decompor?

a) De 200 a 500 anos
b) De 20 a 40 anos
c) De 7 a 60 anos

Resposta: a) De 200 a 500 anos

-----------------------------------

Qual é um exemplo de material biodegradável que pode ser reciclado por meio da compostagem?

a) Papel.
b) Plástico PET.
c) Isopor (EPS).

Resposta: a) Papel.

-------------------------------------

Além de reduzir o desperdício, qual é outro benefício social da reciclagem?

a) Aumento dos custos de produção.
b) Criação de empregos na indústria de reciclagem.
c) Diminuição da conscientização ambiental.

Resposta: b) Criação de empregos na indústria de reciclagem.

------------------------------------------------

Qual é a cor de uma lixeira normalmente associada à reciclagem de papel?

a) Azul.
b) Vermelha.
c) Amarela.

Resposta: a) Azul.

------------------------------------------

Qual é a principal vantagem da reciclagem de vidro?

a) Redução da demanda por matéria-prima virgem.
b) Economia de água.
c) Aumento das emissões de carbono.

Resposta: a) Redução da demanda por matéria-prima virgem.

--------------------------------------------

Além de reciclar, o que mais podemos fazer para contribuir com a sustentabilidade?

a) Desperdiçar mais recursos.
b) Comprar produtos não recicláveis.
c) Reduzir o consumo e reutilizar produtos sempre que possível.

Resposta: c) Reduzir o consumo e reutilizar produtos sempre que possível.

# Nome:
R.E.C.I.C.L.A.+

# Idéia:
Um jogo de quiz sobre reciclagem, onde terão que acertar a resposta correta entre as 3 opções...

# Funcionalidades
-- sistema de tempo
-- resposta certa e errada
-- menu
-- tutorial
-- creditos
-- perguntas
-- simular carregamento
-- transicao entre cenas
-- fontes personalizas
-- efeitos sonoros

# CheckList
(X) Alterar o tamanho do projeto para o tamanho do dispositivo
(X) Criar as cenas do projeto e configura-las
(X) Separar os recursos que iremos utilizar no desenvolvimento do projeto como: fonte, efeito sonoro e imagens
(X) Criar a cena de carregamento
(X) Criar a cena do menu
(X) Criar a cena do tutorial
(X) Criar a cena dos Creditos
(X) Criar a cena do jogo
(X) Criar o sistema de perguntas
(X) Criar o sistema de tempo
(X) Adicionar efeito sonoro
(X) Adicionar fonte personalizada
() Trasnformar o projeto em um apk
