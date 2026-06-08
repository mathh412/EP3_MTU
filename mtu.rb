class MTU
  attr_reader :fita, :cursor, :estado_atual

  def initialize(entrada)
    @fita = decodificar_entrada(entrada)
    @cursor = @fita.index("#") + 1
    @estado_atual = "fa"
  end

  def decodificar_entrada(entrada)
    tokens = []
    i = 0
    
    while i < entrada.length
      char = entrada[i]
      
      if char == '#' || char == 'd' || char == 'e' || char == '_'
        tokens << char
        i += 1
      elsif char == 'f'
        j = i + 1
        while j < entrada.length && (entrada[j] == 'a' || entrada[j] == 'b')
          j += 1
        end
        tokens << entrada[i...j]
        i = j
      elsif char == 's'
        j = i + 1
        while j < entrada.length && entrada[j] == 'c'
          j += 1
        end
        tokens << entrada[i...j]
        i = j
      else
        i += 1
      end
    end
    
    tokens << "_" if tokens.last == "#"
    tokens
  end

  def processar
    loop do
      simbolo_atual = @fita[@cursor] || "_"
      
      posicao_busca = 0
      encontrou_regra = false
      estado_destino = nil
      simbolo_escrito = nil
      direcao = nil

      while @fita[posicao_busca] != "#"
        if @fita[posicao_busca] == @estado_atual && @fita[posicao_busca + 1] == simbolo_atual
          estado_destino = @fita[posicao_busca + 2]
          simbolo_escrito = @fita[posicao_busca + 3]
          direcao = @fita[posicao_busca + 4]
          encontrou_regra = true
          break
        end
        posicao_busca += 5
      end

      return false unless encontrou_regra

      @fita[@cursor] = simbolo_escrito
      
      if direcao == 'd'
        @cursor += 1
        @fita << "_" if @cursor >= @fita.length
      elsif direcao == 'e'
        @cursor -= 1
        indice_cerquilha = @fita.index("#")
        if @cursor <= indice_cerquilha
          @fita.insert(indice_cerquilha + 1, "_")
          @cursor += 1
        end
      end

      @estado_atual = estado_destino

      return true if @estado_atual.start_with?("fb")
    end
  end
end