const filterByTerm = require("../src/filterByTerm");

describe('Filter function', () => {
    test('it should filter a function by a search term (link)', () => {
        const input = [
            { id: 1, url: 'htps://url1.dev' },
            { id: 2, url: 'htps://url2.dev'} ,
            { id: 3, url: 'htps://link3.dev' },
        ];

        const output = [{ id: 3, url: 'htps://link3.dev' }];

        expect(filterByTerm(input, 'link')).toEqual(output);

        expect(filterByTerm(input, 'LINK')).toEqual(output);
    });

    test('it should filter a function by a search term (url)', () => {
        const input = [
            { id: 1, url: 'htps://url1.dev' },
            { id: 2, url: 'htps://url2.dev'} ,
            { id: 3, url: 'htps://link3.dev' },
        ];
    
        const output = [{ id: 1, url: 'htps://url1.dev' }, { id: 2, url: 'htps://url2.dev'}];
        
            expect(filterByTerm(input, 'uRL')).toEqual(output);
    })

    test("it should throw an error when searchTerm is empty string", () => {
        const input = [
            { id: 1, url: 'htps://url1.dev' },
            { id: 2, url: 'htps://url2.dev'} ,
            { id: 3, url: 'htps://link3.dev' },
        ];
        expect(() => {filterByTerm(input, '');
        }).toThrowError(Error('Empty search term'));
    });

    test("it should throw an error when the input array is empty", () => {
        const input = [];
        expect(() => {filterByTerm(input, 'link');
        }).toThrowError(Error('inputArr cannot be empty'));
    });
    
});
