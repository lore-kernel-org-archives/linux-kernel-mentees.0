Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CF94430
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 02:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740365435; cv=none; b=Nx0nqbCIOydHtOoycKAESt8h893om6TCitPd4kdIWsSwvgdNZoKI405x6gNfTRkNvAWhFsIAcDaiYgV4wp6rNF9U9x3w+ZseWqa6c5A5DJKczuBZVNxPyljFlMgvcySRMN3zbV6NKrkGSiK8Qu5qGnvPq80xCowrujVuaqzfrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740365435; c=relaxed/simple;
	bh=z1DWA1Epp5W40h27XnYDxMfEShlTw/6m1B8Q5cJzGrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M10pv0obqHKNlhkFghbsjSuyP4+81eIkr7rm82YV7aB7ebpJ1/uCJZct3o5JofQWdnKDRN+cCGMsz/bJDmfKiyUyl1/BqvHfe90iAKe/ThfqyOmUonWlg5ZdJoLvFtVszsCd/i0P3aXmxsgMpqnMwzIm9pGZts3ApQt8mMYR834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co10dCu9; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co10dCu9"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C23404AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 02:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ1q8teDDUqX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2025 02:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B4E4404A9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4E4404A9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=co10dCu9
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4B4E4404A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 02:50:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fc1c80cdc8so6016637a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 18:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740365432; x=1740970232; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otH5nZvB5TrQ708wLQhRsttQBeJzQP2CzcoNi99bQis=;
        b=co10dCu9YEGbCllx1fLP8XTv7NloNWq3ApdfKq8h0lNY7G1WpHsOrabI+HQvmmsS84
         ODaZCxf/Jyd7z/t4EkVUEmvJPNv+d7TsgREz+FpxiqhvPE6mwHSdpHWXAimvWI+02vb3
         Sm5Zh4cVoZAxkOQ9yq6XK0NSqZcltBJ4TJGIwI4HW67MD4M3888i+4yxV8yqIR/LBBC+
         hvT4u2iGQS109rQpy2lZgS7iCszmHK+hoNIf4Ku6OhvLLKhVjwVXjuoK+/eHe04AsBZO
         YcPahD22svmD844WiHpGziFc+YyBBC36dCqLkk86NOFjkhwEmlGXuGzmNOoiB0u8vHzL
         N+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740365432; x=1740970232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otH5nZvB5TrQ708wLQhRsttQBeJzQP2CzcoNi99bQis=;
        b=p/hxh0NohEd3MHTlPFsedjfn1uY/Nie0a9OOVzoZl2WxixFMTwEGG+T4/O7HKz5HNr
         wmSlKQ1XnMhabOsbJ1zUntUv3ZWiq7QOp3EzIwWfSzgBFO7SjzheoB9L5VfNtYts3yHZ
         qg9ha1TeM7x8aZ+3NVC7UD2+uI0jW5eLffYxcjeWtKwtNk5vL/FLQyCspW7340MhLuTM
         fsiKm686C6fM9U1joPl61UId4sHx2Cg4hak/uKYKwIFzfSyLfI1tHBtDIg62ziiMUqZI
         Abfr39eEZV61RbOFQ0dUyQbR6vdHcTdss0RmU6qQmSE1wltmpfu5IrgA03Kqnc/MATZn
         SvDg==
X-Forwarded-Encrypted: i=1; AJvYcCWOPSQS7VEHtYYRr9bWUWiMMell4pxyU4sqY+uyQFzSybhRJvm9BsiA6odDEazZ9wa2g1rPsV67OgqdiuT6Q0W5hqJ5Rw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx3t/psugLndz/BRGZQB0os2jpmz7nzG0aZmGkhbyovDq8EzSOw
	96TVN4wJpnMv6R+wtCTwIF0S9TucTg0mDiWyMsyMzFibJRlExjtW
X-Gm-Gg: ASbGncslJyLD8QL3OmDV0ozO6Ej608sfO+kxhIda1wA3hU8JIBLAdP6eTAkJo+h74QH
	p5IadMDhj2fOTP5zJCERaoE6O1Qp4mSp6Uj6ZSIdEfTY1JsLbFU0k3nOIqKpcZRoW8LnTIozZgB
	vJeXAYFKCAR8mrUhd6g/iAbw+sP+NDeRLKyx2jGriJ/KvmgWt+cWknG1hrzxT3JanuruZQx6lCO
	z3pSEMnzobj6sTEB969yrAFpw1CuONO1PzuBgSa2s7lLjuJhruS/YimV1DJRdVuKlv6OTh52Hvw
	LJChtXwx3GqqAztzT1NRYw21UxE7q8Pbmtqvzt72Er9glQvVq0Y=
X-Google-Smtp-Source: AGHT+IH+0iHxG0Zp6sK72W9vgyWjLMgjQmHDx5OZ9tSidYY0Gl8jy8JhzfPYC1CZ7W/g1/OOgJwKKg==
X-Received: by 2002:a17:90b:2d4e:b0:2f2:a664:df19 with SMTP id 98e67ed59e1d1-2fce769a9ccmr21415382a91.7.1740365432446;
        Sun, 23 Feb 2025 18:50:32 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:f92a:daab:d63c:8241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm170467625ad.243.2025.02.23.18.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 18:50:31 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id D073BEE99E9; Mon, 24 Feb 2025 08:20:28 +0530 (IST)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: [PATCH] selftests/mount: Use 'const' for filename parameters
Date: Mon, 24 Feb 2025 08:20:28 +0530
Message-ID: <20250224025028.3407-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The filename parameter in write_file(), maybe_write_file(),
and vmaybe_write_file() is unmodified / read-only.
So, used 'const' to improve type safety.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 tools/testing/selftests/mount/unprivileged-remount-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..e80ac76261e7 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
@@ -54,7 +54,7 @@ static void die(char *fmt, ...)
 	exit(EXIT_FAILURE);
 }
 
-static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list ap)
+static void vmaybe_write_file(bool enoent_ok, const char *filename, char *fmt, va_list ap)
 {
 	char buf[4096];
 	int fd;
@@ -92,7 +92,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
 	}
 }
 
-static void maybe_write_file(char *filename, char *fmt, ...)
+static void maybe_write_file(const char *filename, char *fmt, ...)
 {
 	va_list ap;
 
@@ -102,7 +102,7 @@ static void maybe_write_file(char *filename, char *fmt, ...)
 
 }
 
-static void write_file(char *filename, char *fmt, ...)
+static void write_file(const char *filename, char *fmt, ...)
 {
 	va_list ap;
 
-- 
2.48.1

