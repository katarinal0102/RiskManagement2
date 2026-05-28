const cds = require('@sap/cds');
const xsenv = require('@sap/xsenv');

cds.on('served', async () => {
  const provisioning = cds.services['cds.xt.SaasProvisioningService'];

  if (!provisioning) return;

  provisioning.prepend(() => {
    provisioning.on('dependencies', async (req, next) => {
      const result = await next();

      const services = xsenv.getServices({
        dest: { label: 'destination' }
      });

      const dependencies = [
        ...(Array.isArray(result) ? result : []),
        {
          xsappname: services.dest.xsappname
        }
      ];

      return dependencies;
    });
  });
});

module.exports = cds.server;