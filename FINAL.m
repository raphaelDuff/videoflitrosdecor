clear all
close all
clc

% Caixa de diálogo inicial, com duas opções: Continuar e Fechar
choice2 = questdlg('Pressione Continuar e selecione video a ser tratado', ...
	'Filtros', ...
	'Continuar','Fechar','Continuar');

% Resposta para a escolha inicial 
switch choice2
    case 'Continuar'
        [filename, pathname] = uigetfile('*.avi; *.mp4; *.mj2; *.mpg; *.wmv; *.asf; *.asx; *.m4v; *.mov; *.mpg; *.ogg', 'Selecione video a ser tratado');
                                        % navega e seleciona video 
        choice=escolhaFiltro();         % chama função escolha fltro
    case 'Fechar'
        h = msgbox({'Vlw, Flw!'});      % pop-up de despedida
        exit;                           % encerra
end

% Resposta para a escolha de filtro 
switch choice
        case 'Raio-X'
            map = colormap(bone(256));                  % alteração do colormap 
            cores(pathname, filename, map);             % chama função cores
        case 'Cores Invertidas'
            coresInvertidas(pathname, filename);        % chama função coresInvertidas
        case 'Espelho'
            espelho(pathname, filename);                % chama função espelho
        case 'Terroso'
            map = colormap(copper(256));
            cores(pathname, filename, map);     
        case 'Câmera Térmica'
            map = colormap(jet(256));
            cores(pathname, filename, map);
end   

% Caixa de diálogo para escolha de filtro, com cinco opções
function choice = escolhaFiltro
    d = dialog('Position',[300 300 250 150],'Name','Menu de Filtros');          % nome do menu
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'Position',[20 80 210 40],...
           'String','Escolha seu filtro');                                      % mensagem no menu
       
    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Position',[75 70 100 25],...
           'String',{'Raio-X';'Cores Invertidas';'Espelho';'Terroso';'Câmera Térmica'},...      % opções para escolha
           'Callback',@popup_callback);
       
    btn = uicontrol('Parent',d,...
           'Position',[89 20 70 25],...
           'String','Confirma',...                                              % botão
           'Callback','delete(gcf)');
       
    choice = 'Raio-X';                                                          % escolha padrão
   
    uiwait(d);                                                                  % espera confirmação para trabalhar com input

       function popup_callback(popup,event)
          idx = popup.Value;
          popup_items = popup.String;
          choice = char(popup_items(idx,:));
       end
   
end



