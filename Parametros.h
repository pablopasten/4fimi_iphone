//
//  Parametros.h
//  4fimi
//
//  Created by ryc on 04-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#ifndef Parametros_h
#define Parametros_h

/********************************
 *CONFIGURACIONES DE SERVIDOR
 *******************************/

#define  HostUrl @"http://192.168.20.103:"
//#define  Port @"7010"

#define  Port @"8080"
#define  API  @"/fimi_v0/webapi/u/"



/***********************************
 * Configuraciones de Web Services
***********************************/

#define ServicioLogin @"login;"
#define ServicioHistorial @"getHistorial;"
#define ServicioCreaUsuario @"setUser;"
#define ServicioUsuario @"getUser;"
#define ServicioModificarUsuario @"modUser;"
#define ServicioEnviaPalabras @"setWord;"
#define ServicioSendPassword @"getC;"
#define ServicioNoticias @"getNoticias";
#define ServicioEditRSS @"setRedes;";
#define chartService @"getDatosGraf;";
#define getMensajesHistoricos @"getHistorial100;";
#define LoginFacebook @"lF;"




#endif /* Parametros_h */
