const path = require('path');
const {
  createJoinFunction,
  createJoinImplementation,
  asGenerator,
  defaultJoinGenerator,
} = require('resolve-url-loader');

const sourceFolders = [
  'app/assets/images',
  'app/javascript/images',
].map(function(sourceFolder){ return path.resolve(sourceFolder)});

// call default generator then append any additional paths
const myGenerator = asGenerator(
  (item, ...rest) => {
    const val = Array.from(defaultJoinGenerator(item, ...rest));
    if (item.isAbsolute) {
      val.push(null)
    } else {
      sourceFolders.forEach(function(sourceFolder){ val.push([sourceFolder, item.uri]) });
    }
    return val;
  }
);

const myJoinFn = createJoinFunction(
  'myJoinFn',
  createJoinImplementation(myGenerator),
);

module.exports = {
  loader: 'resolve-url-loader',
  options: {
    join: myJoinFn
  }
}