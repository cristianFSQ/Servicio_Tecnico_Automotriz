using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplicationSTA.Models
{
    public class ClaseCliente
    {
        DataAutomotrizDataContext contextoCliente = new DataAutomotrizDataContext();

        public List<cliente>listarCliente(){
            List<cliente> lista = new List<cliente>();
            var consulta = contextoCliente.LISTAR_CLIENTE();
           
            foreach(var cliente in consulta){
                
                    cliente cli = new cliente();
                   // seguro seg = new seguro();
                    cli.CliRut = cliente.CliRut;
                    cli.CliNom = cliente.CliNom;
                    cli.CliApe = cliente.CliApe;
                    cli.CliTel = cliente.CliTel;
                    cli.CliEma = cliente.CliEma;
                    cli.CliCla = cliente.CliCla;
                    cli.CliClv = cliente.CliClv;

                    lista.Add(cli);
                   // lista.Add(seg);
                
               
            }
            return lista;
        }

    }
}