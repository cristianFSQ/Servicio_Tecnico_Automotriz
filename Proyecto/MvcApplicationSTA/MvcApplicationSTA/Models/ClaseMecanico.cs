using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplicationSTA.Models
{
    
    public class ClaseMecanico
    {
        DataAutomotrizDataContext contextoMecanico = new DataAutomotrizDataContext();

        public List<mecanico> ListarMecanico() //Listar Mecanico
        {
            List<mecanico> lista = new List<mecanico>();
            var consulta = contextoMecanico.LISTAR_MECANICO();
            foreach (var mecanico in consulta)
            {
                mecanico a = new mecanico();
                a.MecRut = mecanico.MecRut;
                a.MecCla = mecanico.MecCla;
                a.MecClv = mecanico.MecClv;
                a.MecNom = mecanico.MecNom;
                a.MecApe = mecanico.MecApe;
                a.MecFon = mecanico.MecFon;
                a.MecCor = mecanico.MecCor;
                lista.Add(a);
            }
            return lista;
        }


        public string InsertarMecanico(mecanico a) //Insertar Mecanico
        {
            string resultado = string.Empty;
            try
            {
                contextoMecanico.INSERTAR_MECANICO(a.MecRut, a.MecCla, a.MecClv, a.MecNom, a.MecApe, a.MecFon, a.MecCor,a.MecUid=2);
                resultado = "Insertado";
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }
            return resultado;
        }



        public string EliminarMecanico(int codigo) //Eliminar Mecanico
        {
            string resultado = string.Empty;
            try
            {
                contextoMecanico.ELIMINAR_MECANICO(codigo);
                resultado = codigo + "Eliminado";
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }
            return resultado;
        }


        public mecanico BuscarMecanico(int codigo) //Buscar Mecanico
        {
            mecanico a = new mecanico();
            try
            {
                var consulta = contextoMecanico.BUSCAR_MECANICO(codigo);
                foreach(var mecanico in consulta){
                    a.MecID = mecanico.MecID;

                }
            }
            catch (Exception)
            {
                throw;
            }
            return a;
        }


    }

}