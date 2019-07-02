-- title:  game of life
-- author: Rodrigo Nunes
-- desc:   
-- script: lua

zoom=1 -- define o tamanho do passo em pixel do retangulo
row=136 -- quantidade de linhas da matriz
col=240 -- quantidade de colunas da matriz
center_x = col/2 -- encontra o centro da tela em relação ao eixo x
center_y = row/2 -- encontra o centro da tela em relação ao eixo y

-- funcao de criacao de matriz 2D
function create(rows,columns)
	local mat = {}
	for i=1,rows do
		mat[i]={}
		for j=1,columns do
			mat[i][j]=0
		end
	end
	return mat
end

-- funcao de preenchimento da matriz
function fillmatrix(matrix)	
	for i=center_y-20,center_y+20,1 do
		for j=1,2 do			
			matrix[i][j]=math.random(0,1)
		end
	end
end

-- Cria a matriz
mtx = create(row,col)
fillmatrix(mtx)
aux = mtx

-- Desenha uma linha horizontal e vertical no centro da tela
function drawline()
	-- desenha uma linha vertical na tela
	line(center_x,0,center_x,136,11)
	-- desenha uma linha horizontal na tela
	line(0,center_y,240,center_y,11)
end

-- função para processamento da matriz a cada geração
function process()
	local count=0
	for x=1,row do
		for y=1,col do
			-- verifica a primeira linha
			if x==1 then
				-- verifica o primeiro indíce da matriz
				if x==y then
					if mtx[x][y+1]==1 then count=count+1 end
					if mtx[x+1][y+1]==1 then count=count+1 end
					if mtx[x+1][y]==1 then count=count+1 end
				-- verifica o ultimo indice da primeira linha
				elseif y==col then
					if mtx[x][col-1]==1 then count=count+1 end
					if mtx[x+1][col-1]==1 then count=count+1 end
					if mtx[x+1][col]==1 then count=count+1 end
				-- verifica o restante da primeira linha
				else
					if mtx[x][y-1]==1 then count=count+1 end
					if mtx[x+1][y-1]==1 then count=count+1 end
					if mtx[x+1][y]==1 then count=count+1 end
					if mtx[x+1][y+1] then count=count+1 end
					if mtx[x][y+1] then count=count+1 end	
				end
			-- verifica a ultima linha da matriz
			elseif x==row then
				-- verifica o ultimo indice da matriz
				if y==col then
					if mtx[x][y-1]==1 then count=count+1 end
					if mtx[x-1][y-1]==1 then count=count+1 end
					if mtx[x-1][y]==1 then count=count+1 end
				-- verifica o primeiro indice da ultima linha
				elseif y==1 then
					if mtx[x-1][y]==1 then count=count+1 end
					if mtx[x-1][y+1]==1 then count=count+1 end
					if mtx[x][y+1]==1 then count=count+1 end
				-- verifica o restante da ultima linha
				else
					if mtx[x][y-1]==1 then count=count+1 end
					if mtx[x-1][y-1]==1 then count=count+1 end
					if mtx[x-1][y]==1 then count=count+1 end
					if mtx[x-1][y+1]==1 then count=count+1 end
					if mtx[x][y+1]==1 then count=count+1 end
				end
			-- verifica a primeira coluna da matriz
			elseif y==1 then
				if mtx[x-1][y]==1 then count=count+1 end
				if mtx[x-1][y+1]==1 then count=count+1 end
				if mtx[x][y+1]==1 then count=count+1 end
				if mtx[x+1][y+1]==1 then count=count+1 end
				if mtx[x+1][y]==1 then count=count+1 end
			-- verifica a ultima coluna da matriz
			elseif y==col then
				if mtx[x-1][y]==1 then count=count+1 end
				if mtx[x-1][y-1]==1 then count=count+1 end
				if mtx[x][y-1]==1 then count=count+1 end
				if mtx[x+1][y-1]==1 then count=count+1 end
				if mtx[x+1][y]==1 then count=count+1 end
			-- verifica as demais posições da matriz
			else
				if mtx[x+1][y+1]==1 then count=count+1 end
				if mtx[x+1][y]==1 then count=count+1 end
				if mtx[x+1][y-1]==1 then count=count+1 end
				if mtx[x][y-1]==1 then count=count+1 end
				if mtx[x-1][y-1]==1 then count=count+1 end
				if mtx[x-1][y]==1 then count=count+1 end
				if mtx[x-1][y+1]==1 then count=count+1 end
				if mtx[x][y+1]==1 then count=count+1 end
			end
			-- verifica a quantidade de vizinhos vivos
			-- Qualquer célula viva com menos de dois vizinhos vivos morre de solidão
			if count<2 then 
				aux[x][y]=0
			-- Qualquer célula viva com mais de três vizinhos vivos morre de superpopulação
			elseif count>3 then
				aux[x][y]=0
			-- Qualquer célula viva com dois ou três vizinhos vivos continua no mesmo estado para a próxima geração
			else
				if mtx[x][y]==1  then 
					aux[x][y]=1 
			-- Qualquer célula morta com exatamente três vizinhos vivos se torna uma célula viva
				else
					if count==3 then aux[x][y]=1 end
				end
			end
			count=0
		end -- end for
	end -- end for	
		
	mtx = aux	
end

-- funcao de desenho na tela
function draw()
	
	local x=0
	local y=0
	local w=zoom
	local h=zoom
	local c=14
	
	-- varre a matriz
	for i=1,row do
		for j=1,col do
			if mtx[i][j]==1 then
				rect(x,y,w,h,c)				
			end
			x=x+zoom
		end
		y=y+zoom
		x=0
	end

end

-- funcao principal do TIC-80
function TIC()
		cls(0)
		draw()
		--drawline()
		process()		
end

