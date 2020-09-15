// https://www.valentinog.com/blog/jest/

function filterByTerm(inputArr, searchTerm) {
    if (!searchTerm) throw Error('Empty search term');
    if (!inputArr.length) throw Error("inputArr cannot be empty");
    return inputArr.filter(function(arrayElement) {
        return arrayElement.url.match(searchTerm.toLowerCase());
    });
};

module.exports = filterByTerm;
