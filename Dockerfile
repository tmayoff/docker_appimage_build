ARG BASE_IMAGE
FROM $BASE_IMAGE as build-stage

COPY update.sh .
RUN ./update.sh

COPY install_deps.sh .
RUN ./install_deps.sh

ARG PROJ_NAME
RUN mkdir -p /tmp/$PROJ_NAME

ADD ./$PROJ_NAME /tmp/$PROJ_NAME

WORKDIR /tmp/$PROJ_NAME

COPY configure.sh .
RUN ./configure.sh

COPY build.sh .
RUN ./build.sh

COPY install.sh .
RUN ./install.sh

RUN mkdir -p build/AppDir/usr/share/applications
RUN mkdir -p build/AppDir/usr/share/icons
RUN mkdir -p build/AppDir/usr/bin
RUN mkdir -p build/AppDir/usr/lib

COPY PROJ_NAME.desktop AppDir/usr/share/applications/$PROJ_NAME.desktop
RUN sed -i "s/<PROJ_NAME>/$PROJ_NAME/g" AppDir/usr/share/applications/$PROJ_NAME.desktop
COPY PROJ_NAME.svg AppDir/usr/share/icons/$PROJ_NAME.svg

COPY appimage.sh .
RUN ./appimage.sh $PROJ_NAME

COPY extract.sh .
ENTRYPOINT ./extract.sh

# FROM scratch as export-stage
# ARG PROJ_NAME
# COPY --from=build-stage /tmp/$PROJ_NAME/out.AppImage .
