import os
import psycopg2
import psycopg2.extras

def print_results(results):
    if not results:
        print("No results found.")
    else:
        print("\n--- Query Results ---")
        for row in results:
            print(dict(row))
        print("---------------------\n")

def get_einnamen(conn, monat):
    cursor = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    sql_query = f"select sum(Betrag) from umsaetze, view_cat where view_cat.id = umsaetze.id and umsatztyp = 'Eingang' and buchungstag like '%{monat:02}25'"

    #print(f"Executing query: {sql_query}")
    cursor.execute(sql_query)

    # --- Fetch and Print Results ---
    results = cursor.fetchall()

    return results

def get_ausgaben(conn, monat):
    cursor = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    sql_query = f"select sum(Betrag) from umsaetze, view_cat where view_cat.id = umsaetze.id and umsatztyp = 'Ausgang' and buchungstag like '%{monat:02}25'"

    #print(f"Executing query: {sql_query}")
    cursor.execute(sql_query)

    # --- Fetch and Print Results ---
    results = cursor.fetchall()

    return results

def get_kategorien(conn, monat):
    cursor = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    sql_query = f"select sum(Betrag),category from umsaetze, view_cat where view_cat.id = umsaetze.id and umsatztyp = 'Ausgang' and buchungstag like '%{monat:02}25' group by category;"

    #print(f"Executing query: {sql_query}")
    cursor.execute(sql_query)

    # --- Fetch and Print Results ---
    results = cursor.fetchall()

    return results

def execute_query():
    """
    Executes a SQL query on a PostgreSQL server and prints the results as a list of dictionaries.
    """
    try:
        # --- Database Connection Details ---
        # It's recommended to use environment variables for sensitive data.
        db_host = "localhost"
        db_user = "postgres"
        db_pass = "mysecretpassword"

        # --- Construct Connection String ---
        conn_string = f"host='{db_host}' user='{db_user}' password='{db_pass}'"

        # --- Connect to the Database ---
        print("Connecting to the PostgreSQL database...")
        conn = psycopg2.connect(conn_string)
        print("Connection successful.")

        for i in range(1,12):
            print(f"--------------------------- Monat {i} ----------------------------")
            print("Einnamen")
            result = get_einnamen(conn,i)
            print_results(result)
            print("Ausgaben")
            result = get_ausgaben(conn,i)
            print_results(result)
            print("Kategorien")
            result = get_kategorien(conn,i)
            print_results(result)

    except psycopg2.OperationalError as e:
        print(f"Connection Error: Could not connect to the database. Please check your credentials and host.")
        print(f"Details: {e}")
    except psycopg2.Error as e:
        print(f"Database Error: An error occurred during the database operation.")
        print(f"Details: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

    finally:
        # --- Close the Cursor and Connection ---
        if 'cursor' in locals() and cursor:
            cursor.close()
        if 'conn' in locals() and conn:
            conn.close()
            print("Database connection closed.")

if __name__ == "__main__":
    execute_query()
