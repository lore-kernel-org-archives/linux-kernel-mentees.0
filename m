Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83333176F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755327325; cv=none; b=ukir+P6koh/9Axw+mn4ymh6s8cyR/o+zNtKttW8+dXvhiWa0budB9cF/rF1hTCA9IAaWZkSTbBboQkbGpU1iXMdvEVY9WDk6s9tLmfGNjqSdgbd4T1ESFcPt1/IdkCWWx5/X3qC+HUiQxDDFi9mVAFJAku4uIcbeiJ5D644cVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755327325; c=relaxed/simple;
	bh=kKwgkc0MRKj5QVDGF/mEkvIhrzP3GNMCanq7BG9BeW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWg/s+6wwKsC5kq57WAH+d5fE+yRtJoKpP/tf2x5qBUxGaMJP9NA0i574a7w8psNHf/tK95m45uzuJN1EsOXBOZalD6kUAdcEmfqYyFrv+XQybObzj46CeVRXApbjX5s3owZvNhvCAB8Toi5Sqaef3FWEtdItNwqU7UqemWD9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGi++bx7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGi++bx7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585C783E10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 06:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYLie4qH6umb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Aug 2025 06:55:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A751A83D9E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A751A83D9E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGi++bx7
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A751A83D9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 06:55:22 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-323266cd073so432004a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755327322; x=1755932122; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQENfQjnK0kpW7+ecWx4mPicYJuAqMw36HO0ldP2nh8=;
        b=aGi++bx73bVKE5+5cCT0ddL4PPIwSooklfwHE3sQ4QDq5EjLCaAM8z7Wq8dYkahXPN
         ogUq5KhOA0JBStjSC18668j4JbQXwrnjnoIuYaDS0TAyuilfnLL7tyZGf3BiHBQesPHG
         dlkN2Gvl43hUoMQrxU2OEjNQy9kp2yJv6EkSXSI7I1OyABlUdClLSd6Q5wF0zAWyrK7c
         dXT3tLk9S6X26XVA2BGzhabtDEsHzMnuUwdMLyX3tBckhQfgq2rCjhfRgBtgoUUDPtQr
         Qxow+cbUn2+SElLieclDHjEhPXrAAw1TIis20ohVO9DuSBWVvu7Vpg6L2tL5rR4K1Km5
         MKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755327322; x=1755932122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQENfQjnK0kpW7+ecWx4mPicYJuAqMw36HO0ldP2nh8=;
        b=QTlJ78HrWf092mIeROwRC9fx5OhBZy0h+qT4MWcYwkb20Q1j/8c07JYGiL9HHbbraJ
         iVEXA8HFpocu5iiMiw88R6li85bvR1XlI+nryBqZABz/B3LhN80uVRP0qE3BApBFLTfL
         Bj9u2zZ1tKW7FfGTPXmfe4uCk+Udqrv2YAkUGE1sqOZfD13lnLIOVwXA+VURGQVOzEiQ
         f85yJesrBwQ1HfzccO4nNZDCAulP79WNkewBes0F9THZOJWRkDwI60sjo22xPosiBMwc
         OrQNEY24oPusDJsjDIbTxa7VJFnaPfWOw5M7R8yB5diavK361Ak35uDiXzMx1HBjNjEg
         3jCw==
X-Gm-Message-State: AOJu0YxtfqQSwWZZ0YWtd/FMzLiiS66McmJYad9q0vw+wjjp1GfszS3F
	/tdaTwKn67qrJv6yoJUSZpdqUTvPEu7nQzhDDemA7XSkaX0vFPOGuIcI
X-Gm-Gg: ASbGnctQFcvMJqvKY5FVtlfdY0A4e0F8u4+iUpnaAraUIy+jHitMbjK5w54sr1JGF5y
	WOjegBCglmHfLAgBt3GMV0uxKxr2XHhuLUKOBXczbxRFHSkbM7zYxWAwK/4sIbNLRa9MGXDuLvW
	XcIESv8zkKxT9lLVfMDG4tNqbHPIyw/QqK7QTQtwuVoZEvEOBOLYli90+CzuoagXaGaJ9JdZxEj
	eArc7M7dUMCi3fn4prWTmXkYnbEr2C/FqaX9eR/ZjhG47Jto3Ihq/FHrWbDWV3VfWtF/iKt/hip
	rK0aKPLB1Ctd6I9s0cA6y251B+/sNhdvBEqIHqfwrYP9AM3dgia8e6/YjZHRm+aDLrYU+sXwUE0
	hRm/Al3LXv795rGWOtIeQIFjrSoxxcw==
X-Google-Smtp-Source: AGHT+IEi3On6DUaLL3HGRjuBdB8IwYTEvydR5f4BGORycAYvDCRl8am9GWB0dz2TJVzDRvHLvw74vQ==
X-Received: by 2002:a17:90b:1c8b:b0:321:c5eb:1da4 with SMTP id 98e67ed59e1d1-32341df94f7mr3768725a91.1.1755327321682;
        Fri, 15 Aug 2025 23:55:21 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:2b0c:4503:9234:5f04:b2f9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a8f7asm2965664a12.12.2025.08.15.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 23:55:21 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: shuah@kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [PATCH] selftests: firmware: removing errors and warnings from checkpatch.pl
Date: Sat, 16 Aug 2025 12:25:10 +0530
Message-ID: <20250816065511.10713-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing the scripts/checkpatch.pl errors and warnings from the file.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 tools/testing/selftests/firmware/fw_namespace.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
index 04757dc7e546..5fcc3fed0036 100644
--- a/tools/testing/selftests/firmware/fw_namespace.c
+++ b/tools/testing/selftests/firmware/fw_namespace.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Test triggering of loading of firmware from different mount
  * namespaces. Expect firmware to be always loaded from the mount
- * namespace of PID 1. */
+ * namespace of PID 1
+ */
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
@@ -17,7 +18,7 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
-static char *fw_path = NULL;
+static char *fw_path;
 
 static void die(char *fmt, ...)
 {
@@ -86,9 +87,8 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
 			die("waited for %d got %d\n",
 				child, pid);
 		}
-		if (!WIFEXITED(status)) {
+		if (!WIFEXITED(status))
 			die("child did not terminate cleanly\n");
-		}
 		if (block_fw_in_parent_ns)
 			umount("/lib/firmware");
 		return WEXITSTATUS(status) == EXIT_SUCCESS;
@@ -116,11 +116,13 @@ int main(int argc, char **argv)
 {
 	const char *fw_name = "test-firmware.bin";
 	char *sys_path;
+
 	if (argc != 2)
 		die("usage: %s sys_path\n", argv[0]);
 
 	/* Mount tmpfs to /lib/firmware so we don't have to assume
-	   that it is writable for us.*/
+	 * that it is writable for us.
+	 */
 	if (mount("test", "/lib/firmware", "tmpfs", 0, NULL) == -1)
 		die("mounting tmpfs to /lib/firmware failed\n");
 
-- 
2.43.0

