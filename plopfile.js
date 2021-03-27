const _ = require('lodash');

module.exports = plop => {
  const prompts = {
    platformName: {
      type: 'input',
      name: 'platformName',
      message: 'Enter the platform name:',
    },
	privateip: {
      type: 'input',
      name: 'privateip',
      message: 'Enter the machine private IP:',
    },
    subDomain: {
      type: 'input',
      name: 'subDomain',
      message: 'Enter the sub-domain name:',
    },
    cmsDomain: {
      type: 'input',
      name: 'cmsDomain',
      message: 'Enter the cms-domain name:',
    },
    emailUser: {
      type: 'input',
      name: 'emailUser',
      message: 'Enter system user\'s email:',
      default: 'no-reply@foundercore.org',
    },
    emailPassword: {
      type: 'input',
      name: 'emailPassword',
      message: 'Enter system user\'s password:',
      default: 'alcore-team-2020',
    }
  }

  const actions = {
    cmsEnv: {
      type: 'add',
      path: 'local/configurations/cms.env.json',
      templateFile: 'templates/configurations/cms.env.json.hbs',
    },
    cmsAuth: {
      type: 'add',
      path: 'local/configurations/cms.auth.json',
      templateFile: 'templates/configurations/cms.auth.json.hbs',
    },
    lmsEnv: {
      type: 'add',
      path: 'local/configurations/lms.env.json',
      templateFile: 'templates/configurations/lms.env.json.hbs',
    },
    lmsAuth: {
      type: 'add',
      path: 'local/configurations/lms.auth.json',
      templateFile: 'templates/configurations/lms.auth.json.hbs',
    }
  }

  if (!_.isEmpty(process.env.PLATFORM_NAME)) {
    delete prompts.platformName;
  }

  if (!_.isEmpty(process.env.SUB_DOMAIN)) {
    delete prompts.subDomain;
  }
  
  if (!_.isEmpty(process.env.CMS_DOMAIN)) {
    delete prompts.cmsDomain;
  }
  
  if (!_.isEmpty(process.env.privateip)) {
    delete prompts.privateip;
  }

  if (!_.isEmpty(process.env.EMAIL_USER)) {
    delete prompts.subDomain;
  }

  if (!_.isEmpty(process.env.EMAIL_PASSWORD)) {
    delete prompts.subDomain;
  }

  plop.setGenerator('configManager', {
    description: 'alcore configuration manager',
    prompts: _.values(prompts),
    actions: _.values(actions)
  });
  
  plop.setGenerator('fileManager', {
    description: 'alcore file manager',
    prompts: [{
			type: 'input',
			name: 'filename',
			message: 'Enter edx-platform filename:'
		},
		{
			type: 'input',
			name: 'filepath',
			message: 'Enter filepath from edx-platform folder: '}],
			
    actions: [{
    			type: 'add',
    			path: 'local/configurations/{{filename}}',
    			templateFile: 'templates/code/{{filename}}.hbs'
    			}]
  });
};
