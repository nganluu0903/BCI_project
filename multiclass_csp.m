function v = multiclass_csp(s,h)
pre = 3.5;
post = 6;

fs = h.SampleRate;

s = s(:, 1:22);

% print('Multiclass CSP calculated for signal, pre = %d, post = %d\n', pre, post);

c1 = trigg(s, h.TRIG(ismember(h.Classlabel, 1)), round(pre*fs), round(post*fs))';
c2 = trigg(s, h.TRIG(ismember(h.Classlabel, 2)), round(pre*fs), round(post*fs))';
c3 = trigg(s, h.TRIG(ismember(h.Classlabel, 3)), round(pre*fs), round(post*fs))';
c4 = trigg(s, h.TRIG(ismember(h.Classlabel, 4)), round(pre*fs), round(post*fs))';

ECM = cat(3,covm(c1,'E'),covm(c2,'E'), covm(c3,'E'), covm(c4,'E'));
ECM = permute(ECM,[3,1,2]);

[v,d] = csp(ECM);

end