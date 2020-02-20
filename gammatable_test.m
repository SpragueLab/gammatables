% gammatable_test.m
%
% tests setting a custom gamma table (color lookup table) by showing
% several evenly-spaced gray screens and indicating the relevant RGB value
% on the top of the screen
%
% at present, need to manually write down these values and enter/plot
%
% TCS 1/21/2020

% adventure zone
%which_gt = 'gammatable_tcs_2020-01-21.mat';

% smash ultimate
which_gt = 'gammatable_SU_2020-02-20.mat';

n_levels = 10;

mygray = round(linspace(0,255,n_levels));

w = Screen('OpenWindow',max(Screen('Screens')));
HideCursor;

gt_all = load(which_gt);
new_gt = gt_all.gammaTable1;

orig_gt = Screen('LoadNormalizedGammaTable', w, new_gt*[1 1 1]);

for ii = 1:n_levels
    
    Screen('FillRect',w,mygray(ii)*[1 1 1]);
    Screen('DrawText',w,num2str(mygray(ii)),50,50,255*[1 1 1]);
    Screen('Flip',w);
    WaitSecs(0.5);
    KbWait;
    
    
end

orig_gt2 = Screen('LoadNormalizedGammaTable', w, orig_gt);


Screen('CloseAll');
ShowCursor;