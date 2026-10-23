CREATE TABLE player_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bgmi_uid VARCHAR(16) UNIQUE NOT NULL,
    ign VARCHAR(64) NOT NULL,
    city VARCHAR(64),
    primary_role VARCHAR(32) DEFAULT 'All-Rounder',
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE career_stats (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id UUID REFERENCES player_profiles(id) ON DELETE CASCADE,
    tier VARCHAR(32) NOT NULL,
    matches_played INT NOT NULL,
    wins INT DEFAULT 0,
    finishes INT NOT NULL,
    fd_ratio DECIMAL(6, 2) NOT NULL,
    avg_damage DECIMAL(7, 2) NOT NULL,
    headshot_pct DECIMAL(5, 2) DEFAULT 0.00,
    ecp_score INT NOT NULL,
    last_scanned_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
