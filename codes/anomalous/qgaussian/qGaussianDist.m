function qGaussian = qGaussianDist(nSamples, q1)
% -------------------------------------------------------------------------
% Generate random deviates from a q-Gaussian distribution using the
% generalized Box–Muller method (Thistleton, Nelson, Marsh, Tsallis, 2006).
%
% Reference:
% W. Thistleton, K. Nelson, J. A. Marsh, C. Tsallis,
% "Generalized Box-Muller method for generating q-Gaussian random deviates",
% arXiv:cond-mat/0605570, DOI: 10.48550/arXiv.cond-mat/0605570
%
% Inputs
%   nSamples : number of samples to generate (positive integer)
%   q1       : Tsallis parameter in your notation; internally mapped to
%              q = (1 + q1) / (3 - q1) for the q-log transform below
%
% Output
%   qGaussian : 1-by-nSamples row vector of q-Gaussian deviates
%
% Notes
% - This implementation returns one deviate per (u1,u2) pair (sine branch),
%   mirroring the classic Box–Muller "one-output" variant for simplicity.
% - log_q handles the q -> 1 limit by falling back to the natural logarithm.
% - Uniforms are clipped away from 0/1 to avoid numerical issues in log_q.
% - Valid ranges: typically q1 < 3 (so that denominator 3 - q1 > 0).
% -------------------------------------------------------------------------

% Basic input checks (kept lightweight)
if nargin < 2
    error('qGaussianDist:NotEnoughInputs', 'Provide nSamples and q1.');
end
if ~isscalar(nSamples) || nSamples <= 0 || ~isfinite(nSamples)
    error('qGaussianDist:BadNSamples', 'nSamples must be a positive scalar.');
end

% Map to the q used inside the q-logarithm (as in your original code)
q = (1 + q1) / (3 - q1);

% Preallocate output (row vector)
qGaussian = zeros(1, nSamples);

% Draw uniforms in (0,1) and gently clip away from endpoints for stability
% (avoids x=0 in log_q)
u1 = rand(1, nSamples);
u2 = rand(1, nSamples);
eps_clip = eps;                 % machine epsilon
u1 = min(max(u1, eps_clip), 1 - eps_clip);

% Generalized Box–Muller radius from q-log
R = sqrt(-2 * log_q(u1, q));

% Angle and final q-Gaussian deviate (sine branch)
theta = 2 * pi * u2;
qGaussian = R .* sin(theta);

end

% ========================== helper function ==============================

function a = log_q(x, q)
% q-logarithm of x for parameter q:
%   log_q(x) = (x^(1-q) - 1) / (1 - q)   for q ~= 1
%            = log(x)                    for q  -> 1
%
% Numerics: treat the q->1 case using a small tolerance based on eps.

if abs(q - 1) < 10 * eps
    a = log(x);
else
    a = (x.^(1 - q) - 1) ./ (1 - q);
end
end
