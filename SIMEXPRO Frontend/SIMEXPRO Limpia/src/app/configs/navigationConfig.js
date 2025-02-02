import i18next from 'i18next';
import '@material-ui/icons';
import ar from './navigation-i18n/ar';
import en from './navigation-i18n/en';
import tr from './navigation-i18n/tr';
import LocationCityOutlinedIcon from '@mui/icons-material/LocationCityOutlined';

i18next.addResourceBundle('en', 'navigation', en);
i18next.addResourceBundle('tr', 'navigation', tr);
i18next.addResourceBundle('ar', 'navigation', ar);

const navigationConfig = [
    {
        id: 'Inicio',
        title: 'Inicio',
        type: 'group',
        icon: 'heroicons-outline:home',
        translate: 'INICIO',
        children: [
          {
            id: 'Inicio.Inicio',
            title: 'Inicio',
            type: 'item',
            icon: 'heroicons-outline:clipboard-check',
            url: '/Inicio/project',
          },
          {
            id: 'Inicio.Graficas',
            title: 'Gráficas',
            type: 'item',
            icon: 'heroicons-outline:chart-pie',
            url: '/Inicio/Graficas',
          },
          {
            id: 'Inicio.Reportes',
            title: 'Reportes',
            type: 'item',
            icon: 'heroicons-outline:cash',
            url: '/Inicio/Reportes',
          },
          
        ],
      },
      {
        id: 'Seguridad',
        title: 'Seguridad',
        type: 'group',
        icon: 'material-outline:content_cut',
        translate: 'SEGURIDAD',
        children: [
            {
                id: 'apps.ecommerce',
                title: 'ECommerce',
                type: 'collapse',
                icon: 'material-outline:content_cut',
                translate: 'Seguridad',
                children: [
                    {
                        id: 'Seguridad.Usuarios',
                        title: 'Usuarios',
                        type: 'item',
                        icon: 'material-outline:hail',
                        url: '/Seguridad/Usuarios',
                    },
                    {
                        id: 'Seguridad.Roles',
                        title: 'Roles',
                        type: 'item',
                        icon: 'material-outline:manage_search',
                        url: '/Seguridad/Roles',
                    },
             
                ]
            },
  
        ],
    },
    {

        id: 'Generales',
        title: 'Generales',
        type: 'group',
        icon: 'heroicons-outline:home',
        translate: 'GENERALES',
        children: [
            {
                id: 'Generales.Generales',
                title: 'ECommerce',
                type: 'collapse',
                icon: 'heroicons-outline:bookmark-alt',
                translate: 'Generales',
                children: [


                    {
                        id: 'Generales.documentos',
                        title: 'Documentos',
                        type: 'item',
                        icon: 'material-outline:feed',
                        url: '/Generales/Documentos',
                    },


                    {
                        id: 'Generales.formas_envio',
                        title: 'Formas de envío',
                        type: 'item',
                        icon: 'material-outline:taxi_alert',
                        url: '/Generales/FormasEnvio',
                    },
                    {
                        id: 'Generales.monedas',
                        title: 'Monedas',
                        type: 'item',
                        icon: 'material-outline:attach_money',
                        url: '/Generales/Monedas',
                    },

                    {
                        id: 'Generales.unidades_de_medida',
                        title: 'Unidades de Medida',
                        type: 'item',
                        icon: 'material-outline:device_thermostat',
                        url: '/Generales/UnidadesMedidas',
                    }
                ],
            },
            {
                id: 'general.ubicaciones',
                title: 'Ubicaciones',
                type: 'collapse',
                icon: 'material-outline:public',
                translate: 'Ubicaciones',
                children: [
                    {
                        id: 'Ubicaciones.aldeas',
                        title: 'Aldeas',
                        type: 'item',
                        icon: 'material-outline:cabin',
                        url: '/Ubicaciones/Aldeas',
                    },
                    {
                        id: 'Ubicaciones.ciudades',
                        title: 'Ciudades',
                        type: 'item',
                        icon: 'material-outline:business',
                        url: '/Ubicaciones/Ciudades',
                    },

                    {
                        id: 'Ubicaciones.colonias',
                        title: 'Colonias',
                        type: 'item',
                        icon: 'material-outline:holiday_village',
                        url: '/Ubicaciones/Colonias',
                    },
                    {
                        id: 'Ubicaciones.paises',
                        title: 'Países',
                        type: 'item',
                        icon: 'material-outline:map',
                        url: '/Ubicaciones/Paises',
                    }, {
                        id: 'Ubicaciones.provincias',
                        title: 'Provincias',
                        type: 'item',
                        icon: 'material-outline:house',
                        url: '/Ubicaciones/Provincias',
                    },
                ],
            },
            {
                id: 'general.Personas',
                title: 'Personas',
                type: 'collapse',
                icon: 'material-outline:emoji_people',
                translate: 'Personas',
                children: [
                    {
                        id: 'Personas.cargos',
                        title: 'Cargos',
                        type: 'item',
                        icon: 'material-outline:cleaning_services',
                        url: '/Personas/Cargos',
                    },
                    {
                        id: 'Personas.Clientes',
                        title: 'Clientes',
                        type: 'item',
                        icon: 'material-outline:groups',
                        url: '/Personas/Clientes',
                    },

                    {
                        id: 'Personas.empleados',
                        title: 'Empleados',
                        type: 'item',
                        icon: 'material-outline:nature_people',
                        url: '/Personas/Empleados',
                    },

                    {
                        id: 'Personas.estados_civiles',
                        title: 'Estados Civiles',
                        type: 'item',
                        icon: 'material-outline:male',
                        url: '/Personas/EstadosCiviles',
                    }, {
                        id: 'Personas.oficinas',
                        title: 'Oficinas',
                        type: 'item',
                        icon: 'material-outline:computer',
                        url: '/Personas/Oficinas',
                    },
                    {
                        id: 'Personas.oficios_profesiones',
                        title: 'Oficios y Profesiones',
                        type: 'item',
                        icon: 'heroicons-outline:academic-cap',
                        url: '/Personas/OficiosProfesiones',
                    },

                    {
                        id: 'Personas.proveedores',
                        title: 'Proveedores ',
                        type: 'item',
                        icon: 'material-outline:local_shipping',
                        url: '/Personas/Proveedores',
                    },

                ],
            },
            {
                id: 'general.prendas',
                title: 'Prendas',
                type: 'collapse',
                icon: 'material-outline:checkroom',
                translate: 'Prendas',
                children: [
                    {
                        id: 'Prendas.Colores',
                        title: 'Colores',
                        type: 'item',
                        icon: 'material-outline:format_color_fill'  ,
                        url: '/Prendas/Colores',
                    },

                    {
                        id: 'Prendas.Estilos',
                        title: 'Estilos',
                        type: 'item',
                        icon: 'material-outline:design_services',
                        url: '/Prendas/Estilos',
                    },

                    {
                        id: 'Prendas.Modelos',
                        title: 'Modelos',
                        type: 'item',
                        icon: 'material-outline:document_scanner',
                        url: '/Prendas/Modelos',
                    }, {
                        id: 'Prendas.Tallas',
                        title: 'Tallas',
                        type: 'item',
                        icon: 'material-outline:dry_cleaning',
                        url: '/Prendas/Tallas',
                    }
                ],
            }


        ]
    },
    {
        id: 'Produccion',
        title: 'Produccion',
        type: 'group',
        icon: 'material-outline:content_cut',
        translate: 'PRODUCCIÓN',
        children: [
            {
                id: 'apps.ecommerce',
                title: 'ECommerce',
                type: 'collapse',
                icon: 'material-outline:content_cut',
                translate: 'Producción',
                children: [
                    {
                        id: 'Produccion.AsignacionesModulo',
                        title: 'Asignaciones de Módulo',
                        type: 'item',
                        icon: 'material-outline:hail',
                        url: '/Produccion/AsignacionesModulo',
                    },
                    {
                        id: 'Produccion.Inspecciones',
                        title: 'Inspecciones',
                        type: 'item',
                        icon: 'material-outline:manage_search',
                        url: '/Produccion/Inspecciones',
                    },
                    {
                        id: 'Produccion.Modulos',
                        title: 'Módulos',
                        type: 'item',
                        icon: 'material-outline:iron',
                        url: '/Produccion/Modulos',
                    },
                    {
                        id: 'Produccion.Multifuncional',
                        title: 'Multifuncional',
                        type: 'item',
                        icon: 'material-outline:insights',
                        url: '/Produccion/Multifuncional',
                    },
                    {
                        id: 'Produccion.OrdenCompra',
                        title: 'Órden de Compra',
                        type: 'item',
                        icon: 'material-outline:library_books',
                        url: '/Produccion/OrdenCompra',
                    },
                    {
                        id: 'Produccion.PedidosProduccion',
                        title: 'Pedidos de Producción',
                        type: 'item',
                        icon: 'material-outline:local_mall',
                        url: '/Produccion/PedidosProduccion',
                    },
                    {
                        id: 'Produccion.Procesos',
                        title: 'Procesos',
                        type: 'item',
                        icon: 'material-outline:mediation',
                        url: '/Produccion/Procesos',
                    },
                    {
                        id: 'Produccion.RevisionCalidad',
                        title: 'Revisión de Calidad',
                        type: 'item',
                        icon: 'material-outline:pageview',
                        url: '/Produccion/RevisionCalidad',
                    },
                    {
                        id: 'Produccion.RevisionModuloDia',
                        title: 'Revision de Módulo',
                        type: 'item',
                        icon: 'material-outline:recycling',
                        url: '/Produccion/RevisionModuloDia',
                    },
                ]
            },
            {
                id: 'Produccion.Maquinaria',
                title: 'Maquinaria',
                type: 'collapse',
                icon: 'material-outline:account_tree   ',
                translate: 'Maquinaria',
                children: [
                    {
                        id: 'Maquinaria.MaquinaHistorial',
                        title: 'Historial de Máquina',
                        type: 'item',
                        icon: 'material-outline:all_inbox',
                        url: '/Maquinaria/MaquinaHistorial',
                    },
                    {
                        id: 'Maquinaria.MaquinaModulos',
                        title: 'Módulo de Máquina',
                        type: 'item',
                        icon: 'material-outline:animation',
                        url: '/Maquinaria/MaquinaModulos',
                    },
                    {
                        id: 'Maquinaria.MarcasMaquina',
                        title: 'Marcas de Máquinas',
                        type: 'item',
                        icon: 'material-outline:auto_stories',
                        url: '/Maquinaria/MarcasMaquina',
                    },
                    {
                        id: 'Maquinaria.ModelosMaquina',
                        title: 'Modelos de Máquinas',
                        type: 'item',
                        icon: 'material-outline:biotech',
                        url: '/Maquinaria/ModelosMaquina',
                    },
                    {
                        id: 'Maquinaria.FuncionesMaquina',
                        title: 'Funciones de Máquinas',
                        type: 'item',
                        icon: 'material-outline:bike_scooter',
                        url: '/Maquinaria/FuncionesMaquina',
                    },
                ]
            },
            {
                id: 'Produccion.Inventario',
                title: 'Inventario',
                type: 'collapse',
                icon: 'material-outline:store',
                translate: 'Inventario',
                children: [
                    {
                        id: 'Inventario.Categorias',
                        title: 'Categorías',
                        type: 'item',
                        icon: 'material-outline:category',
                        url: '/Inventario/Categorias',
                    },
                    {
                        id: 'Inventario.Lotes',
                        title: 'Lotes',
                        type: 'item',
                        icon: 'material-outline:card_membership',
                        url: '/Inventario/Lotes',
                    },
                    {
                        id: 'Inventario.Materiales',
                        title: 'Materiales',
                        type: 'item',
                        icon: 'material-outline:bakery_dining',
                        url: '/Inventario/Materiales',
                    },
                    {
                        id: 'Inventario.MaterialesBrindar',
                        title: 'Materiales a Brindar',
                        type: 'item',
                        icon: 'material-outline:business_center',
                        url: '/Inventario/MaterialesBrindar',
                    },
                    {
                        id: 'Inventario.PedidosOrden',
                        title: 'Órden de Pedido',
                        type: 'item',
                        icon: 'material-outline:fact_check',
                        url: '/Inventario/PedidosOrden',
                    },
                    {
                        id: 'Inventario.Subcategorias',
                        title: 'Subcategorías',
                        type: 'item',
                        icon: 'material-outline:apps',
                        url: '/Inventario/Subcategorias',
                    },
                    {
                        id: 'Inventario.TipoEmbalaje',
                        title: 'Tipo de Embalaje',
                        type: 'item',
                        icon: 'material-outline:integration_instructions',
                        url: '/Inventario/TipoEmbalaje',
                    },
                ]
            }
        ],
    },



];

export default navigationConfig;
