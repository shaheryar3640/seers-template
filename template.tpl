___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Seers Template",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "This is Template",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "sourceUrl",
    "simpleValueType": true,
    "help": "Get your cdn link from script",
    "displayName": "Enter cdn link",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "https:\\/\\/[a-z]+\\.consents\\.dev\\/script\\/[a-z0-9-]+\\.js$"
        ]
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "dataKey",
    "displayName": "Enter your data key from script",
    "simpleValueType": true,
    "help": "Get your key from script (data-key)",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const sourceUrl = data.sourceUrl;
const dataKey  = data.dataKey;

const url = sourceUrl + "?param=" + dataKey;
log('data =', url);
//data.gtmOnSuccess();
const onSuccess = () => {
  log('Conductrics: Script loaded successfully.');
  data.gtmOnSuccess();
};

// If the script fails to load, log a message and signal failure
const onFailure = () => {
  log('Conductrics: Script load failed.');
  data.gtmOnFailure();
};
if (queryPermission('inject_script', url)) {
  injectScript(url, onSuccess, onFailure);
} else {
  log('Conductrics: Script load failed due to permissions mismatch.');
  data.gtmOnFailure();
}

// Call data.gtmOnSuccess when the tag is finished.


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cmp.consents.dev/script/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 4/12/2023, 1:27:03 PM


