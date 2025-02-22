Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FED2063DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740224860; cv=none; b=BzNry8g2Ken7Xs96MsyhhPjbu09frW3wJ/Iiavh3r5OUGeyuhLzUxLi86jPPH3g0Bs2E6MmphmWMU2fWssb3U34q6Z4j1DoNkKI2GMwKBGV4NtGJcsBuwwbT2ZtfY8IrbEx8DEOnesiW+I68au8HyRAGln45GHmE03RL1QxKFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740224860; c=relaxed/simple;
	bh=oAdQ4PaWiqE7P/UfEF3Qb7V7wE4e3LKK55/2Ij5cPLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKl93PPEuQxMnmVK1TJEVBLRLHN2dj/SGSbJ+XKmQEi0Wer19WgUoCPWZWntLGS0AanFrS5RDJYvXsYtW7qPI638igf/n4pDKFhP7VOK1/7mz6YP8900Z+RPMMTCPHl85qSK3SApRr5L/CWR8H8KfOs1kzBynrK7Sc8hnn0iIJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDr42O22; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDr42O22"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB4981282
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 11:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrMCxu5D7Bm5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2025 11:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 220A280F6D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220A280F6D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cDr42O22
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 220A280F6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 11:47:13 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2212a930001so82899535ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 03:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740224833; x=1740829633; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EhjXwW3cQDbxz191xEcftyc/2qMfllgMiMAgqUe0Eo=;
        b=cDr42O22dHcvB1A9EuxjqVl0YvsxyeCaR9NFeDndmyTNEfZbssQERuldt95YimoHyc
         3Us8MIT67QaT+nJVPSNZIHQ5khYmUYlVQzAx3tUZnmKl/a4ERua03emG0luNPqphbavC
         X71x5dv5m3MPMruBOsZiyuvT8YGet0aCUYH1lSmlr/4JSkyE1tk4MiPCSPDQIyNuMDR5
         aITl6uuOwC32mS+C//p4I0BVXzmzrFLVnwpJUHsGFIpZx0pb0JGmi6GFyXA9/Uc66Ed6
         9bzybhbrhHQJ3HPI6gnwyGWasMkACBMophvOsZvhg/4cNhNrGJOssxJu/hgpJ3ynSWeG
         qtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224833; x=1740829633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EhjXwW3cQDbxz191xEcftyc/2qMfllgMiMAgqUe0Eo=;
        b=Uc+nrN0msFuLsjrRAllhTyRSnVRHod1WAEABOvH9Urn8lnXF6rUMrGkNIjPL0RvErY
         Po8LOAtr/i4oVE6AJR8f5fVl9xR5dVBy8YRK1MA3aZnkKCACNoyFBX18aohto4n/DtX4
         GPIpaVFfqqyxwaCUYib9/A2rw4NO8Yf/Uq3ytXEx6g0DOnUUyULWV171XFsWb1vAr/Oz
         0ENflX5qgoB+fDOieX+GHl93xbRIbK+1rRFK7AfXBWUloHdMb3zGcVV8dR3wZCGA/lSi
         sX86K4CA3jNAl1XNCnPP0tOkkRU7AgdK78FAaHQR3J7C5vW5l2x1zSDt2n1gn7iehIil
         SJNw==
X-Forwarded-Encrypted: i=1; AJvYcCUXPPFu8FfnsGSpmEVxQTeuzUvC8Ng9BfvMuoSnnHNqY1unRZhl0LVH7l7EfRX3uyqjNmXFOcGG1458pN8fmlF9/oS7cQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz5MvwB25VeyvnmS6dftVqOgOP4FghLVrp8QhRg45HtvH0cK5dE
	CJpeOlH/Pp6f2U0my2/DCaipw47h+g2ArPq+tSzHnBrJLU4/UcGa
X-Gm-Gg: ASbGnctY/jw5EngPI4Aw0raS8Ieh+7ng7u7sThbCql8SdQhmPlKHUzG2ycD2ZVUwz6j
	haX0s8C+I8Xzpt/J4fw1WtzAI1AU5xEydBSdPDni4K1nS4+setRbiJ1ezeEdZsDQeaquiIRSjqd
	mVJzZNFn+zSg7P/dCF8OW8vK5vwv75DX/0wNO04LJuO8kx1729GJo85p2sIFBeNtEoeN6refdqo
	5m/eZz7WuiHGjvQOMzPFbbNcPp7NpG5Rrm+LF/ePsJifuDlsL0y66zmUqLnB7T+py+6pM0QOlth
	WI9Zzga65IaMp83kpUk2bqq9xObBncX/0Dvp2Lrski+oh4695Xs=
X-Google-Smtp-Source: AGHT+IFe2oYcDmWj3WWHE6JRwA1QVbVHKisGIBXbUQEdyBCmtYk0rGGSQXdgj5aGz3vfKCnxs6ku2g==
X-Received: by 2002:a05:6a20:9f86:b0:1ee:dded:e5b with SMTP id adf61e73a8af0-1eef5300760mr12744680637.24.1740224833305;
        Sat, 22 Feb 2025 03:47:13 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325953a4a9sm15175579b3a.82.2025.02.22.03.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:47:12 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 55376ED9143; Sat, 22 Feb 2025 17:17:09 +0530 (IST)
From: ritvikfoss@gmail.com
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests/mount: Close 'fd' when write fails
Date: Sat, 22 Feb 2025 17:17:09 +0530
Message-ID: <20250222114709.50011-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

1. Close the file descriptor when write fails.
2. Introduce 'close_or_die' helper function to
reduce repetition.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 .../selftests/mount/unprivileged-remount-test.c     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..3dd9df58725b 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
@@ -54,6 +54,13 @@ static void die(char *fmt, ...)
 	exit(EXIT_FAILURE);
 }
 
+static void close_or_die(char *filename, int fd) {
+	if (close(fd) != 0) {
+		die("close of %s failed: %s\n",
+		filename, strerror(errno));
+	}
+}
+
 static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list ap)
 {
 	char buf[4096];
@@ -79,6 +86,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
 	}
 	written = write(fd, buf, buf_len);
 	if (written != buf_len) {
+		close_or_die(filename, fd);
 		if (written >= 0) {
 			die("short write to %s\n", filename);
 		} else {
@@ -86,10 +94,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
 				filename, strerror(errno));
 		}
 	}
-	if (close(fd) != 0) {
-		die("close of %s failed: %s\n",
-			filename, strerror(errno));
-	}
+	close_or_die(filename, fd);
 }
 
 static void maybe_write_file(char *filename, char *fmt, ...)
-- 
2.48.1

