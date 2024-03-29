#include <smmintrin.h> // For _mm_stream_load_si128
#include <emmintrin.h> // For _mm_mul_ps
#include <assert.h>
#include <stdint.h>

extern void saxpySerial(int N,
                        float scale,
                        float X[],
                        float Y[],
                        float result[]);

void saxpyStreaming(int N,
                    float scale,
                    float X[],
                    float Y[],
                    float result[])
{
    // Replace this code with ones that make use of the streaming instructions
    // saxpySerial(N, scale, X, Y, result);
    __m128 k = _mm_load_ps1(&scale);
    for (int i = 0; i < N; i += 4)
    {
        __m128 x = (__m128)(_mm_stream_load_si128((__m128i *)(X + i)));
        __m128 y = (__m128)(_mm_stream_load_si128((__m128i *)(Y + i)));
        x = _mm_mul_ps(x, k);
        y = _mm_add_ps(x, y);

        _mm_store_ps(result + i, y);
    }
}
