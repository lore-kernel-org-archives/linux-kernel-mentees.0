Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB671D61A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739307193; cv=none; b=sPP/vb3CqBOHudCMYbPW1FFQ4Bo3fmtah0vdzt6WbJ/qOmLD3ovytAWTYmRghLNpUSTWFL3HyajrhO0yJlMgWtK0lyQerMixSnSZOGiRY6jFcTmdM05jL4iqo7dNieSBBsAMwiX2GiSYn3Brsu1Rlsg55JqjuKk4LpTNEQMi1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739307193; c=relaxed/simple;
	bh=f5so15wvllLwJOViF0DROD+1FvL8Ga5Pim2tDGafHXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B42tQCy8aN6a5un29oTbxWD484Y5Ackfz9FvYWZlss9CCpCUwqt01cDEpDdU/avOO+pJ49P+pcLMIIYDhoboyHk32GT5kFKR5mzfP9KR7bNT41jw/uA0Sa5xwW6Cch64Qqtlbvj7svmxWCFdK9U1J+tVKUcH0hBphesLDKGHYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ9wExZz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ9wExZz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C556782172
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 20:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyz9j9rbNP6o for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 20:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E9FB8216C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9FB8216C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NJ9wExZz
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1E9FB8216C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 20:53:10 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f62cc4088so72222555ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 12:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739307190; x=1739911990; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaVjMMsJscaMn+2OhmxAjnVzgdeuFkqahsDG8uQ0qsE=;
        b=NJ9wExZz3MyNMv3YahRBTstZC10zQRPcxthzehHaJDFG8OD8enP2TNY0AgDlfBtuYe
         7ZpybQd3yDc34BMLuE4m3gHrG4ix22pm6yGPygDLj5Po9w/ilI7lssYhaDavLQw4P3Mf
         x6wbauS1nK7ZDa/u8zaykO1rHUTu+0btPbhe8qN5DQU8PpH4Hzm56SIfjh3Rq9I49Rv8
         ztDHim30HE7jYG6/eJVcFHmZbicPKZg/WEncy+lc1knDE150zK2CPcoc+F594C2ZYRY5
         xGQHAeXNrgWxYtyQgLOIVgwF5YvbyviLeReaVCM4WhqqauHoWUqhOHWNEw2Gtfs5GpKc
         ZMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307190; x=1739911990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaVjMMsJscaMn+2OhmxAjnVzgdeuFkqahsDG8uQ0qsE=;
        b=dxBz18XMUOmR9Mixi0pLhEyX5Zx/PtF7gUUqtEDu6tL6VP3VlGlz3/ffGj7nDIbMf3
         WS0uJHTW+lNHP7VVayYUZYahmBnfr3TVUyjeC0twczDN5/9JiaLPs3cchACjFiptC3q5
         05x7moeGwY2zFPg7T66ZTOgoDle9nCX6UjPNqkk9VrwGcHg2T/XLQ5X0uP1fMvngJ3uy
         EadMeW2OeYCjCZcmFAG6JpZ6LThNu7wiUf5jO9rPU9RwgScnDyOmevD9xkh9lM9tLd/H
         OhC+MgMqZc45sL2uuTsIMklpvWWJY3FNcV0EjW+kSSa0J/5k7Mx9L1hynSqzNy6gMiYA
         Jn5w==
X-Gm-Message-State: AOJu0YxggSqL/Pxk2BfrklccDT9eBLHqI1BsIuV/K3HZcfp4qurdSu7y
	qsqOpoCBVDoHbG7vP31I/AgI+pbSOvZV/djP2GoEemK4Hj+N708N
X-Gm-Gg: ASbGncu3glhS+LHGBqEZzp6ldiTLLPjINOGQpYZdfN0ULFDepvzLVYmUDgvvPHztwC2
	9dbN+cNYeI4QtZiCBNDY7Ugr76kCSdjyW2A8Jrn3fV9XaRL2m3kcwBvrUB723uePinpT8OsgBlF
	M2/JcS9UApqWFJpNu5iB33L7JZQlUxUTi0HeECByHKNftgNTaJE3HiunCO6/4mo1e8vY+JYzt7n
	xpcIRg4EJsawLLKHy7K5FucNxkP9MictJ5pa13okEcon/J0mA0En+Jub0qoR9dfKo2VpbJ8Tqu8
	dFjXTGtYkxQoDPTPRWZg5QIJEY1TqUgmL2aLHNO4DLLAUS8fiDYqLtUICEsXL54SzdHMo+R6AAp
	Y/w==
X-Google-Smtp-Source: AGHT+IEZzm1UUiVqi/0GFubNjfy/G57vqzQpNv+bujlMg1duhO+z1oBFV8F+wFBfaGuU9Tcg5yC9Rg==
X-Received: by 2002:a05:6a21:6d94:b0:1db:e464:7b69 with SMTP id adf61e73a8af0-1ee5c7875fdmr1279749637.20.1739307190254;
        Tue, 11 Feb 2025 12:53:10 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732190891efsm2023216b3a.131.2025.02.11.12.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:53:09 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Edited extraversion in makefile
Date: Tue, 11 Feb 2025 20:50:01 +0000
Message-Id: <20250211205001.1971-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 829b56fcf808..56558cdf0a9c 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 13
 SUBLEVEL = 0
-EXTRAVERSION = -custom
+EXTRAVERSION = -custom-s
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.34.1

