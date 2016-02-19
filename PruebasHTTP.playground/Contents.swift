//: Playground - noun: a place where people can play

import UIKit


let urls = "http://www.google.com/"

func sincrono(){
    let url = NSURL(string: urls)
    let datos:NSData? = NSData(contentsOfURL: url!)
    let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
    
    print (texto!)
}
func asincrono(){
    let url = NSURL(string: urls)
    let sesion = NSURLSession.sharedSession()
    let bloque = { (datos: NSData? , resp: NSURLResponse?, error: NSError?) -> Void in
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        print (texto!)
    }
    
    let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
    dt.resume()
    print("antes o despues2")
}

//sincrono()
asincrono()

// En las nuevas versiones de iOS el acceso a Internet se encuentra restringido. Más que una cuestión de prevenir cobros por el acceso a Internet (como se menciona en el video) es una cuestión de seguridad en cuanto a la confidencialidad de los datos que se transmiten .
// Si se utiliza el protocolo https, no se tendrá ningún problema y no es necesario modificar las propiedades del proyecto. En el caso de que se requiera utilizar http, es decir, sin el cifrado de datos, es necesario especificar un atributo en la lista de propiedades de la aplicación.
// El archivo info.plist presente en toda aplicación, contiene una lista de propiedades que se aplican a todo el proyecto en cuestión. En ese archivo, se deberá incluir al final del mismo cualquiera de las siguientes propiedades:

/*
<key>NSAppTransportSecurity</key>
<dict>
    <!--Permite todas las conexiones (cuidado) -->
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
*/

//ó

/*
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
<dict>
<key>www.google.com</key>
<dict>
    <!--Incluir todos los subdominios-->
    <key>NSIncludesSubdomains</key>
    <true/>
    <!--Para que se pueda realizar peticiones HTTP-->
    <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
    <true/>
</dict>

La primera permite el acceso inseguro a un sitio particular y la segunda permite el acceso inseguro a todo servidor
*/
