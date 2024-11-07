Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0441940B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730960360; cv=none; b=spd4r9LQGmnpn+IKCG6b64KbX2BbA44tQTpXJFj7t6yHl9MYt/9DkpNVhtWH//qcmYtJA4jRPL1v7A2Lsdc8IC7B+03/xNvA+nDEcpqV/1nfK2cZ/M77iHBWw/xvTxwJukh8W3/EYZhL7DlWrIT5QXqp96FAvurjMHoLgj3Orpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730960360; c=relaxed/simple;
	bh=ANxD13YAGSTYC6cNRZS2MistrSwi7MUahJbAyk88Auw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p6lRoBv35CfQ34OUTePPMoDr47qaOLpWsJM6PY7gSmhhRd+LQxXG3Q9+6HKUgJq1WEY97mhJirOfmuzgs6v8vIlw0P/HUWLaSkURdzRmyfdTYwZaY/y35YH7I8cww6R8JklGOUiuKXckukSC2nmzEfgF2xgzoKJ2vh1LVn2Bu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlhsLiTI; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlhsLiTI"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D14B7403C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVsgo03XaOrQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3E5C402F7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3E5C402F7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LlhsLiTI
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B3E5C402F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:19:17 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so429377b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730960356; x=1731565156; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+AhCXqAG1kLEFq3qc9uec/6rupnmZiZFxA7GdB80Lg=;
        b=LlhsLiTIcW2xadmYDFrZmIey7iwQeCUPbrzrk++Z/2+YdBXB8WuXrNbl29+Ip5XlZk
         VhDI7YeBs+3+Arj3Uo3uE1gGbxLBEvEnbiCrnKdjrTJ8X9ejLuGJdtYiOFPuMj8cOxNG
         W7EcEP+bkPpRFDE88bqP4Q2y1GY6UqcD5q7Jof4bTsCQdsIqdUAUxVhGyWZJcrnxMZj0
         bs9hbwvD4CRySlFsJoKu1c8mwoF2u764KMzqJxDu2CAUyq2qrmdpoAruTWudKcnDTli4
         Q/UdmbFUKwHuubAwIiEQkhrMyGNmlQda1a/JXq4uDVBkuLzbvU2BFBIJ6y43PJiUS07q
         5Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730960356; x=1731565156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+AhCXqAG1kLEFq3qc9uec/6rupnmZiZFxA7GdB80Lg=;
        b=gGzRX6YJ8GAmyx/sE5CUI2FiO0wfbK/jM7nHJg4gxHXVeVZPLxywmz2gh4M8lGZb3s
         2MU6Wia0pC8TqIcUYoinxUwE9Cyt1NwjClyO4o8aLC7CeYgtB0fmZYH0PIS4oh9e84ld
         fs4i6Ls68X4QhKVxZpmoXFhxmMBgC+TbiOARFZMsyYMOqR+XiQ966+hlcgL4M093qK9m
         DhZxiuKF0D0dX5ah0Xdl8WpFWVhmkID4c/xQeQFGrpBU48B9YznemK71dyS7y1f/VvIf
         qiuUxFtuct5qbBJXo+om/GFfsqRRVq40EHQAzoqqG93bMmxalJ3fEWNASx6pvCnUzPf8
         TK+A==
X-Gm-Message-State: AOJu0Ywr36ZxwXsOCPJP8gJ9zFUre0gb8wqCAf465Nkr3yW7HBwccKQ+
	CsBUTAIXc3ru8GKhW1YQgwpMn/046tfga4hCM7AlaDcS6vyA25gkTN/AEfiF
X-Google-Smtp-Source: AGHT+IGNBcdEGIHkv+fNvnfYUh3MUw696z8lIVcstfD0ZkGTSBmAMs23W89m3QsQO5uwBr67WzaqIg==
X-Received: by 2002:a05:6a00:803:b0:71e:4930:162c with SMTP id d2e1a72fcca58-724080b01afmr1146788b3a.6.1730960355859;
        Wed, 06 Nov 2024 22:19:15 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240785ffc2sm676523b3a.25.2024.11.06.22.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:19:15 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH] docs: fix typos and whitespace in Documentation/process/backporting.rst
Date: Wed,  6 Nov 2024 23:19:11 -0700
Message-Id: <20241107061911.106040-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Fix repeated word "when" in backporting documentation
- Remove trailing whitespace after '$' character

These issues were reported by checkpatch.pl. No functional changes.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/process/backporting.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/backporting.rst b/Documentation/process/backporting.rst
index a71480fcf3b4..5e15adc34799 100644
--- a/Documentation/process/backporting.rst
+++ b/Documentation/process/backporting.rst
@@ -553,7 +553,7 @@ Submitting backports to stable
 ==============================
 
 As the stable maintainers try to cherry-pick mainline fixes onto their
-stable kernels, they may send out emails asking for backports when when
+stable kernels, they may send out emails asking for backports when
 encountering conflicts, see e.g.
 <https://lore.kernel.org/stable/2023101528-jawed-shelving-071a@gregkh/>.
 These emails typically include the exact steps you need to cherry-pick
@@ -563,9 +563,9 @@ One thing to make sure is that your changelog conforms to the expected
 format::
 
   <original patch title>
-  
+
   [ Upstream commit <mainline rev> ]
-  
+
   <rest of the original changelog>
   [ <summary of the conflicts and their resolutions> ]
   Signed-off-by: <your name and email>
-- 
2.34.1

