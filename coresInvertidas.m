function filtro = coresInvertidas(pathname, filename)

v = VideoReader ([fullfile(pathname, filename)]);       % armazena video selecionado previamente em v
i=1;
j=1;
video= struct('frame',[]);             % separa frame a frame do video                     

while hasFrame (v)                      % enquanto houver frame:
    X = readFrame (v);                  % X o recebe,
   
    R = X(:,:,1);                       % separa o canal R na matriz R (PRIMEIRA MATRIZ COMPLETA)
    G = X(:,:,2);                       % separa o canal G na matriz G (SEGUNDA MATRIZ COMPLETA)
    B = X(:,:,3);                       % separa o canal B na matriz B (TERCEIRA MATRIZ COMPLETA)

    R2 = G;                             % verde torna-se vermelho
    G2 = B;                             % azul torna-se verde
    B2 = R;                             % vermelho torna-se azul

    %unifica canais RGB em única imagem novamente
    X2(:,:,1)=R2;
    X2(:,:,2)=G2;
    X2(:,:,3)=B2;
    
    video(i).frame= X2;

    i=i+1;
end

    v = VideoWriter('SeuVideo.mp4','MPEG-4');               % inicia escrita do novo video 
    
    % agrupa frames em novo video
    open(v)
    
for j=1:1:size(video,2)
    writeVideo(v,video(j).frame);   
end
    close(v)
    
    h = msgbox({'Video Gravado com Sucesso!'});             % pop-up de finalização
end

