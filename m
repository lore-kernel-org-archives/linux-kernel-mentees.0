Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D359303C85
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107025; cv=none; b=Yw7ddgQY3C8Lf24CWzWxV7wn3MwRhDEp584OeFwjqxhDvP5WXst2Un2KqOaawvHVvTI8R5HsljDATfQQcADAHci19DBsw2MdguCR7/ZGIeJwWU0+a3UM/Eff+nOQojm1028mdEBYZoKzF8CZ431tXhV2tUelxjXIvGaeAVAWVKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107025; c=relaxed/simple;
	bh=4ae36tRi3PU/3UT1mJdE5cZkGTgBkmzJ2cMeSPXOMwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1dfnU7ppd4nw/+Iy9+WFrNoZHi90XMNLggzqhy7ZHlaBpdK/00/SlK2YHsiNGbhO0vGttgXgffs1KNEGbwu5EY7yyn0av0wpOtFVrfczs/JECWH0clbCR3xxLHA2RQPqD1wcB8EQADmZ7TtrcDJ4kMG392+nK0pusqbxzSH91k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6ttLdvF; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6ttLdvF"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3072C60DE8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 17:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nd2lwUuVl4wR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 17:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0AE1608AD
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AE1608AD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F6ttLdvF
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B0AE1608AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 17:43:43 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-244580523a0so203295ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755107023; x=1755711823; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs6kqLC/rixHHn8q7Q4NKmo+nedL3ADh0S7vLhAQbSM=;
        b=F6ttLdvF7mkmstQCeTXQjT7mKIH6R08q2z6I83i1as203DLmCkO5zDMqzBCAVCtNyV
         wV8ffr9a684Zs0kW/iVJNCgysLsbIFmSkOoBAIhNSVkfYYt59k2oFbleWaQ1PuW2Vvny
         2lJFc4kzzIaPVOMW+gxzlgkJA07kRXw8ogOvp+gOphuu956C8QTjNOGNzqd+sYf5XEW8
         7L27Y7sq0XLXtdoTHshbFE3McH1xTKy/LAeTp/RVgRxH0g3EEtU3DXU36/zcvjgfJ9ww
         n1rUyBQdgVC4hL0m7EO1Ny6fPptjLiPWw0R26WQiQAUH9+m6ESRzP+EoPB6iC4bmMb+a
         r2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107023; x=1755711823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs6kqLC/rixHHn8q7Q4NKmo+nedL3ADh0S7vLhAQbSM=;
        b=RrHrJo+pwuCz5yq4yiGceLSjEe5emAIYnZIGWbjS6j6JpTt3R9GRdQIFIwgNgFp6Ff
         LCn0ZcoIKV7Wwde8bgpBIEal+eede3Wn+hhRcXDYUxmIuQV7w5cSRLCAHxFdr26eZ5MN
         hYSplYMKlUA4JXAY7ivyNsEiEK4hAXLIyZlDhrx12q+S853VF377p0dHCKaEoYvCc3sA
         XZlQCAQlljv4ooA14lwFQf3zisScB0pzvsvj054KnyYO+x625D8LxG6t7Z7lu6h2NYk9
         eESAYokvvuqfqkISDF3FwxOaNwzQzb1rI005F4B26N57ZtKFAfn34lx3STy1EI/ZyN6i
         bZvA==
X-Gm-Message-State: AOJu0YzAyfJOTrrmYc8ExXJFIiSwnYljaGnLeEqDu+NYDA9pNWCnT4uG
	CxORVnAmmhhNBgOHE4g4BTsyhxjJu0DDCmpHMBUuIzbxtVolRO0+5nNZ
X-Gm-Gg: ASbGnct/P/qO9F3Jloj8fu8mCQ0e7lT0QW7n0qsff/qdgcBAKTXLdQXDcSgQp/TAtzA
	8pI8s+nvJGQAgYiHaoFbRVWFoFnN/kef0WhKuC9CvMxuqDJJLUwVOIt8ocA5g60GE75X6UBv8fN
	5fwatHxwYOf023FOVKs5nAq8cniVPe1buAtFM32OB4qbHdSbDDqMleaxPoAHkzyfPXBf4qOJ2BY
	UPH6M1JEuSPYv73YBuhsj4vBvly44UNo9M3D4ranMBatOtHVkyej+DqtarbdcjoL8oN1SB0nNFK
	JXdm/o1fdG//E9Gv/HJDS7ts2n0ZQsSR5m+ycYnmO3cLPewkt7NbC95tYo6kpsDni6C1i27loC1
	AXsXFdf7Q0CKKVSCRAWZO22gkpwrkSRBL4cSACw==
X-Google-Smtp-Source: AGHT+IHeWZrMY0SpduSv94DixCO8Uh5PWkTUzR+Ce7RdPyuWbHSYiqgEmcINE7pm5wSpKwfxczrYtg==
X-Received: by 2002:a17:902:cf0b:b0:23f:ed09:f7b with SMTP id d9443c01a7336-2430d2379b8mr65133455ad.48.1755107022653;
        Wed, 13 Aug 2025 10:43:42 -0700 (PDT)
Received: from lkmp.. ([49.43.242.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89a6ec2sm330108525ad.145.2025.08.13.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:43:42 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	ukleinek@kernel.org,
	rakuram.e96@gmail.com
Subject: [PATCH] [PATCH] Documentation/kernel_hacking: Fix minor typo in hacking.rst
Date: Wed, 13 Aug 2025 23:13:25 +0530
Message-ID: <20250813174326.6544-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed the following typo in 'Documentation/kernel-hacking/hacking.rst'
compatability --> compatibility

Signed-off-by: rakuram <rakuram.e96@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 0042776a9e17..22b880add846 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -794,7 +794,7 @@ Some favorites from browsing the source. Feel free to add to this list.
 ``arch/sparc/kernel/head.S:``::
 
     /*
-     * Sun people can't spell worth damn. "compatability" indeed.
+     * Sun people can't spell worth damn. "compatibility" indeed.
      * At least we *know* we can't spell, and use a spell-checker.
      */
 
-- 
2.43.0

