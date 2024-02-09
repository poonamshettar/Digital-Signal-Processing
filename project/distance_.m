function dtwDistance=distance_(c1,c2)
if any(isnan(c1(:))) || any(isinf(c1(:))) || any(isnan(c2(:))) || any(isinf(c2(:)))
    disp('MFCC matrices contain NaN or infinite values.');

    % Replace NaN and infinite values with zeros
    c1(isnan(c1) | isinf(c1)) = 0;
    c2(isnan(c2) | isinf(c2)) = 0;

    % Compute DTW distance
    dtwDistance = dtw(c1, c2);
    disp(['DTW Distance: ', num2str(dtwDistance)]);
else
    % Compute DTW distance directly
    dtwDistance = dtw(c1, c2);
    disp(['DTW Distance: ', num2str(dtwDistance)]);
end