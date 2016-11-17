using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplicationSTA.Models;

namespace MvcApplicationSTA.Controllers
{
    public class MecanicoController : Controller
    {
        //
        // GET: /Mecanico/

        public ClaseMecanico modelo = new ClaseMecanico();

        public ActionResult Index()
        {
            return View(modelo.ListarMecanico());
        }



        //controller Insertar
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(mecanico a)
        {
            try
            {
                if (modelo.InsertarMecanico(a).Equals("OK"))
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


        public ActionResult Delete(int id)
        {
            var mecanico = modelo.BuscarMecanico(id);
            return (View(mecanico));
        }
        [HttpPost]
        public ActionResult Delete(int id,FormCollection collection)
        {
            try
            {
                if(modelo.EliminarMecanico(id).Equals("OK"))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Delete");
                }
            }
            catch
            {
                return View();
            }
        }


    }
}
