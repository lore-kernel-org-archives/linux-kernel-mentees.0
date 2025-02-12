Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900B25D558
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Feb 2025 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739386467; cv=none; b=JZ5TfQSU1BYk/0xPCV7VPL0s+1zacNcXrdwmrDlrLftJxpJKqSIT+kmrRoOlngPuk+BP+dFF5fc6SniLqSb1hQos+4oyzlp/K5Lr3Hj+OK89zJ6bR+No5Qmlr3eWLrOnznD+N69S79PgNRA/RPxXjqY0Qnf4qNnOAsU649Xo0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739386467; c=relaxed/simple;
	bh=KUxFX+4f0Aizw7Mg85WPdNi8c0DEahMb6LLBmtuIvak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=peiiWJHw47c5exislAg4k6QMgH4mGlKU47P5EVGUlF8EF3/gUR5VPG7vARF3Uer878BU6jcnJIsLSOmUi3IjJV3CHTxpw8SBUYttYWQ5q3EfrfS46QOauNURkW59a3m7FAcAW2irxx0IrVV/BnWUfTl1eEtWTPQc0c1ogSsImCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACyNoiP0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACyNoiP0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c2a87378so14906375ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Feb 2025 10:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739386465; x=1739991265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=ACyNoiP07+GxSox/x7SVFjxnY21DpF0mHGVS/ZpK0ElNYe++JEYsMiMpRpo+/1ehLH
         a5JheIDlgrS4u/JYCc1parnmqZfU+g23qiBDo03LYcvVsjYbwhkE0bvamfXxr6cSBPgb
         UsI9Rr2Zs/6zs9Ur4n6lH/eq2iLhXUzKAYMmlg9MJ/dMyrhE27fTYc1qnXM5Xkip065w
         LYpceEiskrKha9+YS1m/u7n1MwxA8nQegRKP8pHNfZrTfyRLF9yDKq549g19KweZ5etw
         HFsM7yNxrG1oATLoHilWHxjRU24k72jqPvX3XrrQQ+zhx1oQmsHehE0Yr6+QEL/ypf2g
         J1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739386465; x=1739991265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=C5ncjMzfQUqpfUTXwhUIZXvq2bNx2dm8rECm8+amSGiaB5Au6wxtNsV4kUpAgYYEHV
         15w9tKwrSVVp+xJ/c3rnmvtQIfdzEEzAE29aiIgkcfuoasO1SPRtUNUPpIK3T1z82rNW
         zYammDk9+IoPc80C/Xn9P/8hoDVoYV2ktY2fyRfV5hv8iY5SQFBV24awqCluTiV/UMy7
         m6Q4TQExpnF3GVCtuIJGy59kUhdvXecftm5ElOY4YDKc85lPpWE0Hzt59ZOOGT8lLb4M
         EUe3LwHXLLWeM5pmz/Kwy2sFme8Yojzpo9Cp0NDMJxfhMF9rlG0+T+jCZtJU/4wy/yvd
         oNVw==
X-Forwarded-Encrypted: i=1; AJvYcCXNxMZECtz8NAjUfxhkLqkjc1eD+g/vi4WonHs701ziXc4MD00yaxzfiBLWHushBIbuCQ4oUEe/TTbTw/dh1DVZwWQgWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySkHiub37McJInfXaPoYz0Ch4QWIU4NG2kmYgFebTEvzHl85Vv
	kT9nDU+5Aya9fiPsd3e73DEkd+wSCd5iI4RRQjK91+7etgInUxHR
X-Gm-Gg: ASbGncvTfNB4ZsM7zhzBMxlSD3U/ddaMwt89f1cdE1wIANeXVSzibrfa9arLAZt8SCE
	AZMsVhVj8NeiagZjCvHaZiclO3jZafev/K/OlO90JWVARMnDcrosaWyZh53lE/KpeLqOGJGXnvq
	X3t8aNmeE2S4fCXEYNbr2JIUCGy1tDqqAT2sKqKGRm+DGhtb6w3qCM5kTO9V8HLj+78eusoSlCL
	jIzVQBG3Ti2q3ZkMmg/icdI1rXJ2vdrME7mnLE9h70NTtyYgFP0yWU0BO2gsCq2NDfsCdMe9nZX
	q8YHz4gSqnlzpfXcUAoar/L8kZbCScpGZfOQoQ==
X-Google-Smtp-Source: AGHT+IGXe/W9685rj5LjzlOaNi5KhdOrLQ3CCIQLai+P+93e2wTzifN3QOHnzLzv/sce7do1q75GNw==
X-Received: by 2002:a05:6a00:10c9:b0:732:23ed:9470 with SMTP id d2e1a72fcca58-7322c418131mr6041484b3a.23.1739386464461;
        Wed, 12 Feb 2025 10:54:24 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73086e6636csm6757499b3a.135.2025.02.12.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 10:54:24 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH net-next] selftests: net: fix grammar in reuseaddr_ports_exhausted.c log message
Date: Thu, 13 Feb 2025 00:24:12 +0530
Message-ID: <20250212185412.3922-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a grammatical error in a test log message in
reuseaddr_ports_exhausted.c for better clarity as a part of lfx
application tasks

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/net/reuseaddr_ports_exhausted.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
index 066efd30e294..7b9bf8a7bbe1 100644
--- a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
+++ b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
@@ -112,7 +112,7 @@ TEST(reuseaddr_ports_exhausted_reusable_same_euid)
 		ASSERT_NE(-1, fd[0]) TH_LOG("failed to bind.");
 
 		if (opts->reuseport[0] && opts->reuseport[1]) {
-			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets succeed to be listened.");
+			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets successfully listened.");
 		} else {
 			EXPECT_NE(-1, fd[1]) TH_LOG("should succeed to bind to connect to different destinations.");
 		}
-- 
2.47.1

