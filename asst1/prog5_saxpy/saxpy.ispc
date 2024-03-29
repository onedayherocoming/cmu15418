
export void saxpy_ispc(uniform int N,
                       uniform float scale,
                            uniform float X[],
                            uniform float Y[],
                            uniform float result[])
{
    foreach (i = 0 ... N) {           
        result[i] = scale * X[i] + Y[i];
    }
}
#define NM 20*1000*1000
task void saxpy_ispc_task(uniform int N,
                               uniform int span,
                               uniform float scale,
                               uniform float X[], 
                               uniform float Y[],
                               uniform float result[])
{

    uniform int indexStart = taskIndex * span;
    uniform int indexEnd = min(N, indexStart + span);
    // float cache_z[20*1000];

    foreach (i = indexStart ... indexEnd) {
        result[i] = scale * X[i] + Y[i];
    }
    // foreach(i = indexStart ... indexEnd){
    //     result[i] = cache_z[i];
    // }
}

export void saxpy_ispc_withtasks(uniform int N,
                               uniform float scale,
                               uniform float X[],
                               uniform float Y[],
                               uniform float result[])
{

    uniform int span = N / 1;  // 64 tasks

    launch[N/span] saxpy_ispc_task(N, span, scale, X, Y, result);
}
