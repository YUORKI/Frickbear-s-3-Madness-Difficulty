disable_camera(0.1);
disable_doors(0.1);
disable_fan(0.1);
disable_flashlight(0.1);
global.Temperature = 0;

if (instance_exists(oSalvage))
    instance_destroy();

instance_destroy(oSpringtrap);
instance_destroy(oLefty);
instance_destroy(oScrapBaby);
instance_destroy(oMoltenFreddy);
