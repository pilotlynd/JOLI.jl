############################################################
# joCoreBlock ##############################################
############################################################

export joCoreBlock, joCoreBlockException

# type definition
struct joCoreBlock{DDT,RDT} <: joAbstractLinearOperator{DDT,RDT}
    name::String
    m::Integer
    n::Integer
    l::Integer
    ms::Vector{Integer}
    ns::Vector{Integer}
    mo::Vector{Integer}
    no::Vector{Integer}
    ws::Vector{Number}
    fop::Vector{joAbstractLinearOperator}
    fop_T::Vector{joAbstractLinearOperator}
    fop_A::Vector{joAbstractLinearOperator}
    fop_C::Vector{joAbstractLinearOperator}
    iop::Nullable{Function}
    iop_T::Nullable{Function}
    iop_A::Nullable{Function}
    iop_C::Nullable{Function}
end

# type exception
struct joCoreBlockException <: Exception
    msg :: String
end

