package com.oceanview.util;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.Connection;
import org.junit.jupiter.api.Test;

public class DBConnectionTest {

    @Test
    void testConnection() throws Exception {

        Connection conn = DBConnection.getConnection();

        assertNotNull(conn);
        assertFalse(conn.isClosed());
    }
}