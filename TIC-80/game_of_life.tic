-- title:  game of life
-- author: Rodrigo Nunes
-- desc:   
-- script: lua

zoom=1
row=math.floor((136-zoom)/zoom) -- quantidade de linhas da matriz
col=math.floor((240-zoom)/zoom) -- quantidade de colunas da matriz

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
	for i=1,row do
		for j=1,col do
			-- 
			for k=1,100 do
				if k==100 then 
					matrix[i][j]=math.random(0,1)
				end
			end
		end
	end
end



-- Cria a matriz
mtx = create(row,col)
fillmatrix(mtx)
aux = mtx

function process()
	for x=1,row do
		for y=1,col do
			local count=0
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
				if x==y then
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
				if mtx[x-1][y-1]==1 then count=count+1 end
				if mtx[x-1][y]==1 then count=count+1 end
				if mtx[x-1][y+1]==1 then count=count+1 end
				if mtx[x][y+1]==1 then count=count+1 end
				if mtx[x+1][y+1]==1 then count=count+1 end
				if mtx[x+1][y]==1 then count=count+1 end
				if mtx[x+1][y-1]==1 then count=count+1 end
				if mtx[x][y-1]==1 then count=count+1 end
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
				if (mtx[x][y]==1) and (count==2 or count==3) then 
					aux[x][y]=1 
			-- Qualquer célula morta com exatamente três vizinhos vivos se torna uma célula viva
				else
					if count==3 then aux[x][y]=1 end
				end
			end
		end -- end for
	end -- end for	
		
	mtx = aux	
end

function draw()
	
	x=0
	y=0
	w=zoom
	h=zoom
	c=14
	
	-- varre a matriz
	for i=1,row do
		for j=1,col do
			if mtx[i][j] == 1 then
				rect(x,y,w,h,c)
			end
			x=x+zoom
		end
		y=y+zoom
		x=0
	end

end

t=0
function TIC()
	second=0.5
	-- wait
 if t>second*60 then
		cls(0)
		process()
		draw()
		t=0
	end
	t=t+1
end

