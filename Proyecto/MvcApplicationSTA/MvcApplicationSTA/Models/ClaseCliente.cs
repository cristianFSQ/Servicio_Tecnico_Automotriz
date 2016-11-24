using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplicationSTA.Models
{
    public class ClaseCliente
    {
        DataAutomotrizDataContext contextoCliente = new DataAutomotrizDataContext();

        public List<cliente>listarCliente() //Listar CLiente
        {
            List<cliente> listaCliente = new List<cliente>();
            var consultaCliente = contextoCliente.LISTAR_CLIENTE();

            foreach (var cliente in consultaCliente)
            {
                
                    cliente cli = new cliente();
                 
                    cli.CliRut = cliente.CliRut;
                    cli.CliNom = cliente.CliNom;
                    cli.CliApe = cliente.CliApe;
                    cli.CliTel = cliente.CliTel;
                    cli.CliEma = cliente.CliEma;
                    cli.CliCla = cliente.CliCla;
                    cli.CliClv = cliente.CliClv;
                
                    listaCliente.Add(cli);
                               
            }
            return listaCliente;
        }

        
        public string InsertarCliente(cliente ct) //Insertar cliente
        {
            string resultado2 = string.Empty;
            try
            {
                contextoCliente.INSERTAR_CLIENTE(ct.CliRut,ct.CliNom,ct.CliApe,ct.CliTel,ct.CliEma,ct.CliCla,ct.CliClv,ct.CliSeg,ct.CliPer);
                resultado2 = "Cliente Insertado";
            }
            catch (Exception ex)
            {
                resultado2 = ex.Message;
            }
            return resultado2;
        }
        

        
        public string InsertarVehiculo(vehiculo ve) //Insertar Vehiculo
        {
            string resultadoV = string.Empty;
            try
            {
                contextoCliente.INSERTAR_VEHICULO(ve.VerRut,ve.VehAno,ve.VehPat,ve.VehMot,ve.VehMar);
                resultadoV = "Vehiculo Insertado";
            }
            catch (Exception ex)
            {
                resultadoV = ex.Message;
            }
            return resultadoV;
        }



    }
}