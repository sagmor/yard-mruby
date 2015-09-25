module YARD::MRuby::Handlers::C::Source
  class InitHandler < Base
    MATCH1 = /mrb_\w+_gem_init\s*\(/mx
    MATCH2 = /mrb_init_\w\s*\(/mx

    handles MATCH1
    handles MATCH2
    statement_class ToplevelStatement

    process do
      parse_block
    end

  end
end

