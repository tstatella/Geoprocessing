%Menu das opera��es poss�veis implementadas para o cubo. 
function menu()


resp = 0;

 while (resp~=8)
    
    clc;
    disp('   ');
    disp('<<<<<<<<< Opera��es dispon�veis >>>>>>>>>');
    disp('   ');
    disp('Rotacionar em X     (1)');
    disp('Rotacionar em Y     (2)');
    disp('Rotacionar em Z     (3)');
    disp('Transladar (X,Y,Z)  (4)');
    disp('Mudar escala        (5)');
    disp('Fazer proje��o      (6)');
    disp('Desfazer opera��es  (7)');
    disp('Sair                (8)');
    disp('   ');
    resp = input('O que deseja fazer? ');
    
    switch resp
        
        case 1;        rx();
        case 2;        ry();
        case 3;        rz();
        case 4;        tr();
        case 5;        escala();
        case 6;        proj();
        case 7;        recria();
        case 8;        clc;
              
            
    end
 end