package xiaofan.modules.device.dao;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class DeviceDaoPostgresSqlTest {
    private static final Pattern MYSQL_LIMIT_OFFSET = Pattern.compile(
            "limit\\s+\\d+\\s*,", Pattern.CASE_INSENSITIVE);

    @Test
    void usesPostgreSqlLimitSyntax() throws IOException {
        String sql = Files.readString(Path.of(
                "src/main/resources/mapper/device/DeviceDao.xml"));
        assertFalse(MYSQL_LIMIT_OFFSET.matcher(sql).find(),
                "PostgreSQL does not support MySQL LIMIT offset,count syntax");
        assertTrue(sql.contains("limit 1"), "single-row lookup should use LIMIT 1");
    }
}
