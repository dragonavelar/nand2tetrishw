Video Real    640x480
Video Virtual 512x256

Memória necessária para o vídeo em preto e branco:
linha: 64 bytes 
frame: 16 Kbytes 

Na área restante é possível setar uma cor fixa ou uma borda.
Posteriormente podemos colocar uma imagem colorida a partir de uma memória!!!

Opção 1 (parcialmente pronta)

+------0------+----640--+
|             |         |
0           511-------639
|             |       |
|             |       |
+-----255-----+       |
480    |              |
+-----479---------------+

Opção 2 (implementar depois)

Borda Vertical 64
Borda Horizontal 112

+--------0----640-------+
|        |              |
|    +--112--------+    |
|    |             |    |
0----64            |    |
|    |           575--639
|    |             |    |
480  +--------367--+   |
|             |        |
+-------------479-------+

