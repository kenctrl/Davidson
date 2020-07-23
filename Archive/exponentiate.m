function result = exponentiate(v_in,matrix,dt,subdivisions)

ddt = dt/subdivisions;
result = v_in + ddt*matrix*v_in + ddt^2/2*matrix*(matrix*v_in) + ...
    ddt^3/6*matrix*(matrix*(matrix*v_in));
for nt = 1:subdivisions-1
    result = result + ddt*matrix*result + ddt^2/2*matrix*(matrix*result) + ...
        ddt^3/6*matrix*(matrix*(matrix*result));
end