using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplicationSTA.Models;

namespace MvcApplicationSTA.Controllers
{
    public class ClienteController : Controller
    {
        //
        // GET: /Cliente/

        public ClaseCliente modeloCliente = new ClaseCliente();

        public ActionResult Index()
        {
            return View(modeloCliente.listarCliente());
        }




        //controller Insertar Cliente
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(cliente c)
        {
            try
            {
                if (modeloCliente.InsertarCliente(c).Equals("OK"))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Create");
                }
            }
            catch
            {
                return View();
            }
        }


        //controller Insertar Vehiculo
        
        public ActionResult CreateV()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateV(vehiculo v)
        {
            try
            {
                if (modeloCliente.InsertarVehiculo(v).Equals("OK"))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Create");
                }
            }
            catch
            {
                return View();
            }
        }




    }
}
