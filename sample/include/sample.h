#include "mruby.h"

#ifndef SAMPLE_H
#define SAMPLE_H

/**
 * Sample C API module definition
 */
MRB_BEGIN_DECL

/**
 * A Sample C API method definition
 *
 * @param mrb The MRuby state.
 * @return some ruby value
 */
MRB_API mrb_value sample_api_method(mrb_state *mrb);

/**
 * Another API method, now inlined.
 *
 * @param value some ruby value
 * @return the same value
 */
MRB_INLINE mrb_value sample_inline_method(mrb_value value)
{
	return value;
}

/**
 * A sample deprecated method
 */
MRB_API mrb_deprecated void sample_deprecated_method( void );

MRB_END_DECL

#endif /* SAMPLE_H */
