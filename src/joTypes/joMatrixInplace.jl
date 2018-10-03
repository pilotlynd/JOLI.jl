############################################################
# joMatrixInplace ##########################################
############################################################

export joMatrixInplace, joMatrixInplaceException

# type definition
"""
joMatrixInplace type

# TYPE PARAMETERS
- DDT::DataType : domain DataType
- RDT::DataType : range DataType

# FIELDS
- name::String : given name
- m::Integer : # of rows
- n::Integer : # of columns
- fop::Function : forward matrix
- fop_T::Function : transpose matrix
- fop_A::Function : adjoint matrix
- iop::Nullable{Function} : inverse for fop
- iop_T::Nullable{Function} : inverse for fop_T
- iop_A::Nullable{Function} : inverse for fop_A

"""
struct joMatrixInplace{DDT<:Number,RDT<:Number} <: joAbstractLinearOperatorInplace{DDT,RDT}
    name::String
    m::Integer
    n::Integer
    fop::Function    # forward
    fop_T::Function  # transpose
    fop_A::Function  # adjoint
    iop::Nullable{Function}
    iop_T::Nullable{Function}
    iop_A::Nullable{Function}
end

# type exception
struct joMatrixInplaceException <: Exception
    msg :: String
end

