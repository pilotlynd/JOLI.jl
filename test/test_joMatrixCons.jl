T=6
tsname="joMatrixCons"
@testset "$tsname" begin
for t=1:T # start test loop

    if t<=2
        (m,n)=(5,5)
    else
        (m,n)=(rand(3:7),rand(3:7))
    end

    if t%2==1
        tname="loop $t for real($m,$n)"
        a=rand()
        v=rand(n)
    else
        tname="loop $t for complex($m,$n)"
        a=rand(Complex{Float64})
        v=rand(Complex{Float64},n)
    end

    println("$tsname $tname")
    @testset "$m x $n" begin

    @test norm(double(joZeros(m,n))-zeros(m,n)) < joTol
    @test norm(double(joZeros(m,n).')-zeros(m,n).') < joTol
    @test norm(double(joZeros(m,n)')-zeros(m,n)') < joTol
    @test norm(double(conj(joZeros(m,n)))-conj(zeros(m,n))) < joTol

    @test norm(double(joOnes(m,n))-ones(m,n)) < joTol
    @test norm(double(joOnes(m,n).')-ones(m,n).') < joTol
    @test norm(double(joOnes(m,n)')-ones(m,n)') < joTol
    @test norm(double(conj(joOnes(m,n)))-conj(ones(m,n))) < joTol

    @test norm(double(joConstants(m,n,a))-(a*ones(m,n))) < joTol
    @test norm(double(joConstants(m,n,a).')-(a*ones(m,n)).') < joTol
    @test norm(double(joConstants(m,n,a)')-(a*ones(m,n))') < joTol
    @test norm(double(conj(joConstants(m,n,a)))-(conj(a*ones(m,n)))) < joTol

    @test norm(double(joDirac(m))-eye(m)) < joTol
    @test norm(double(joDirac(m).')-eye(m).') < joTol
    @test norm(double(joDirac(m)')-eye(m)') < joTol
    @test norm(double(conj(joDirac(m)))-conj(eye(m))) < joTol

    @test norm(double(joEye(m,n))-eye(m,n)) < joTol
    @test norm(double(joEye(m,n).')-eye(m,n).') < joTol
    @test norm(double(joEye(m,n)')-eye(m,n)') < joTol
    @test norm(double(conj(joEye(m,n)))-conj(eye(m,n))) < joTol

    @test norm(double(joDiag(v))-diagm(v)) < joTol
    @test norm(double(joDiag(v).')-diagm(v).') < joTol
    @test norm(double(joDiag(v)')-diagm(v)') < joTol
    @test norm(double(conj(joDiag(v)))-conj(diagm(v))) < joTol

    #joVecConvert.jl
    if t%2==0

        @test norm(joReal(n)*v-real(v)) < joTol
        @test norm(joReal(n).'*real(v)-complex(real(v))) < joTol
        @test norm(joReal(n)'*real(v)-complex(real(v))) < joTol
        @test norm(conj(joReal(n))*v-real(v)) < joTol

        @test norm(joImag(n)*v-imag(v)) < joTol
        @test norm(joImag(n).'*imag(v)-complex(0.,imag(v))) < joTol
        @test norm(joImag(n)'*imag(v)-complex(0.,-imag(v))) < joTol
        @test norm(conj(joImag(n))*v-imag(-v)) < joTol

        @test norm(joConj(n)*v-conj(v)) < joTol
        @test norm(joConj(n).'*v-conj(v)) < joTol
        @test norm(joConj(n)'*v-conj(v)) < joTol
        @test norm(conj(joConj(n))*v-conj(v)) < joTol

    end

    end

end # end test loop
end