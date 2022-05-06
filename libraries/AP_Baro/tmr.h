#include <vector>
#include <numeric>
#include <math.h>
#include <algorithm>

template<typename T> 
int tmr(std::vector<T> input, T epsilon)
{
    int output = -1; // initialize to no faulty modules
    double mean, var, sd = 0.0;

    if(!input.empty())
    {
        // calculate mean
        mean = std::accumulate(input.begin(), input.end(), 0.0) / input.size();

#ifdef TMR_DEBUG
        printf("tmr_test: result %f\n", mean);
#endif

        // calculate variance
        for(T i : input)
        { 
            var += ((i - mean) * (i - mean));
        }
        
        var = var / input.size();

        // calculate standard deviation
        sd = sqrt(var);

#ifdef TMR_DEBUG
        printf("tmr_test: size %ld sd %f\n", input.size(), sd);
#endif 
        // only declare input faulty if standard deviation is greater than epsilon
        if(sd > epsilon)
        {
            // calculate each inputs distance from the mean
            for (T& i : input) i = abs(i - mean);

#ifdef TMR_DEBUG
            printf("tmr_test: dist %f %f %f\n", input.at(0), input.at(1), input.at(2));
#endif
            // declare input with maximum distance from the mean faulty
            output = std::distance(input.begin(), std::max_element(input.begin(), input.end()));

#ifdef TMR_DEBUG
            printf("tmr_test: output %d\n", output);
#endif
        }
    }
    return output;
}