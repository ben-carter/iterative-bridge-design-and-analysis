function toughness = calculateToughness(displacement, load, failurePoint)
    toughness = 0;
    
    for i=2:length(displacement)
        dDisplacement = ((displacement(i)-(displacement(i-1)))); %Calculate the distance between the two points
        averageLoad = (load(i)+load(i-1))/2;                     %Calculate the average load across those two points
        toughness = toughness + averageLoad*dDisplacement;       %Add product to total toughness
        if(displacement(i) >= failurePoint)
            break;
        end
            
    end


 



end
