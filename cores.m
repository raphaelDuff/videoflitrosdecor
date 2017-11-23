function filtro = cores(pathname, filename, map)

        v = VideoReader ([fullfile(pathname, filename)]);           % armazena video selecionado previamente em v
        i=1;
        j=1;
        video= struct('frame',[]);                                  % separa frame a frame do video
        
    while hasFrame (v)                                              % enquanto houver frame:
        X = readFrame (v);                                          % X o recebe,
        XLuminancia = rgb2gray(X);                                  % extraimos somente a luminancia 
        video(i).frame= XLuminancia;                                % variavel video (i) recebe novo frame,
        i=i+1;
    end

    v = VideoWriter('SeuVideo.avi','Indexed AVI');                  % inicia escrita do novo video 
    v.Colormap=map;                                                 % utilizando colormap
    
    % agrupa frames em novo video
    open(v)
    
    for j=1:1:size(video,2)
        writeVideo(v,video(j).frame);   
    end

    close(v)

    h = msgbox({'Video Gravado com Sucesso!'});                     % pop-up de finalização

end