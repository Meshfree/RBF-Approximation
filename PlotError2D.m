% PlotError2D (xe, ye, Pf , exact,maxerr,neval, fview)
% Generates plot of abs error for surface Pf, i.e., abs (Pf-exact)
%fview defines the view.
function PlotError2D(xe,ye,Pf,exact,maxerr,neval,fview)
    % Plot maximum error

errorplot = surf(xe,ye,reshape(abs(Pf-exact),neval,neval));
set(errorplot,'FaceColor','interp','EdgeColor','none')

%[cmin cmax] = caxis;
%caxis([cmin-.25*maxerr cmax])
view(fview);
colormap default
vcb = colorbar();
ylim(vcb,[0 maxerr])
set(get(vcb,'YLabel'),'String','Error')