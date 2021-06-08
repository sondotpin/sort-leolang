function main(array: [u32; 10]) -> [u32; 10] {
    for i in 0..9 {
        let minimum = find_minimum(array, i);
        let buffer = array[i];
        array[i] = minimum[0];
        array[minimum[1]] = buffer;
    }
    return array;
}

function find_minimum(array: [u32; 10], n: u32) -> [u32; 2] {
    let result: u32 = array[n];
    let index: u32 = 0;
    for i in 1..10 {
        if i >= n && array[i] <= result {
            result = array[i];
            index = i;
        }
    }
    return [result, index];
}

@test
function test_find_minimum() {
    let array: [u32; 10] = [8u32, 2u32, 4u32, 3u32, 5u32, 10u32, 7u32, 1u32, 9u32, 6u32];

    let res = find_minimum(array, 1);
    console.assert(res[0] == 1u32);
    console.assert(res[1] == 7);
}

@test
function test_main() {
    let array: [u32; 10] = [8u32, 2u32, 4u32, 3u32, 5u32, 6u32, 7u32, 1u32, 10u32, 9u32];

    let res = main(array);
    console.assert(res == [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32]);
}
