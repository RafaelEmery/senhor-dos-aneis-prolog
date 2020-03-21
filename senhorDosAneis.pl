% Autor: Rafael Emery Cade Poloni
% Data: 11 de Julho de 2019
% Descrição: Trabalho final da disciplina Lógica para Computação II em 2019.1 
% da UFES - Campus São Mateus.
% Objetivo: Implementar o modelo lógico do universo de "O Senhor Dos Anéis" 
% na linguagem Prolog. A partir disso, temos fatos e regras relacionados
% ao universo escolhido.

% -------------------------------------------------------------------
% Fatos
% -------------------------------------------------------------------

% Definindo o mundo e os continentes do universo
mundo(arda).
continente(terra_media).

% Definindo a mitologia do universo
entidadeSuperior(iluvatar,deus).
entidadesFilhas(morgoth,valar).
entidadesFilhas(sauron,maianr).

% Definindo a cronologia do universo
era(primeira,criacao_do_mundo).
era(segunda,batalha_contra_morgoth).
era(terceira,batalha_contra_sauron_e_anel).

% Definindo os seres vivos do universo
serVivo(frodo).
serVivo(sam).
serVivo(merry).
serVivo(pippin).
serVivo(bilbo).
serVivo(boromir).
serVivo(passolargo).
serVivo(gimli).
serVivo(legolas).
serVivo(gandalf).
serVivo(saruman).
serVivo(smeagol).

% Definindo os personagens do universo com nome e raca
personagem(frodo,frodo_bolseiro).
personagem(sam,samwise_gangee).
personagem(merry,meriadoc_brandebuque).
personagem(pippin,peregrin_tuk).
personagem(passolargo,aragorn_filho_de_arathorn).
personagem(boromir,boromir_filho_de_denethor).
personagem(gimli,gimli_filho_de_gloin).
personagem(legolas,legolas_filho_de_thranduil).
personagem(gandalf,gandalf_mago_cinzento).
personagem(smeagol,gollum).
personagem(saruman,saruman_mago_branco).
personagem(bilbo,bilbo_bolseiro).

% Definindo objetos do universo
objetoPrincipalDePersonagem(anel_mestre,frodo).
objetoPrincipalDePersonagem(ferrao,frodo).
objetoPrincipalDePersonagem(malha_de_mithril,frodo).
objetoPrincipalDePersonagem(machado,gimli).
objetoPrincipalDePersonagem(arco_e_flecha,legolas).
objetoPrincipalDePersonagem(cajado,gandalf).
objetoPrincipalDePersonagem(cajado,saruman).
objetoPrincipalDePersonagem(espada_de_isildur,passolargo).
objetoPrincipalDePersonagem(espada,boromir).

% Criaturas extraordinarias
criatura(aranha_gigante).
criatura(balrog).
criatura(aguia_gigante).
criatura(nazgul).
criatura(warg).

% Onde habitam as criaturas extraordinarias definidas acima
ondeViveCriatura(aranha_gigante,mordor).
ondeViveCriatura(balrog,moria).
ondeViveCriatura(aguia_gigante,lothlorien).
ondeViveCriatura(nazgul,mordor).
ondeViveCriatura(warg,mordor).

% Definindo as racas principais
raca(anao).
raca(elfo).
raca(homem). 	
raca(hobbit).
raca(orc).
raca(goblin).
raca(troll).
raca(maianr).

% Definindo as caracteristicas
caracteristica(forte).
caracteristica(resistente).
caracteristica(inteligente).
caracteristica(habilidade_espadas).
caracteristica(cavaleiro).
caracteristica(veloz).
caracteristica(ladrao).
caracteristica(muito_forte).
caracteristica(grande).
caracteristica(sabedoria).
caracteristica(habilidade_magia).
caracteristica(imortal).

% Definindo os reinos
reino(gondor).
reino(rohan). 
reino(numenor).
reino(mordor).
reino(moria).
reino(lothlorien).
reino(condado).
reino(erebor).

% Racas que vivem nos reinos 
racaQueViveEm(gondor,homem).
racaQueViveEm(rohan,homem).
racaQueViveEm(numenor,homem).
racaQueViveEm(mordor,orc).
racaQueViveEm(moria,goblin).
racaQueViveEm(lothlorien,elfo).
racaQueViveEm(condado,hobbit).
racaQueViveEm(erebor,anao).

% Reinos de origem dos personagens
origemDe(frodo,condado).
origemDe(sam,condado).
origemDe(merry,condado).
origemDe(pippin,condado).
origemDe(bilbo,condado).
origemDe(passolargo,numenor).
origemDe(boromir,gondor).
origemDe(gimli,erebor).
origemDe(smeagol,condado).
origemDe(legolas,lothlorien).
origemDe(gandalf,entidades_superiores).
origemDe(saruman,entidades_superiores).

% Definindo os lugares que ocorreram batalhas
lugar(minas_tirith,gondor).
lugar(abismo_de_helm,rohan).
lugar(portoes_negros,mordor).
lugar(olho_de_saruman,mordor).
lugar(montanha_da_perdicao,mordor).
lugar(valfenda,lothlorien).
lugar(bolsao,condado).
lugar(tumba_de_balin,moria).

% Racas aliadas ao Frodo e sua causa
aliadoDe(hobbit,hobbit).
aliadoDe(hobbit,homem).
aliadoDe(hobbit,elfo).
aliadoDe(hobbit,anao).
aliadoDe(hobbit,maianr).

% Racas inimigas ao Frodo (seguem Sauron)
inimigoDe(hobbit,orc).
inimigoDe(hobbit,goblin).
inimigoDe(hobbit,troll).

% Guerras
guerra(guerra_do_anel,sociedade_do_anel,terceira_era).

% Batalha
batalha(abismo_de_helm,rohan,guerra_do_anel).
batalha(pelennor_minas_tirith,gondor,guerra_do_anel).
batalha(portoes_negros,mordor,guerra_do_anel).

% -------------------------------------------------------------------
% Regras
% -------------------------------------------------------------------

% Raca dos personagens existentes
anao(X) :- serVivo(X),origemDe(X,erebor).
hobbit(X) :- serVivo(X),origemDe(X,condado).
homem(X) :- serVivo(X),(origemDe(X,gondor);origemDe(X,rohan);origemDe(X,numenor)).
elfo(X) :- serVivo(X),origemDe(X,lothlorien).
orc(X) :- serVivo(X),origemDe(X,mordor).
goblin(X) :- serVivo(X),origemDe(X,moria).
maianr(X) :- serVivo(X),origemDe(X,entidades_superiores).

% Regras de semelhanca entre personagens
mesmaRaca(X,Y) :- ((anao(X),anao(Y));(hobbit(X),hobbit(Y));(elfo(X),elfo(Y));(homem(X),homem(Y));
				(orc(X),orc(Y));(goblin(X),goblin(Y));(maianr(X),maianr(Y))), X \= Y.
mesmaOrigem(X,Y) :- (origemDe(X,Z),origemDe(Y,Z)), X \= Y.

% Define a posse de objetos e personagens com objetos importantes
possui(X,Y) :- serVivo(X),objetoPrincipalDePersonagem(X,Y).
senhorDosAneis(X) :- serVivo(X),objetoPrincipalDePersonagem(anel_mestre,X).
descendenteDeIsildur(X) :- serVivo(X),homem(X),origemDe(X,numenor),objetoPrincipalDePersonagem(espada_de_isildur,X).

% Caracteristicas das racas dos personagens
forte(X) :- anao(X);homem(X);elfo(X).
resistente(X) :- orc(X);troll(X);(hobbit(X),objetoPrincipalDePersonagem(malha_de_mithril,X)).
inteligente(X) :- anao(X);homem(X);elfo(X);maianr(X).
habilidade_espadas(X) :- homem(X);elfo(X).
cavaleiro(X) :- homem(X),origem(X,rohan).
veloz(X) :- hobbit(X);goblin(X).
ladrao(X) :- hobbit(X),personagem(X,bilbo_bolseiro).
muito_forte(X) :- orc(X),troll(X).
grande(X) :- troll(X).
% Easter egg -> Saruman nao e sabio!
sabedoria(X) :- (maianr(X),not(personagem(X,saruman_mago_branco));hobbit(X),personagem(X,bilbo_bolseiro)).
habilidade_magia(X) :- ((maianr(X);hobbit(X)),(objetoPrincipalDePersonagem(cajado,X);
						objetoPrincipalDePersonagem(anel_mestre,X))).
imortal(X) :- elfo(X);maianr(X);(homem(X),origemDe(X,numenor)).

% Regras que definem quais racas sao aliadas e quais inimigas. O raciocinio e feito a partir das relacoes que todos
% possuem com os Hobbits
aliados(X,Y) :- ((aliadoDe(Z,X),aliadoDe(Z,Y));(inimigoDe(Z,X),inimigoDe(Z,Y))).
inimigos(X,Y) :- ((inimigoDe(Z,X),aliadoDe(Z,Y));(aliadoDe(Z,X),inimigoDe(Z,Y))).

% Regras que definem quais reinos sao aliados e quais inimigos a partir das relacoes entres as racas aliadas / inimigas
reinosAliados(X,Y) :- racaQueViveEm(X,Z),racaQueViveEm(Y,W),aliados(Z,W), X \= Y.
reinosInimigos(X,Y) :- racaQueViveEm(X,Z),racaQueViveEm(Y,W),inimigos(Z,W), X \= Y.

% Define e consulta reinos que sao aliados e inimigos de frodo, a partir das relacoes entre as racas
reinoAliadoFrodo(X) :- racaQueViveEm(X,Y),aliadoDe(hobbit,Y).
reinoInimigoFrodo(X) :- racaQueViveEm(X,Y),inimigoDe(hobbit,Y).

% Define lugares que sao amigaveis perigosos para frodo (ou qualquer outro membro da sociedade do anel)
lugarAmigavelFrodo(X) :- lugar(X,Y),racaQueViveEm(Y,W),aliadoDe(hobbit,W).
lugarPerigosoFrodo(X) :- lugar(X,Y),racaQueViveEm(Y,W),inimigoDe(hobbit,W). 

% Define o reino que possui criaturas extraordinarias ("YOU... SHALL NOT... PAAAAAAASS")
possuiBalrog(X) :- reino(X),ondeViveCriatura(balrog,X).
possuiAranhaGigante(X) :- reino(X),ondeViveCriatura(aranha_gigante,X).
possuiAguiaGigante(X) :- reino(X),ondeViveCriatura(aguias,X).
possuiNazgul(X) :- reino(X),ondeViveCriatura(nazgul,X).
possuiWarg(X) :- reino(X),ondeViveCriatura(warg,X).

% Define uma batalha que fez parte da guerra do anel
batalhaPeloAnel(X) :- batalha(X,_,guerra_do_anel),guerra(guerra_do_anel,_,_).

% Define de qual era que a batalha pertence
batalhaDaPrimeiraEra(X) :- batalha(X,_,Y),guerra(Y,_,primeira_era).
batalhaDaSegundaEra(X) :- batalha(X,_,Y),guerra(Y,_,segunda_era).
batalhaDaTerceiraEra(X) :- batalha(X,_,Y),guerra(Y,_,terceira_era).






