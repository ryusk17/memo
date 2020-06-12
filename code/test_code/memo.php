<?php
// $companies = $db->query('SELECT c.id, c.company_name, c.representative_name, c.phone_number, c.address, c.mail_address, COUNT(company_id) AS cnt FROM companies c LEFT JOIN employees e ON c.id = e.company_id WHERE c.deleted IS NULL GROUP BY c.id, c.company_name, c.representative_name, c.phone_number, c.address, c.mail_address ORDER BY c.id asc');

// if ($order == 'desc') {
//     // desc クエリに飛ぶため、foreach 内は asc 順
//     // そうしないとゲットのクエリと表示が逆になり気持ち悪いため
//     foreach ($employees as $employee) {
//         include('../tips/employee_table.php');
//     }
// } elseif ($order == 'asc') {
//     // 配列に社員を代入
//     $ascArray = [];
//     foreach ($employees as $employee) {
//         array_push($ascArray, $employee);
//     }
//     // 配列の順番を逆にし、ソート
//     $descArray = array_reverse($ascArray);
//     foreach ($descArray as $employee) {
//         include('../tips/employee_table.php');
//     }
// }

// $companyId = 1;
// $numbers = [':id' => $companyId];
// foreach ($numbers as $key => $value) {
//     echo "'$key'", $value;
// }

// echo phpinfo();

// $array = ['id' => 1, 'color' => 'red'];
// $new = ['id' => 2, 'color' => 'blue'];
// foreach (array_keys($array) as $key) {
//     $array[$key] = $new[$key];
// }
// var_dump($array);

// // pass by value
// function valGeek($num)
// {
//     $num += 2;
//     return $num;
// }

// // pass by reference
// function refGeek(&$num)
// {
//     $num += 10;
//     return $num;
// }

// $n = 10;

// valGeek($n);
// echo "The original value is still $n \n";

// refGeek($n);
// echo "The original value changes to $n";

// $array = [3, 5, 2, 6, 9, 1];
// $newArray = [];
// while (count($array) > 0) {
//     foreach ($array as $key => $value) {
//         $i = 0;
//         foreach ($array as $num) {
//             if ($value < $num) {
//                 $i++;
//             }
//         }
//         if ($i == 0) {
//             $newArray = $value;
//             unset($array[$key]);
//         }
//     }
// }

// $x = [["id" => 1, "name" => "john"], ["id" => 5, "name" => "john"], ["id" => 3, "name" => "john"], ["id" => 4, "name" => "john"], ["id" => 2, "name" => "john"]];
// $y = [];
// $i = 0;
// $num = count($x);
// while ($num > 0) {
//     foreach ($x as $key => $valueA) {
//         $j = 0;
//         // foreach ($x as $valueB) {
//         //     if ($valueA['id'] < $valueB['id']) {
//         //         $j++;
//         //     }
//         // }

//         for ($k = 0; $k < $num; $k++) {
//             if ($valueA['id'] < $x[$k]['id']) {
//                 $j++;
//             }
//         }

//         if ($j == 0) {
//             $y[$i] = $valueA;
//             unset($x[$key]);
//             $num = count($x);
//             $i++;
//         }
//     }
// }

// var_dump($x);
// echo '<br><br>';
// var_dump($y);

// function convertNumber($number)
// {
//     $search = array("-", "ー");
//     $result = str_replace($search, "", $number);
//     return mb_convert_kana($result, 'n');
// }

// $result = convertNumber('');
// var_dump(empty($result));

// 配列に関数を入れる
// $array = [];
// $array['func'] = function () {
//     return 'func';
// };
// echo $array['func'](); // ()をちゃんとつける

// if (!empty($_POST)) {
//     var_dump($_POST['test']);
// }
?>

<!-- <form action="" method="post">
    <input type="text" name="test">
    <input type="submit" value="click">
</form> -->
