############################################################
## joLinearFunction - outer constructors

joLinearFunctionAll(m::Integer,n::Integer,
    fop::Function,fop_T::Function,fop_CT::Function,fop_C::Function,
    iop::Function,iop_T::Function,iop_CT::Function,iop_C::Function,
    EDT::DataType,DDT::DataType=EDT,RDT::DataType=promote_type(EDT,DDT);
    name::String="joLinearFunctionAll") =
        joLinearFunction{EDT,DDT,RDT}(name,m,n,
            fop,fop_T,fop_CT,fop_C,
            iop,iop_T,iop_CT,iop_C
            )
joLinearFunctionT(m::Integer,n::Integer,
    fop::Function,fop_T::Function, iop::Function,iop_T::Function,
    EDT::DataType,DDT::DataType=EDT,RDT::DataType=promote_type(EDT,DDT);
    name::String="joLinearFunctionT") =
        joLinearFunction{EDT,DDT,RDT}(name,m,n,
            fop,
            fop_T,
            v3->conj(fop_T(conj(v3))),
            v4->conj(fop(conj(v4))),
            iop,
            iop_T,
            v7->conj(iop_T(conj(v7))),
            v8->conj(iop(conj(v8)))
            )
joLinearFunctionCT(m::Integer,n::Integer,
    fop::Function,fop_CT::Function, iop::Function,iop_CT::Function,
    EDT::DataType,DDT::DataType=EDT,RDT::DataType=promote_type(EDT,DDT);
    name::String="joLinearFunctionCT") =
        joLinearFunction{EDT,DDT,RDT}(name,m,n,
            fop,
            v2->conj(fop_CT(conj(v2))),
            fop_CT,
            v4->conj(fop(conj(v4))),
            iop,
            v6->conj(iop_CT(conj(v6))),
            iop_CT,
            v8->conj(iop(conj(v8)))
            )
joLinearFunctionFwdT(m::Integer,n::Integer,
    fop::Function,fop_T::Function,
    EDT::DataType,DDT::DataType=EDT,RDT::DataType=promote_type(EDT,DDT);
    name::String="joLinearFunctionFwdT") =
        joLinearFunction{EDT,DDT,RDT}(name,m,n,
            fop,
            fop_T,
            v3->conj(fop_T(conj(v3))),
            v4->conj(fop(conj(v4))),
            @joNF, @joNF, @joNF, @joNF
            )
joLinearFunctionFwdCT(m::Integer,n::Integer,
    fop::Function,fop_CT::Function,
    EDT::DataType,DDT::DataType=EDT,RDT::DataType=promote_type(EDT,DDT);
    name::String="joLinearFunctionFwdCT") =
        joLinearFunction{EDT,DDT,RDT}(name,m,n,
            fop,
            v2->conj(fop_CT(conj(v2))),
            fop_CT,
            v4->conj(fop(conj(v4))),
            @joNF, @joNF, @joNF, @joNF
            )
