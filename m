Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FEE1DDC37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884397; cv=none; b=eIyL/EGqJa9vO1GAsT5+0bG+7r6pEYzXVcKecWN4WyCG8HW/jJp8kaKKJblCzOaalUenlxGBwDsNT3koz4o67sQddWc/PIf5GzRepptpB5D4ShqxoQb/lNQ9hxJ0fzQ6ujMoIkUpL4GX025E0UXYFNUxq2EziRmcNG+7YHQB/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884397; c=relaxed/simple;
	bh=uv8Ihhtdg0n2NJQ3p5u110hUeSo0Kpr8GmEcZJ2bcBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hHlYyZgS1r5mW50R8g67mDrvgU7UygJbm0cmCBS+97Al8q08bmufd2dxm2kPa7nTeP+jnriR+ty5cEKL9t5b6j30e8ZgipHhy+Z5vLdtXIi7JmRtmtzfXHFscghcvedPy79L6xggIEsHKbk1sgWxhvQtZ+Xu6x2xiFB2JajqN/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWASLm1k; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWASLm1k"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06FD44015F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 22:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfNWhgDU6aeL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2024 22:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27FED40025
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FED40025
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YWASLm1k
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 27FED40025
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 22:59:54 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cf3e36a76so24368275ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 14:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731884394; x=1732489194; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDkdpFP063xLDM3wocri/nG7NRGeGfpBxyGmNCvpHu8=;
        b=YWASLm1kWmzrPs7uN8SabkRoQg+jmxFe5IuiSD7v446Q6J6M+0ZvVPa8o+l0zNVjFh
         Zc7VxlacR6obFfrT/54Cm+22irWwo0JBrxWMd1ZBmDQZvahNdG2s9zMMZQuOPY9bNUY+
         jU7hUtQKS4CnQCrat59VZHq/hA4Uqli83wgTFYOPfLQSPnlW6PLaF/uuqcKvWAa+c/33
         1LXJRsj8XvTmMt0az4uOoo6TpXeY4O0JgUJssWXFgvPtNULVvUQz5VIqBH+lkCWbwmO6
         hXrY8RDJG/qbMWy/zEqN3klaf9OwMdpwY1C9zdcTmSFnok/UjKakU70KjGQSLojtsFdq
         Irqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731884394; x=1732489194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDkdpFP063xLDM3wocri/nG7NRGeGfpBxyGmNCvpHu8=;
        b=b2qzqbATyCWEOZoRgki5oKok0srDE8MxoIivaMWy75c0cM6qxrtQ8DPUKhFj33EnYh
         d42azMLA/OKE6U3mSMwJg8Q9VTd6YIb51xwyIX30fJrlHpjcxrhR3yiRLsU2EYLqpzVH
         s4i3RVUlamKEtIad5dPFaI7e2NbrQ5KgPXG8xjCWzIpDFn5XeYIgLm7Ltidm//5R1noR
         C2EZk3fuETkswMFMNCfeKwAISfX4a6LiAtT20PzzoYAD6c9aYONLITlABOgCOTr9R5dW
         gS+71fLd0XlKIzmnnGsv6VME4nbh/J6DmRe1xSNxsuzU8XAPHoGiMu06yhJatYxueT/T
         d7fw==
X-Forwarded-Encrypted: i=1; AJvYcCXL4P/XK5qs8m1tP9qUsROT7ANWwqyT2ir/JeLjRGP3YhVzj85zYqm8RRfqXc65TL74hY8br0IvOJhrDOQd/Yp+xWRV8w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzfk/iTl//fj9jLk8LQ2wX7b6XpAzwXo4TTy+xGcn50KzZ5MQfN
	UFhT2xpx09zWnLG+htnQJgQX/SehX6xkMrY3NFmWSoY/L6Jl5hKy
X-Google-Smtp-Source: AGHT+IG4IhDYQGGogz/AsvycfNbCsZDdahXP/VJU1uZ9sUw3Y9/74uV9EjqxgWYSikEEivGON3kDHg==
X-Received: by 2002:a17:902:da91:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-211d0d92220mr162127935ad.32.1731884394177;
        Sun, 17 Nov 2024 14:59:54 -0800 (PST)
Received: from tp.hsd1.or.comcast.net ([2601:1c2:c104:170:138:7477:f049:643b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f3461fsm44932285ad.154.2024.11.17.14.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 14:59:53 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org
Cc: Leo Stone <leocstone@gmail.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH net-next] selftests: net/psock_lib: Handle EINTR and EAGAIN
Date: Sun, 17 Nov 2024 14:59:50 -0800
Message-Id: <20241117225950.138968-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pair_udp_send_char handle EAGAIN, EINTR, and partial reads or
writes.

Signed-off-by: Leo Stone <leocstone@gmail.com>
---
 tools/testing/selftests/net/psock_lib.h | 39 +++++++++++++++++++------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/psock_lib.h b/tools/testing/selftests/net/psock_lib.h
index 6e4fef560873..e28bff95c8e2 100644
--- a/tools/testing/selftests/net/psock_lib.h
+++ b/tools/testing/selftests/net/psock_lib.h
@@ -13,6 +13,7 @@
 #include <string.h>
 #include <arpa/inet.h>
 #include <unistd.h>
+#include <stdbool.h>
 
 #include "kselftest.h"
 
@@ -110,21 +111,41 @@ static __maybe_unused void pair_udp_open(int fds[], uint16_t port)
 	}
 }
 
+static void read_write_checked(int fd, char *buf, size_t sz, bool is_write)
+{
+	int bytes_processed = 0;
+	int ret;
+
+	do {
+		if (is_write)
+			ret = write(fd, buf + bytes_processed,
+				    sz - bytes_processed);
+		else
+			ret = read(fd, buf + bytes_processed,
+				   sz - bytes_processed);
+		if (ret == -1) {
+			if (errno == EAGAIN || errno == EINTR) {
+				continue;
+			} else {
+				fprintf(stderr, "ERROR: %s failed, bytes left=%lu\n",
+					is_write ? "send" : "recv",
+					sz - bytes_processed);
+				exit(1);
+			}
+		}
+		bytes_processed += ret;
+	} while (bytes_processed < sz);
+}
+
 static __maybe_unused void pair_udp_send_char(int fds[], int num, char payload)
 {
 	char buf[DATA_LEN], rbuf[DATA_LEN];
 
 	memset(buf, payload, sizeof(buf));
 	while (num--) {
-		/* Should really handle EINTR and EAGAIN */
-		if (write(fds[0], buf, sizeof(buf)) != sizeof(buf)) {
-			fprintf(stderr, "ERROR: send failed left=%d\n", num);
-			exit(1);
-		}
-		if (read(fds[1], rbuf, sizeof(rbuf)) != sizeof(rbuf)) {
-			fprintf(stderr, "ERROR: recv failed left=%d\n", num);
-			exit(1);
-		}
+		read_write_checked(fds[0], buf, sizeof(buf), true);
+		read_write_checked(fds[1], rbuf, sizeof(rbuf), false);
+
 		if (memcmp(buf, rbuf, sizeof(buf))) {
 			fprintf(stderr, "ERROR: data failed left=%d\n", num);
 			exit(1);
-- 
2.39.5

