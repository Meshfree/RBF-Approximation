% PlotSurf(xe , ye, Pf,neval,exact,maxerr,fview)
% Generates plo t of surface Pf fals e colored by the
% maximum erro r abs(Pf-exact)
% fview defines the view.
function PlotSurf(xe,ye,Pf,neval,exact,maxerr,fview)
% Plot surface

Pfplot = surf(xe,ye,reshape(Pf,neval,neval),reshape(abs(Pf-exact),neval,neval)) ;
set(Pfplot,'FaceColor' ,'interp','EdgeColor','none');
%[cmin, cmax] = caxis;
%caxis([cmin-.25*maxerr cmax]);
view(fview);

colormap winter
%vcb = colorbar('vert') ;
vcb = colorbar() ;
ylim(vcb,[0 maxerr])
set(get(vcb,'YLabel'),'String','Error' )


