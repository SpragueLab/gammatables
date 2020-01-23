% reset_gammatable.m
%
% set monitor/GPU gammatable to default gamma table
%
% reset_gammatable - use the 'default' gamma table for each testing room
%
% reset_gammatable('mygammatable.mat') - where 'mygammatable.mat' contains
% a gamma table in the variable 'orig_gt', uses the gammatable in this file
% to reset GPU gamma table
%
% prev_gt = reset_gammatable([,newtable]) returns whatever the previous gammatable was
%
% TCS 1/23/2020

function prev_gt = reset_gammatable(which_gt)

if nargin < 1 || isempty(which_gt)
    % look up which computer we're on
    % AZ: TCS-XPS
    this_computer = getenv('computername');
    
    if strcmpi(this_computer,'TCS-XPS') % AZ
        which_gt = 'defaultgamma_AZ_2020-01-21.mat';
    else
        error('Unrecognized computer - define gamma table file in input');
    end
end

w = Screen('OpenWindow',max(Screen('Screens')));


gt = load(which_gt);


prev_gt = Screen('LoadNormalizedGammaTable', w, gt.orig_gt);

WaitSecs(0.5);

Screen('CloseAll');


return