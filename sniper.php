<?php
/****************************************************************************************************
 * DATABASE CONNECTION FUNCTION
 ********************************************************************************************8******/
/**
 * Establishes a connection to the database.
 *
 * @return mysqli The database connection object.
 */
function connect()
{
    // Replace these credentials with your own
    // comment this on production
    $host = "localhost";
    $user = "root";
    $pass = "";
    $db = "assets";
    

    // credentials for production

    // $host = "localhost";
    // $user = "touchsa_rajWizard";
    // $pass = "FZkVG}PkT2rp";
    // $db = "touchsa_firstMediaAdmin";

    // Create a connection object
    $conn = mysqli_connect($host, $user, $pass, $db);

    // Check if the connection was successful
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Return the connection object
    return $conn;
}

/****************************************************************************************************
 * FUNCTION FOR ARRANGING INSERT VALUES WHEN THEY'RE PASSED AS AN ARRAY 
 ********************************************************************************************8******/

function prepareColumnsForInsert($columns) {
    $columnStr = implode(",", $columns);
    $columnStr = "'".str_replace(",", "','", $columnStr)."'";
    return $columnStr;
    
  }


/****************************************************************************************************
 * DATA INSERTION FUNCTION 
********************************************************************************************8******/

/**
 * Insert data into a database table
 *
 * @param string $table The name of the table to insert data into
 * @param string $cols A comma-separated string of column names
 * @param string $values A comma-separated string of values to insert into the corresponding columns
 *
 * @return bool Returns true if data is inserted successfully, false otherwise
 */
   
function insert($table, $cols, $values)
{
    // Connect to the database
    $conn = connect();

      // check if its an array type to arrange correctly
      if (is_array($values)) {
        $values = prepareColumnsForInsert($values);
    }

    // Construct the insertion query
    $query = "INSERT INTO $table ($cols) VALUES ($values)";

    // Execute the insertion query
    $insertion = mysqli_query($conn, $query);

    // Return true if data is inserted successfully, false otherwise
    return $insertion == true ? true : false;
}


/****************************************************************************************************
 * SELECT MULTIPLE ROWS FROM A TABLE WITH OR WITHOUT CONDITION
********************************************************************************************8******/

/**
 * Fetch all rows from a table that match the specified condition.
 *
 * @param string $table The name of the table to fetch from.
 * @param string|null $condition The condition that rows must match (optional).
 * @param string|null $order_by The column to order the results by and the order method (optional).
 * @param string|null $cols The columns to select (optional).
 * @param bool $distinct Whether to select distinct rows (optional, default false).
 * @return array An array containing the fetched data.
 */
function selectAll($table, $condition = null, $order_by = null, $cols = null, $distinct = false)
{
    // Connect to the database
    $conn = connect();

    // Build the query
    if ($distinct) {
        // if distinct then no paranthesis
        $columns = $cols ? $cols : "*";
    } else {
        // if not distinct then add paranthesis 
        $columns = $cols ?  $cols : "*";
    }

    $query = "SELECT " . $columns . " FROM " . $table;

    if ($condition) {
        $query .= " WHERE " . $condition;
    }

    if ($order_by) {
        $query .= " ORDER BY " . $order_by;
    }

    // Execute the query
    $result = mysqli_query($conn, $query);
    if (!$result) {
        die("query failed: " . mysqli_error($conn));
    }
    if (mysqli_num_rows($result) === 0) {
        return [];
    }
    // Fetch the data
    $data = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // Close the connection
    mysqli_close($conn);

    // Return the data
    return $data;
}

/****************************************************************************************************
 * SELECT A SINGLE ROW FROM A TABLE 
********************************************************************************************8******/
/**
 * Retrieves information about a row in a table based on a specified condition
 *
 * @param string $tableName The name of the table to query
 * @param string $condition The condition to use in the WHERE clause of the query
 * @param string|null $columns A comma-separated list of columns to retrieve. If null, all columns are retrieved.
 *
 * @return array|null The associative array representing the row, or null if no matching row was found
 */
function selectRow(string $tableName, string $condition, string $columns = null): ?array
{
    $conn = connect();

    // Use the specified columns or retrieve all columns by default
    $selectedColumns = $columns ?  $columns : "*";

    // Construct the query to retrieve the row information
    $query = "SELECT " . $selectedColumns . " FROM " . $tableName . " WHERE " . $condition;

    // Execute the query and retrieve the first (and only) row
    $result = $conn->query($query);
    $row = $result->fetch_assoc();

    // Return the row information, or null if no matching row was found
    return $row ? $row : null;
}

/****************************************************************************************************
 * CUSTOM SQL SYNTAX FUNCTION FOR SELECTING ROWS 
********************************************************************************************8******/
/**
 * Fetch all rows from a table that match the specified condition according to your sql syntax.
 *
 * @param string $query The sql syntax.
 * @return array An array containing the fetched data.
 */
function customSelection($query)
{
    $conn = connect();

    // Execute the query
    $result = $conn->query($query);
    $row = $result->fetch_assoc();

    return $row ? $row : null;
}


/****************************************************************************************************
 * UPDATE FUNCTION
********************************************************************************************8******/
/**
 * Updates rows in a database table that match certain conditions with new values.
 *
 * @param string $table The name of the database table to update rows in.
 * @param string $newValues The new column-value pairs to update in the format "col1=value1, col2=value2, ...".
 * @param string $conditions The conditions that rows must match to be updated in the format "col1=value1 AND col2=value2 AND ...".
 * @return bool True if the update query was successful, false otherwise.
 */
function updateRow(string $table, string $newValues, string $conditions): bool
{
    $conn = connect();
    $updateQuery = "UPDATE $table SET $newValues WHERE $conditions";
    $result = $conn->query($updateQuery);
    return $result !== false;
}


/****************************************************************************************************
 * DATA DELETION FUNCTION
********************************************************************************************8******/
/**
 * Deletes a row from a table
 * 
 * @param string $table The name of the table to delete from
 * @param string $condition The condition to use in the WHERE clause
 * 
 * @return bool True if the delete was successful, false otherwise
 */
function deleteRow(string $table, string $condition)
{
    // Connect to the database
    $conn = connect();

    // Build the query
    $query = "DELETE FROM " . $table . " WHERE " . $condition;

    // Execute the query
    $result = mysqli_query($conn, $query);
    if (!$result) {
        die("query failed: " . mysqli_error($conn));
    }

    // Check if any rows were affected
    $num_rows = mysqli_affected_rows($conn);

    // Close the connection
    mysqli_close($conn);

    // Return true if any rows were affected, false otherwise
    return $num_rows > 0;
}



/****************************************************************************************************
 * CHECK DATA EXISTANCE FUNCTION 
********************************************************************************************8******/
/**
 * Checks if a row exists in a table based on the specified condition.
 *
 * @param string $table The name of the database table.
 * @param string $condition The WHERE condition for the query.
 *
 * @return bool True if the row exists, false otherwise.
 * @throws Exception If the query fails to execute.
 */
function rowExists($table, $condition)
{
    $conn = connect();
    $details = "SELECT * FROM $table WHERE $condition";
    $query = $conn->query($details);
    return $query->num_rows > 0 ? true : false;
}


/****************************************************************************************************
 * CURRENCY FORMAT FUNCTION
********************************************************************************************8******/
/**
 * Formats a number as a currency with a specified number of decimal places and currency symbol.
 *
 * @param int $number The number to format.
 * @param int|null $decimals The number of decimal places to display (optional).
 * @param string $currency The currency symbol to use (optional).
 *
 * @return string The formatted currency string.
 */
function currencyFormat($number, $decimals = null, $currency = '') 
{
    // Convert the number to an integer to remove any decimals.
    $number = intval($number);

    // If $decimals is not provided or is less than zero, default to 0.
    $decimals = $decimals ?? 0;

    // Use the number_format function to format the number with the specified number of decimals.
    $formatted_number = number_format($number, $decimals);

    // Add the currency symbol to the formatted number.
    return $currency . ' ' . $formatted_number;
}


/****************************************************************************************************
 * ROWS COUNTER FUNCTION 
********************************************************************************************8******/
/**
 * Counts the number of rows in a database table based on the specified condition.
 *
 * @param string $table The name of the database table.
 * @param string|null $condition The WHERE condition for the query (optional).
 *
 * @return int The number of rows that match the specified condition.
 * @throws Exception If the query fails to execute.
 */
function countRows($table, $condition = null)
{
    $statement = '';

    if ($condition) {
        $statement = "WHERE " . $condition;
    }

    $conn = connect();
    $details = "SELECT * FROM $table $statement";
    $query = $conn->query($details);

    return $query->num_rows;
}


/****************************************************************************************************
 * GETTING DAYS BETWEEN DATES FUNCTION
********************************************************************************************8******/ 
/**
 * Calculate the number of days between two dates.
 *
 * @param mixed $date1 The first date to compare.
 * @param mixed $date2 The second date to compare.
 *
 * @return int The number of days between the two dates.
 */ 
function getDaysBetweenDates($date1, $date2)
{
    // Check if the dates are in seconds
    if (!is_numeric($date1)) {
        $timestamp1 = strtotime($date1);
    } else {
        $timestamp1 = $date1;
    }    
    if (!is_numeric($date2)) {
        $timestamp2 = strtotime($date2);
    } else {
        $timestamp2 = $date2;
    }    
    // Calculate the difference in seconds
    $difference = abs($timestamp2 - $timestamp1);

    // Calculate the number of days by dividing the difference in seconds by the number of seconds in a day
    $days = $difference / 86400;

    // Return the number of days
    return (int)$days;
}    



/****************************************************************************************************
 * GET UPCOMING EVENTS FUNCTION
********************************************************************************************8******/

/**
 * Returns an array of upcoming events from a dataset based on the date column
 *
 * @param array $data The dataset to search through
 * @param string $dateColumn The name of the date column to check against
 * @param string $timeColumn The name of the time column to check against
 *
 * @return mixed An array of upcoming events or 0 if no upcoming events found
 */
function filterUpcomingEvents(array $data, string $dateColumn, string $timeColumn) {
    $filteredEvents = [];
    foreach ($data as $event) {
        $dateTime = $event[$dateColumn];
        if ($timeColumn !== null) {
            $dateTime .= ' ' . $event[$timeColumn];
        }

        if (strtotime($dateTime) > time()) {
            array_push($filteredEvents, $event);
        }
    }

    return $filteredEvents;
}

/****************************************************************************************************
 * GET TODAYS EVENTS/ITEMS FUNCTION
********************************************************************************************8******/
/**
 * Returns an array of items from given data array that have a date in $dateColumn that matches today's date.
 * 
 * @param array $data The array of data to search through.
 * @param string $dateColumn The name of the column in $data that holds the dates to check.
 * @return array An array containing two keys: "data" (an array of matching items), and "num_rows" (the number of matching items).
 */
function getTodayItems($data, $dateColumn) {
    $todaysItems = array();
    foreach ($data as $item) {
        $date = strtotime($item[$dateColumn]);
        if (date('Y-m-d', $date) == date('Y-m-d')) {
            array_push($todaysItems, $item);
        }
    }
    return array("data" => $todaysItems, "num_rows" => count($todaysItems));
}


/****************************************************************************************************
 * GET MEXT EVENT FUNCTION 
********************************************************************************************8******/
/**
 * Get the next upcoming event from a list of events based on a date column.
 *
 * @param array $events The list of events.
 * @param string $dateColumn The name of the date column in the events array.
 * @param string|null $timeColumn The name of the time column in the events array (optional).
 *
 * @return mixed|null The next upcoming event if one is found, null otherwise.
 */
function getNextEvent(array $events, string $dateColumn, string $timeColumn = null)
{
    $now = time();
    $nextEvent = null;

    foreach ($events as $event) {
        $dateTimeString = $timeColumn ? "{$event[$dateColumn]} {$event[$timeColumn]}" : $event[$dateColumn];
        $eventTime = strtotime($dateTimeString);

        if ($eventTime > $now && (!$nextEvent || $eventTime < $nextEvent['time'])) {
            $nextEvent = ["event" => $event, "time" => $eventTime];
        }
    }

    return $nextEvent ? $nextEvent['event'] : null;
}


/****************************************************************************************************
 * GET EXPIRED EVENTS FUNCTION
********************************************************************************************8******/
/**
 * Returns an array of events from the provided data that have expired based on the provided date column.
 *
 * @param array $data An array of events to filter.
 * @param string $dateColumn The column containing the event date.
 * @param string $timeColumn the column containg the event time its optional.
 *
 * @return array|integer An array of expired events, or 0 if there are no expired events.
 */
function getExpiredEvents($data, $dateColumn, $timeColumn = null)
{
    $filteredEvents = [];
    foreach ($data as $event) {
        $dateTime = $event[$dateColumn];
        if ($timeColumn !== null) {
            $dateTime .= ' ' . $event[$timeColumn];
        }

        if (strtotime($dateTime) < time()) {
            array_push($filteredEvents, $event);
        }
    }

    if (count($filteredEvents) === 0) {
        return 0;
    }
    return $filteredEvents;
}

/****************************************************************************************************
 * SEARCH CHARACTER FUNCTION
********************************************************************************************8******/
/**
 * Check if all characters in the query string are found in the data string.
 *
 * @param string $data The string to search within.
 * @param string $query The query string to search for.
 * @return bool True if all query characters are found in the data string, false otherwise.
 */
function search($data, $query)
{
    $char = str_split($query);
    $length = sizeof($char) - 1;

    $n = 0;
    foreach ($char as $c) {
        if (strpos($data, $c) !== false) $n++;
    }
    return $n >= $length ? true : false;
}








/****************************************************************************************************
 * THANKS FOR CONTRIBUTING 
********************************************************************************************8******/ 
?>