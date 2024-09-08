Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986851494AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  8 Sep 2024 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725789503; cv=none; b=C0CwITmnc+SFP7F71EEIJxEmv9FQOk3okG4ZoI6fNaRhxgnIBia7Jmjdqu8pBwgx7aAXlFhYToMuPrX5UfBc12lXSxryBIJRJlFpKzB3IF3aGdNK9dJ59FM/wyik5cY3DgHBUY1cuodSk1ZGeclJYpbC8UcUIWWL4gw9BFDNSvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725789503; c=relaxed/simple;
	bh=6oeTg6vHh7q0eLQZzCzj1O22cAhEkmZLp59KU1ULDws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PvILokd5oDZOTZ/+S4mX3g1x9RdhPbGfcmlrTdxc4z8gFACg7E0a8ua87WXtbJIR3fP8WzP1j0srv2SnfpCPitHanRYM8nY0vcJQJxjX0FDcaBdRHv0xLRI0iyh9ChLxaRGehYvUrxgX/D84JeC6XvJUZEx39xbSvIG8eh9IWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIYXchgz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIYXchgz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFDF40535
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  8 Sep 2024 09:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3wI3fDbOH_D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Sep 2024 09:58:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B13C1404F7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13C1404F7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XIYXchgz
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B13C1404F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  8 Sep 2024 09:58:20 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso2313363a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 08 Sep 2024 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725789499; x=1726394299; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAoQB1omJiKRCiW0edWQiKKiWvbNbr1j8v5Ydh1uH18=;
        b=XIYXchgz62FxfFZvdwUcMjvUaMjwMB2O6iL5Za1Q3eVLPSFIXlZP1jITUYrERiXMCv
         FYbLu7P+cUxJXC7VNeJpyLBulEoyPDR/Q5R+cVVzuvNZq+hYFjUlx1jf/zAuHKUGo6N2
         8mbVzg+D4mno7X1sZbIIDwdlCLXgd894NQVG/tQMcrDOX7tFStrhZh+EYcpYZxbnTCW/
         Ua+x7bcYoYkGiXPTyYy1EPnfzBkpwA4r/L5B80rL7T1HZ6FYwNWhea3gWaoSI5/xq16f
         pUAQAoD8AucHvD88DAFRfG33iV5B5+EUwOCPy7C7d+F4/4jSIfZBY8omK05xUpYmMWcS
         PdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725789499; x=1726394299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAoQB1omJiKRCiW0edWQiKKiWvbNbr1j8v5Ydh1uH18=;
        b=g2xiWzX3O/zCA547kk3hJm7nfrM25lgiblhC4Bq505CxclQhj41Znrf73jO10vmO+S
         x09JnxrMyjrXIsy6STaj1Q/gs713au0owMoBXlondsDsfnJtxkDt/L77SdHOoAMNlyn2
         YW4wDuZWJG3s+hURtwiOoN/M5OWKSWq9YaeYfpxpdPkZ9LLQBcOg/W4kWjt48cxiwELy
         gcW3IZZRf+5gYQj5Bukv4cmEsqPxSNb+HaSA/7nH0NYeCnvLHIDFW1YZb8PXuBt6d7KM
         exX5Mqvrqb8cH2YBL+x8AlmgvIqu+F2YHw/bQwUNO31kdgXj4tXFqU+bCjRmoo6dGIyg
         z+7Q==
X-Gm-Message-State: AOJu0YzghM/0lqj8eThZO3Xt50p2T4sXizn6iYuyAvTzIuNtN59NGb3K
	+cEJy9ujoFFX5+nFPxg1AzNEvtrHaOq1bDhxVEivLrqipKxEzcmKPSGsLFRl
X-Google-Smtp-Source: AGHT+IG1tyh7FXGcc/FL8xmuPR+sjo30QSf0cdeWnoaQkMp3eMQ9w+mZ7rHcN2lXnKFolhURN/1b1A==
X-Received: by 2002:a17:90a:e150:b0:2d4:bf3:428e with SMTP id 98e67ed59e1d1-2dad50f3f3cmr10585204a91.37.1725789498451;
        Sun, 08 Sep 2024 02:58:18 -0700 (PDT)
Received: from 0x7f800001.. (2001-b400-e253-9c9c-a6a8-ede2-a4e3-a1ed.emome-ip6.hinet.net. [2001:b400:e253:9c9c:a6a8:ede2:a4e3:a1ed])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dadc07617csm4563931a91.32.2024.09.08.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 02:58:17 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Todd E Brandt <todd.e.brandt@linux.intel.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PM: tools: sleepgraph: Correct the home link
Date: Sun,  8 Sep 2024 17:57:22 +0800
Message-Id: <20240908095722.7683-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 01.org/pm-graph link in the sleepgraph.py no longer point to the
pm-graph home page. Replace it with the home page link in the README.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 tools/power/pm-graph/sleepgraph.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/power/pm-graph/sleepgraph.py b/tools/power/pm-graph/sleepgraph.py
index ef87e63c05c7..f95061d6069f 100755
--- a/tools/power/pm-graph/sleepgraph.py
+++ b/tools/power/pm-graph/sleepgraph.py
@@ -18,7 +18,7 @@
 #
 # Links:
 #	 Home Page
-#	   https://01.org/pm-graph
+#	   https://www.intel.com/content/www/us/en/developer/topic-technology/open/pm-graph/overview.html
 #	 Source repo
 #	   git@github.com:intel/pm-graph
 #
@@ -2753,8 +2753,9 @@ class Timeline:
 	def createHeader(self, sv, stamp):
 		if(not stamp['time']):
 			return
-		self.html += '<div class="version"><a href="https://01.org/pm-graph">%s v%s</a></div>' \
-			% (sv.title, sv.version)
+		self.html += '<div class="version"><a href="https://www.intel.com/content'+\
+                '/www/us/en/developer/topic-technology/open/pm-graph/overview.html">%s v%s</a></div>' \
+                % (sv.title, sv.version)
 		if sv.logmsg and sv.testlog:
 			self.html += '<button id="showtest" class="logbtn btnfmt">log</button>'
 		if sv.dmesglog:
-- 
2.34.1

