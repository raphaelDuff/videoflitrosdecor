Utilizando dois videos obtivemos os seguintes resultados:

- Video 1 -&gt;
  - Tempo de video:        0:00:12
  - Tamanho:                   3.089KB
  - Framerate:                 29.970029970029970
  - Tempo de execução: 81.03s

- Video 2 -&gt;
  - Tempo de video:        0:00:36
  - Tamanho:                   1.929KB
  - Framerate:                 29.970029970029970
  - Tempo de execução: 111.71s

Há relação direta entre tempo de video e tempo de execução. Isso também ocorre porque, para este caso, muitas das funções são chamadas por número de quadros.

Após a execução do código, com uso da funcionalidade Run/Time, os tempos são apresentados em Total Time (tempo total gasto numa função incluindo subfunções e todas as funções menores dentro dela) e Self Time (tempo total gasto numa função, excluindo-se o tempo em funções menores). Ordenando então por Self Time, vemos que se gasta muito tempo em VideoReader, VideoWriter e na função do filtro. Enquanto não podemos mudar a função VideoReader, que interpreta as informações do vídeo, a função do filtro pode ser otimizada.

Funções

| Função | Funcionalidade | Entradas | Saídas |
| --- | --- | --- | --- |
| questdlg | Cria caixa de diálogo com botões para resposta | Seleção entre continuar e cancelar | Prossegue abrindo file explorer ou encerrando o Matlab |
| uigetfile  | Cria uma interface para seleção de arquivo | Vídeo selecionado pelo usuário | Nome do vídeo e caminho são armazenados em variável |
| msgbox  | Cria pop-up com mensagem | string | Popup |
| dialog  | Cria caixa de diálogo com opções para escolha | Seleção dentre uma das opções | Escolha final do filtro (execução de funções) |
| VideoReader  | Interpreta vídeo dando informações de framerate, tempo etc | Arquivo de vídeo | Objeto com informações do vídeo |
| VideoWriter  | Inversamente as Reader, cria objeto onde um vídeo será escrito | Mone do arquivo gerado e formato | Cria um objeto &quot;vazio&quot; onde vídeo deverá ser gravado |
| writeVideo  | Escreve frame a frame no objeto criado pela função descrita acima | Objeto &quot;vazio&quot; criado | Vídeo |
| Fliplr | Inverte matriz da direita pra esquerda | Matriz original | Matriz invertida |
