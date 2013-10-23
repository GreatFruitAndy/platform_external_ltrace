#include <search.h>
#include <string.h>

void *lsearch(const void *key, void *base, size_t *nmemb, size_t size, int(*compar)(const void *, const void *))
{
    size_t count = *nmemb;
    unsigned int i = 0;
    void* current = base;
    for (i = 0; i < count; i++) {
        current = base+(i*size);
        if (compar(current,key) == 0)
            return current;
    }
    current += size;
    memcpy( current, key, size );
    *nmemb += 1;
    return current;
}
