function filtro = espelho(pathname, filename)
        
        v = VideoReader ([fullfile(pathname, filename)]);           % armazena video selecionado previamente em v
        i=1;
        j=1;
        video= struct('frame',[]);                                  % separa frame a frame do video
        
    while hasFrame (v)                                              % enquanto houver frame:
        X = readFrame (v);                                          % X o recebe,
        Xrefletido = fliplr(X);                                     % inverte-se direita e esquerda     
        video(i).frame= Xrefletido;                                 % variavel video (i) recebe novo frame,
        i=i+1;  
    end

    v = VideoWriter('SeuVideo.mp4','MPEG-4');                       % inicia escrita do novo video 
    
    % agrupa frames em novo video 
    open(v)                                                     
    
    for j=1:1:size(video,2)
        writeVideo(v,video(j).frame);   
    end

    close(v)
    
    h = msgbox({'Video Gravado com Sucesso!'});                     % pop-up de finalização
end