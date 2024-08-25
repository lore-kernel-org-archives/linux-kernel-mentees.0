Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E868B3B2BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724624304; cv=none; b=TZiv6o2RQaGWConBT0oJp6znhaXyNCAU9KeCgWdqe3d5GaOxgRBeCFjoFxDNHfJLibEpyvNPi3yzk1VIqUbGlGnes3Vo/GKqyx/eth+N29+t/g1UMsLhSVMWUe9VIkQ8JYyhSItBrkp6KfGSobgaKw8sF5njMi8hCmS5+8tnIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724624304; c=relaxed/simple;
	bh=5ekFjRBtJKPOG5J1wWuaNXzK4ftoiazTVmxjMa/yAx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gQmcDrU3QQI+Tljewe9jHwzfLfxM4OGACCgVg/A1+ozWDM/yHNok0JOsYrdAFXMzD0eU7xfZZTRCh1rcUbfWWpkB61DBHkMn5faSwQbY3jYg5bfi1Q+tTrKzRmxpS1HRI0LhWU4354xXKfZaRMy4DR4nFd9XZwmRx27BaMnwkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMB1yJSj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMB1yJSj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1BD60592
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 22:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uF0LcDcL3OZ4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Aug 2024 22:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60C7E600D4
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C7E600D4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OMB1yJSj
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 60C7E600D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 22:18:21 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7cd830e0711so2801665a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 15:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724624300; x=1725229100; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxSO7Y7sQcoVtzlhv2475A8WaZBGnuNjsf3DbVh8XIk=;
        b=OMB1yJSjPmgTUBafdZ5MeE3XzuBDbjykUZ/8YNBOlnAzFbnN4F8+e0xBUm2FsLRDcR
         X5Q5MYCbxRzu9tK4yOQX+dIpY+BRy8+MhwuWfTQCZNm/b02FfsiXnbAuZOugrSXnWEnP
         RCS2e5KPPr6eZ8cjFI0so+UCaCunzN9bUdDQYV9a5kk+YHLpf1ZNLmtRwy7jxY2qjKti
         6sA6bI7bQPt7xd4/zrwNUpSOcMmaqoUB6Y63KWnCBevMC7Xxytu08w9nt3r3tKb/O0SA
         W0fCvidiNAovpZrQODpMzAdsa+rs7L1Jq7Hybl6yy1kTdh+gnWiMoWuAuS6EPSKUp/wF
         q7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724624300; x=1725229100;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxSO7Y7sQcoVtzlhv2475A8WaZBGnuNjsf3DbVh8XIk=;
        b=aTymTMjowmc7ZTnS4WAXSAXJSpp1LiZ/oxuYQ3DOg8n/B/pZ8v3hc4xNiHBzcRcRKt
         gcld+l9Zh3ADB/wrfRQ2qylTZwoYPCyNSfp+1yWQudovqD8Z1Z1Jd0bzogzDWpbANvdq
         q65rVm8UDdGLD+7Dsb8RGE3hg5XxIh1zpQBxbYWqnOs/yM4WQBh/sEZtxIiTDZ6Lf3dm
         Q3+46u+J7qJJtoDJqwMJ6qB03xiH9P4DjGs1E3oIF8NmA1rOc3SWBtS5aCwcGqE1NFpX
         UOc3uWbNaM6q2BFj1b49BILKptjvHP2E58QfpXr0eiSSgudAcJvJa+4TPq20LkBxEzUl
         v9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgAfHQbEKyDT0MfaiI4tLCGWnSlpd5mtNo+zNvuQl1NxVD9AfQc4cyVHJpFxXdvGcGQ9U3qKp/y7eR4Ct2YPBNwSIeSQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy9FU9+OlQFe7P01wkzXp6QUhfcBSp4m09UCpApDPtZHxzP+L25
	M5hO02ccKQCHgqZkDHLcxAELiXeib8t/qSNHDgAIupKYmZJiFrJg
X-Google-Smtp-Source: AGHT+IG3Fr3DAUBPj8GLPNAm4ks3rzwBvIKqJb+swgsVGZLMVVTVWNSSmWBmlhUSK6XYv/MmSYZ9JA==
X-Received: by 2002:a17:90a:eb0c:b0:2c8:4250:66a1 with SMTP id 98e67ed59e1d1-2d60a8cb57fmr20610762a91.3.1724624300395;
        Sun, 25 Aug 2024 15:18:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:f022:f804:2fa2:fde0:4987:3a52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb8d235esm10740916a91.6.2024.08.25.15.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 15:18:20 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	apw@canonical.com,
	joe@perches.com,
	ojeda@kernel.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH] scripts/checkpatch.pl: check for non-permalinks to Zulip
Date: Mon, 26 Aug 2024 03:48:06 +0530
Message-Id: <20240825221806.253575-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
Commit:     6bf3f9e0aa813d96a096961c3e317d08654f6126
CommitDate: Mon Aug 26 03:34:23 2024 +0530
Content-Transfer-Encoding: 8bit

Zulip links to https://rust-for-linux.zulipchat.com can break in
case of renaming the topic or channel if they are not a message
links (which are permalinks).

If a non-permanent zulip link is referenced emit a warning and
directs to the zulip documentation.

permanent links are of the format:
https://.../#narrow/stream/x/topic/x/near/<numerical_id>

Reported-by: ojeda@kernel.org
Closes: https://github.com/Rust-for-Linux/linux/issues/110
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 39032224d504..a4fb4e724f75 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -735,6 +735,10 @@ our $obsolete_archives = qr{(?xi:
 	\Qspinics.net\E
 )};
 
+our $zulip_forums = qr{(?xi:
+	\Qrust-for-linux.zulipchat.com\E
+)};
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -3415,6 +3419,12 @@ sub process {
 			     "Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html\n" . $herecurr);
 		}
 
+# Check for permanent Zulip URL
+		if ($rawline =~ m{http.*\b$zulip_forums(?!(?:/#narrow/stream/.+/topic/.+/(?:near|with)/\d+)?($|\s+.*))}) {
+			WARN("PREFER_PERMANENT_URL",
+			     "Use permanent Zulip links when possible - see https://chat.zulip.org/api/construct-narrow#narrows-that-use-ids\n" . $herecurr);
+		}
+
 # Check for added, moved or deleted files
 		if (!$reported_maintainer_file && !$in_commit_log &&
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
-- 
2.39.2

