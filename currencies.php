<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require "./sniper.php";

if($_SERVER['REQUEST_METHOD'] == 'GET'){

    $all_currencies = selectAll("currency", null, "country ASC");

    if(count($all_currencies)  > 0){
        $currencies = array();
        foreach($all_currencies as $currency){
            array_push($currencies, array(
                "country" => $currency['country'],
                "currency" => $currency['currency'],
                "code" => $currency['code'],
                "symbol" => $currency['symbol']
            ));
        }

        echo json_encode($currencies);
        return;
    }

    echo json_encode([
        "message" => "no currencies available"
    ]);
    return;
}

echo json_encode([
    "message" => "Only GET method is supported"
]);

?>