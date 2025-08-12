Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA112F8BF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016395; cv=none; b=aD+UKnSzcYQfjFLSJUk+xhZkvhWGw9Os/ol56y+iWetbGqd2KkebcRpwVWP+pIgTLKP0z2BImJneNPH234Oe7Xz977/ghJdcnxc68n868FycBU8O6pK493asVfuUGaovcfiUikm49twGFCtczbTXWBbCwLNudiPAudlJGdsuOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016395; c=relaxed/simple;
	bh=f08XFR8IircaNgpPYMT7Fy0n+rjk6cJzLyG3MPy06O0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+IwdcxSD8IhTlu/cfl3ibsi8gqwzacjsxLVUERENrs0MkiN507og0W2sQJ8y1dG/dkybXulrg/QBYTWDnmqOxLvAZm0l2DVsoXxAxhjXY2IlRNdNOUfpWz7sswR9/LbT9ljyKYVbgG2olCf8uk6CkFyVbuDKjbw8tcBS3cOnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAnRHfE6; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAnRHfE6"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D91F60A53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 16:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkNdK1bZTfdk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 16:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=snikilpaul@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A618608D7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A618608D7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NAnRHfE6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1A618608D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 16:33:12 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3219ffcada9so1959214a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755016392; x=1755621192; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUAqfV6P2BvW2KJeyshLxvsq1rnCHf6iWhSgNpwwIrI=;
        b=NAnRHfE6EdloM7MOEG3DpVXdCySopPi7QYT58n5zG04Mvf7PIt+bDF9p2UcIZYJ8bE
         odXIIjAyafUU10fExk25stfJZq6wmbeabwVdmhwdfwCidIfa5zAwAwuPBu4u1qSp3bsw
         pZlwsTiQ3oKyKMmaGj6Nw8qQBW34Bo/Vd376OCyeeJRO1nQG7TjCmRmwNuMdW9z+wjBy
         8YJdmHCdPTkJTZ53vwmvXUo2ueD2Q5oJDqP1Sugmg4UHkY7t5IMnHkUWb7D0FP9B7e/m
         DfWg4Hm57tYuRjCnOEoJfaI8Ag+r5gxnb1UHOY5BClj/S+oVaJocVwEJITHQalQBxq7z
         LtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755016392; x=1755621192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUAqfV6P2BvW2KJeyshLxvsq1rnCHf6iWhSgNpwwIrI=;
        b=g3Cp0y06bFw+2Q4MIHTZmaK/471CD76asOdSxrNdMJLF1v8QrtppFYHLsuqzM/KYQk
         HvGrxrtHr6Pk1DHzbGwKP+LD3qZcd30XHZk2rTgNRspqkO8W27bBRytwsxzSADR8sRVb
         aSuoReHq51ipDYzXg9Jvbtf5PQoHudiJVv+yNbyntReiHR6ISjNxc2NbJPrV2WII9+tD
         srYqClWBulJEyE6CxuolEyBJMwPNfiqd3M2axrgmlcaCBVD89QLIXcIs+FcWD3dh09Oe
         +Spc0WOST+QAVzavNZog+g5I+i2yGgnaX4zZco71jDpOTQSwciUorvm0iuwrqnJ1iNiY
         wW6A==
X-Forwarded-Encrypted: i=1; AJvYcCVmOsncGyF230+b4WciOyPTpQkcr0zW+NY4Q2J/07UaFhvQSKG0tm/VWCFvjUzRbWYfp+2XJCFKVNppKBaJJPXieEPgrQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyszkNEIUzpAWnhI0+9be8zzq7JiC7y9exBoLlU4C/triyuvyNC
	FLM2sACZG9D4SLACpuuS7lZo1TQvFBwvp97LURMhNqR1vxDwxf8d+ro=
X-Gm-Gg: ASbGnctBQnWlyHnfY7IgnnDme3BNAx9CQ2V++FjqOmwTt3DRWBPhiBuGTkvreisXUDq
	5w1SlREzPnw/6kIVtq0ASIpq2RPPwEwjkziBD3zHu3tKcTNpAJAZawoFyit87sIMGXwW49gd9Gw
	iTDpyH3RS0L7yP6oKDgUettqert7Y94f4pgiF/58aiiKn8bZO9Tb6J5pyJtmK4bdOG1SRUdvvs7
	0l/hcO0g+gWtfjuxC8vP3ifK4nIu6ob1zdnyuAOKrC3IRjg8myYLYC/K6tVoWtqE96MBcouq1wR
	t5keSBFiPhYyZ4G0zdOpo2/Bq9v+VDwvLIEEpjvBvPqEofYStmVRhOApo+J1fbjky3L+9Zy1gMD
	NNM0xNnhU3CmYkdvy5qgfIoHHpMr1vwFQhT93JZ4Z
X-Google-Smtp-Source: AGHT+IHqEZ3rQaVCy+twTsvOt2mx75csoIYg1bVSRcP0tmlZVXsZ7CWak3N01tkgaFoJP+dkNIsjYg==
X-Received: by 2002:a17:90b:1652:b0:321:cf49:2c04 with SMTP id 98e67ed59e1d1-321cf8e946cmr285135a91.9.1755016392088;
        Tue, 12 Aug 2025 09:33:12 -0700 (PDT)
Received: from kerneldocs.. ([157.51.85.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4290df0bdcsm11937060a12.34.2025.08.12.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 09:33:11 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nikil Paul S <snikilpaul@gmail.com>
Subject: [PATCH 2/2 v3] docs: rcu: Replace multiple dead OLS links in RTFP.txt
Date: Tue, 12 Aug 2025 16:32:34 +0000
Message-ID: <20250812163233.7330-2-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is a v3 update to the earlier "[PATCH 2/2] docs: rcu: Update
dead OLS link in RTFP.txt". In addition to fixing the OLS 2001 link from
v2, it also updates two more dead links from the OLS 2006 Proceedings.

Several references in RTFP.txt pointed to linuxsymposium.org, which is no
longer hosting the original documents. These have been replaced with
working copies hosted on kernel.org.

Changes since v2:
 - Updated two OLS 2006 abstract links in addition to the OLS 2001 link.

Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/RCU/RTFP.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..8d4e8de4c460 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
@@ -1480,7 +1480,7 @@ Suparna Bhattacharya"
 ,Year="2006"
 ,pages="v2 123-138"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2006/view_abstract.php?content_key=184}
+\url{https://kernel.org/doc/ols/2006/ols2006v2-pages-131-146.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/OLSrtRCU.2006.08.11a.pdf}
 [Viewed January 1, 2007]"
 ,annotation={
@@ -1511,7 +1511,7 @@ Canis Rufus and Zoicon5 and Anome and Hal Eisen"
 ,Year="2006"
 ,pages="v2 249-254"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2006/view_abstract.php?content_key=184}
+\url{https://kernel.org/doc/ols/2006/ols2006v2-pages-249-262.pdf}
 [Viewed January 11, 2009]"
 ,annotation={
 	Uses RCU-protected radix tree for a lockless page cache.
-- 
2.43.0

