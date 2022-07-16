function [txt, ocrMetadata] = tesseract(params, I, roi, hasROI)
img=rgb2gray(I);
imagen=img;
imagen1 = imagen;
 axes(handles.axes1)
imshow(imagen1);
title('INPUT IMAGE WITH NOISE')
% Convert to gray scale
if size(imagen,3)==3 %RGB image
    imagen=rgb2gray(imagen);
end
% Convert to BW
threshold = graythresh(imagen);

imagen =~im2bw(imagen,threshold);

imagen2 = imagen;
imagen = bwareaopen(imagen,5);
imagen3 = imagen;
 axes(handles.axes1)
imshow(imagen);
word=[ ];
re=imagen;
load templates
global templates
num_letras=size(templates,2);
while 1
    %Fcn 'lines_crop' separate lines in text
    [fl re]=lines_crop(re); %fl= first line, re= remaining image
    imgn=fl;
    n=0;
    %Uncomment line below to see lines one by one
    %figure,imshow(fl);pause(2)  
    %-----------------------------------------------------------------
    
    spacevector = [];      % to compute the total spaces betweeen
                           % adjacent letter
    rc = fl;              
   
    while 1
        %Fcn 'letter_crop' separate letters in a line
       [fc rc space]=letter_crop(rc);  %fc =  first letter in the line
                                       %rc =  remaining cropped line
                                       %space = space between the letter
                                       %   cropped and the next letter
       %uncomment below line to see letters one by one
       %figure,imshow(fc);pause(0.5)
       img_r = imresize(fc,[42 24]);   %resize letter so that correlation
                                       %can be performed
       n = n + 1;
       spacevector(n)=space;
       
       %Fcn 'read_letter' correlates the cropped letter with the images
       %given in the folder 'letters_numbers'
       letter = read_letter(img_r,num_letras);
       
       %letter concatenation
       word = [word letter];
        if space > 15
            break;
       end
       if isempty(rc)  %breaks loop when there are no more characters
           break;
        end
    end
    
        %------------------------------------------------------------------
    max_space = max(spacevector);
        max_space =16;
    no_spaces = 0;
    
     for x= 1:n   %loop to introduce space at requisite locations
       if spacevector(x+no_spaces)> (0.75 * max_space)
          no_spaces = no_spaces + 1;
            for m = x:n
              word(n+x-m+no_spaces)=word(n+x-m+no_spaces-1);
            end
           word(x+no_spaces) = ' ';
           spacevector = [0 spacevector];
       end
     end
    if isempty(re)  %See variable 're' in Fcn 'lines'
        break
    end
end
text=word;
end