programa
{//01. Jogo da cobrinha
	
	/*Passo a passo:
	01. Importar bibliotecas necessárias;
	02. Criar função montar_janela();
		02.1. Iniciar modo gráfico (janela onde o jogo irá rodar.);
		02.2. Definir as dimensões da janela onde o jogo irá rodar;
		02.3. Definir o título da janela.
	03. criar game loop;
	04. Criar função pintar_janela();
		04.1. Definir cor da janela;
	05. Criar função desenhar_painel();
		05.1. Definir cor do painel;
		05.2. Desenhar painel retangular na parte superior;
		05.3. Definir cor do texto;
		05.4. Escrever o texto no painel;
		05.5. Definir o tamanho do texto.
	06. Criar função desenhar_cabeca_cobra();
		06.1. Pintar cabeça da cobra;
		06.2. Desenhar cabeça da cobra.
	07. Criar função testar_tecla_pressionada();
		07.1. Testar se é a tecla seta direita que está sendo pressionada no momento;
		07.2. Testar se é a tecla seta esquerda que está sendo pressionada no momento;
		07.3. Testar se é a tecla seta acima que está sendo pressionada no momento;
		07.4. Testar se é a tecla seta abaixo que está sendo pressionada no momento.
	08. criar função mover_cobra();
	09. Criar função cobra_bateu_parede();
	10. Criar função reiniciar().	
	*/
	
	inclua biblioteca Graficos --> G
	inclua biblioteca Util     --> U
	inclua biblioteca Teclado  --> T
	
	//Dimensões da janela do jogo: -----
	const inteiro largura_janela = 600
	const inteiro altura_janela = 600
	//----------------------------------

	inteiro x_cabeca_cobra = 275, y_cabeca_cobra = 275	//Posição inicial da cabeça da cobra.
	inteiro largura_cabeca_cobra = 25, altura_cabeca_cobra = 25		//Dimensões da cabeça da cobra.
	inteiro altura_painel = 50
	logico direita = falso, esquerda = falso, para_cima = falso, para_baixo = falso
	inteiro delay = 120		//Tempo (em milisegundos) de atualização da tela.
	inteiro pontuacao = 0
	
	funcao inicio()
	{
		montar_janela()					//Monta a janela onde o jogo vai rodar.
			enquanto(verdadeiro){			//Loop de game.
				pintar_janela()			//Pinta a janela onde o jogo vai rodar.
				desenhar_painel()			//Cria um painel retangular na parte superior informando a pontuação do usuário.
				testar_tecla_pressionada()	//Verifica qual a tecla do teclado está pressionada e registra na variável.
				mover_cobra()				//Testa a tecla pressionada e modifica as coordenadas de posição da cobra movimentando-a na janela.
				reiniciar()
				desenhar_cabeca_cobra()		//Desenha a cabeça da cobra.
				G.renderizar()				//Faz com que os desenhos existentes no Back Buffer sejam desenhados na tela.
				U.aguarde(delay)			//Define o tempo (em milisegundos) de atualização da tela.
			}
	}
	funcao montar_janela(){										//Monta a janela onde o jogo vai rodar.
		G.iniciar_modo_grafico(verdadeiro)	  						//Inicia o modo gráfico.
		G.definir_dimensoes_janela(largura_janela, altura_janela)		//Define as dimensões da janela.
		G.definir_titulo_janela("Jogo da Cobrinha")					//Define o título da janela.
	}
	funcao pintar_janela(){										//Pinta a janela onde o jogo vai rodar e limpa o desenho do ambiente gráfico.
		G.definir_cor(G.COR_BRANCO)								//Defini a cor da janela como branco.
		G.limpar()											//Limpa o desenho do ambiente gráfico e preenche o fundo com a cor atual..
	}
	funcao desenhar_painel(){									//Cria um painel retangular na parte superior informando a pontuação do usuário.
		G.definir_cor(G.COR_AZUL)								//Defini a cor do painel.
		G.desenhar_retangulo(0, 0, largura_janela, altura_painel, falso, verdadeiro)	//Desenha um retângulo na parte superior com a largura da janela.
		G.definir_cor(G.COR_AMARELO)								//Defini a cor do texto.
		G.desenhar_texto(10, 10, "Pontuação atual: " + pontuacao)		//Escreve o texto no painel.
		G.definir_tamanho_texto(25.0)								//Defini o tamanho do texto.
	}
	funcao testar_tecla_pressionada(){								//Verifica qual a tecla do teclado está pressionada e registra na variável.
		se(T.tecla_pressionada(T.TECLA_SETA_DIREITA)){				//Verifica se a tecla seta direita do teclado está pressionada.
			direita = verdadeiro
			esquerda = falso
			para_cima = falso
			para_baixo = falso
		}senao se(T.tecla_pressionada(T.TECLA_SETA_ESQUERDA)){			//Verifica se a tecla seta esquerda do teclado está pressionada.
			direita = falso
			esquerda = verdadeiro
			para_cima = falso
			para_baixo = falso
		}senao se(T.tecla_pressionada(T.TECLA_SETA_ACIMA)){			//Verifica se a tecla seta acima do teclado está pressionada.
			direita = falso
			esquerda = falso
			para_cima = verdadeiro
			para_baixo = falso
		}senao se(T.tecla_pressionada(T.TECLA_SETA_ABAIXO)){			//Verifica se a tecla seta abaixo do teclado está pressionada.
			direita = falso
			esquerda = falso
			para_cima = falso
			para_baixo = verdadeiro
		}
	}
	funcao mover_cobra(){										//Testa a tecla pressionada e modifica as coordenadas de posição da cobra movimentando-a na janela.
		se(direita){											//Se a tecla direita está sendo pressionada, adiciona 25 a coordenada x (horizontal).
			x_cabeca_cobra += largura_cabeca_cobra
		}senao se(esquerda){									//Se a tecla esquerda está sendo pressionada, subtrai 25 a coordenada x (horizontal).
			x_cabeca_cobra -= largura_cabeca_cobra
		}senao se(para_cima){									//Se a tecla acima está sendo pressionada, subtrai 25 a coordenada y (vertical).
			y_cabeca_cobra -= altura_cabeca_cobra
		}senao se(para_baixo){									//Se a tecla abaixo está sendo pressionada, adiciona 25 a coordenada y (vertical).
			y_cabeca_cobra += altura_cabeca_cobra
		}
	}
	funcao reiniciar(){											//Reinicia a posição da cobra quando ela bate na parede. 
		se(cobra_bateu_parede()){
			x_cabeca_cobra = 275
			y_cabeca_cobra = 275
			direita = falso
			esquerda = falso
			para_cima = falso
			para_baixo = falso
		}
	}
	funcao logico cobra_bateu_parede(){							//Testa se a cobra bateu na parede.
		se(x_cabeca_cobra > (largura_janela - largura_cabeca_cobra) ou x_cabeca_cobra < 0){	//Retorna verdadeiro caso a cobra encoste na parede direita ou esquerda.
			retorne verdadeiro
		}senao se(y_cabeca_cobra > (altura_janela - altura_cabeca_cobra) ou y_cabeca_cobra < altura_painel){	//Retorna verdadeiro caso a cobra encoste chão ou no teto.
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}
	funcao desenhar_cabeca_cobra(){								//Desenha a cabeça da cobra.
		G.definir_cor(G.COR_PRETO)								//Pinta a cabeça da cobra de preto.
		G.desenhar_retangulo(x_cabeca_cobra, y_cabeca_cobra, largura_cabeca_cobra, altura_cabeca_cobra, verdadeiro, verdadeiro)	   /*Desenha a cabeça do cobra com as dimensões informadas 
																											nas variáveis e as coordenadas*/
	}	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1844; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {direita, 44, 8, 7}-{esquerda, 44, 25, 8}-{para_cima, 44, 43, 9}-{para_baixo, 44, 62, 10};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */