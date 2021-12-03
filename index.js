var fs = require('fs')
const yaml = require('js-yaml');
var YAML = require('yaml')


const params = fs.readFileSync('./params.yaml', 'utf8')

const config = YAML.parse(params);

const pipeline_test = fs.readFileSync('./pipeline_test.yaml', 'utf8')
const pipeline = YAML.parse(pipeline_test);


pipeline.jobs[0].plan[1].vars.commit_sha = config.build.shell.commit_sha
pipeline.jobs[0].plan[1].vars.shell_config = config.build.shell.config
pipeline.jobs[0].plan[1].vars.shell_arch = config.build.shell.arch

console.log(pipeline)

let yamlStr = yaml.safeDump(pipeline);
fs.writeFileSync('data-out.yaml', yamlStr, 'utf8');