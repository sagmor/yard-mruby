#include "sample.h"

mrb_value sample_api_method(mrb_state *mrb)
{
  return mrb_nil_value();
}

void sample_deprecated_method( void )
{
}

/**
 * A sample Ruby method defined from C
 *
 * @return [String] Hello World!
 */
mrb_value mrb_Sample_Hello__world(mrb_state *mrb, mrb_value self)
{
  return sample_inline_method( mrb_str_new_cstr(mrb, "Hello World!" ) );
}

void
mrb_sample_gem_init(mrb_state *mrb)
{
  struct RClass *ns = mrb_define_module(mrb, "Sample");
  struct RClass *cl = mrb_define_class_under(mrb, ns, "Hello", mrb->object_class);
  mrb_define_method(mrb,cl, "world", mrb_Sample_Hello__world, MRB_ARGS_NONE() );
}

void
mrb_sample_gem_final(mrb_state *mrb)
{
  // Your C finalization code goes here
}
