classdef Scorer
% Class - SCORER - Calculates the score to be stored in a scorecard based on input dice array. 
%   
% Created by Koby Taswell on 2/22/2021
% Last updated by Koby Taswell on 2/22/2021
%
% Properties:
%   - diceValues: values of input dice
%   - diceColors: colors of input dice
%   - scores: 1x15 array of all scores
%
%
    properties (GetAccess = private)
        diceValues;
        diceColors;
    end
    
    properties (Dependent)
        scores;
    end
    
    methods
        %Constructor
        function obj = Scorer(values, colors)
            if(nargin == 2)
               obj.diceValues = values;
               obj.diceColors = colors;
            end
        end
        
        %full score array
        function scores = get.scores(obj)
            scores = [obj.scoreBasicSection(), obj.scoreTwoPair(), obj.scoreThreeKind(), ...
                obj.scoreStraight(), obj.scoreFlush(), obj.scoreFullHouse(),...
                obj.scoreFullHouseSameColor(), obj.scoreFourKind(), obj.scoreYarborough(),...
                obj.scoreKismet()];
        end
    end
    
    %Individual Scoring Sections
    %Public for testing prior to all 
    methods 
        %Basic section
        function basicSection = scoreBasicSection(obj)
            %TODO: Wahhaj
            basicSection = [];
        end
        
        function twoPairScore = scoreTwoPair(obj)
            %TODO: Edison
            twoPairScore = [];
        end
        
        function threeKindScore = scoreThreeKind(obj)
            %TODO: Edison
            threeKindScore = [];
        end
        
        function straightScore = scoreStraight(obj)
            %TODO: Edison
            straightScore = [];
        end
        
        function flushScore = scoreFlush(obj)
            %TODO: Edison
            flushScore = [];
        end
        
        function fullHouseScore = scoreFullHouse(obj)
            %TODO: Koby
            uniques = unique(obj.diceValues);
            
            test = (length(uniques) == 2);
            counts = sort(countOccurences(uniques, obj.diceValues));
            
            if(test && (all(counts == [2, 3])))
                fullHouseScore = sum(obj.diceValues) + 15;
            else 
                fullHouseScore = -1;
            end
        end
        
        function fullHouseSameColorScore = scoreFullHouseSameColor(obj)
            %TODO: Koby
            uniqueVal = unique(obj.diceValues);
            uniqueColors = unique(obj.diceColors);
            
            test = (length(uniqueVal) == 2) && (length(uniqueColors) == 1);
            counts = sort(countOccurences(uniqueVal, obj.diceValues));
            
            if(test && (all(counts == [2, 3])))
                fullHouseSameColorScore = sum(obj.diceValues) + 20;
            else 
                fullHouseSameColorScore = -1;
            end
        end
        
        function fourKindScore = scoreFourKind(obj)
            %TODO: Koby
            uniqueVal = unique(obj.diceValues);
            counts = countOccurences(uniqueVal, obj.diceValues);
            
            test = ismember(4, counts);
            
            if(test)
                fourKindScore = sum(obj.diceValues) + 25;
            else
                fourKindScore = -1;
            end
        end
        
        function yarboroughScore = scoreYarborough(obj)
            %TODO: Koby
            yarboroughScore = sum(obj.diceValues);
        end
        
        function kismetScore = scoreKismet(obj)
            %TODO: Koby
            uniqueVal = unique(obj.diceValues);
            
            test = (length(uniqueVal) == 1);
            
            if(test)
                kismetScore = sum(obj.diceValues) + 50;
            else
                kismetScore = -1;
            end
        end
    end
end