/* ** Main Configurations ** */

#pragma option -d3
//#pragma dynamic 7200000*/
#pragma warning	disable 214, 239
#pragma compat 1
#define CGEN_MEMORY 50000
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_CACHE_MESSAGE
//#define DEBUG_MODE

#if defined DEBUG_MODE
	#pragma option -d3
#endif

/* ** SA-MP Includes ** */
#include 							< a_samp >