#pragma once

#define IMAGINE_VERSION_BASE "1.4.30"

#ifdef NDEBUG
	#define IMAGINE_VERSION IMAGINE_VERSION_BASE
#else
	#define IMAGINE_VERSION IMAGINE_VERSION_BASE "D"
#endif
