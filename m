Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE269322C69
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603361; cv=none; b=t3Y349O9+fJBENg/mi4km2y++y1wBAvF+kl2skCVDTiyaXK2xdnxLqIEhYqqV5Tt09vAgdLQb5c9/M0g8G0QsZdBiOD08yWtH9YPdEzzi0A3se+5iFVIC5IR223M0mlIMnYGxM3j8mZQKZcrBTk48FNshsFOyFuzTfbHACXCdUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603361; c=relaxed/simple;
	bh=mAACKRu2GTqBstWdWNkLHEkKcfTO5TYrZTgaapAZKgU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sd9nBPjUWmKRBpzMqGwK9QjmFJQPuuAt8BW1jInBc0M7VYLq1+MjUqVQLYBQGRau7mJQvLAifR7m4efOCO2t/eMxsla9snhJBC7fUv87oDaypsmtGdOh7ZcJG5OtJ72Mwdgz8ooitbYvzbao/4Pgi7EUCE1yw1ouZ3E9mDL6pSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwORFlMI; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwORFlMI"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C204057E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wr3J8zi4mjPM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 11:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9ED204003A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ED204003A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DwORFlMI
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9ED204003A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:35:58 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so6957398a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755603356; x=1756208156; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf6L6FqGTXveuVPUzp10ykaskFYUdj2dA8MqDrkWS5o=;
        b=DwORFlMILlWbIX7aJz9TeFzdkCEKL64+9S7PTWjh4Eq7UM1lR027P8xNiHvp6ZkmAF
         2neHPxQ/qcnVBTU7phFkth2I4CwJH4cANTxa1K1JIcHJrpo9OyJWmY9a+rY28mA+Ix1h
         yLk3PYRrnsorWpNbSOKJW9s7d6SpXs8NEKygmQZjb9+tHKP3uMvU2quOIT5mD/1cDFix
         55dkfWZHjSDQGDXR0rtBUzoRqKNYiQOv8PbpDhL5++IY7fp2uEcKdo9ZMB4hRdyyWVmh
         sNjmVUb7xbPTba0ZAr+IYd0OU5WtCWwL1Ke79ADhKOJ6XmP7i9GChaqOlc0rgJUIarj1
         JDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603356; x=1756208156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf6L6FqGTXveuVPUzp10ykaskFYUdj2dA8MqDrkWS5o=;
        b=LPKtT9JFRyNjxrh6HoXrpuD4paQkrA1q5DVDdYwhr8fTQUIH9cTgNGduLsQiZ8ZPxt
         Rln4WgSB1l2ur+LE1KbZ0oJxXNZFO2o+sK7gj5BLorE9apY9DujIauo/Ur2w855HMdfT
         kGE5+an3lolujDJkKvRsh9x3Qo823/7K1RrcczLRFZq9VS/L6TpT7oG+zC//sNlkRl98
         0FBeopE7jx2IOvAZadYlCLW6KSs3SewCKy/023mMLoS5uhdHZcp2jFrjUGb1d0Oam/Yb
         RUpzTtsw5Z5Etv52kBtzB42KtocfN42O2SGcLs/fRY4WVO7zi9s2ES72tmJnj7Qvqjip
         2lww==
X-Forwarded-Encrypted: i=1; AJvYcCWcORk8Xt/SwYJp6ukTg7lMz1+Zn0DriGGoGzs7OWOvRmApW1RlI+5ooo5mKRuuf7VVThVSJR/Z5u2MOkfK7bQNbJcvMA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy7FyqN8+qOaO+uWgF2Nv7RQq9Goj0U3K959M2TPt5JCYBGhbED
	AVkUmavbD8w+zafsrgVZrpaFAawJ51lNiS7uBqZB2a7A5iyjNqHCKMNQ
X-Gm-Gg: ASbGncv1bLMtg3hlHxnzLiWfBMbCxc9W3ltPM7LMsFIeCLl0+G19Rg57iPht31KSYsg
	bOH/JCcmQ467qGbVds52giMa4EkEfvMv17ztYVSs3cwP9QcJimsjxf+k1Fl+V0p+ihgXaAnheAz
	4WaDPq1EAMXOn01yzLLD+GdOXVwbeenCtQiCF5E1QJ4bBBEs0oM+V28vYJCzhHHjaOkXRebiLmB
	Iq6DLesGsqc2EO+kcUIaTukjUDZFMapXZMQHjkmePkoJmWxyLf7vulF3FXEVqDdHtufAxYjGCr+
	hC2AWbq9WJC8HNd+sW41LC2iTG4uuQkeMWXE9INBpJ2Lc9bhFHxyRl/qgJAqbZFSAnUDbD2Yg2S
	ZC2Ei5GGXXwKCXOP3mBlKq6cPOu2JOLLkKeMFH5fW+mrnAE4BE3Nl5Zg=
X-Google-Smtp-Source: AGHT+IFtuBpwQZP081NfMQsrqOO3SqKnQx1ZNzRETwiye1ictcIMfxWUcOeXzI/cOeH+3k3dzg0NGw==
X-Received: by 2002:a17:907:7f0d:b0:af9:8688:42de with SMTP id a640c23a62f3a-afddd0d2918mr189654466b.41.1755603356276;
        Tue, 19 Aug 2025 04:35:56 -0700 (PDT)
Received: from linuxlab.zamel.local ([178.216.139.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccc5bsm1013867466b.81.2025.08.19.04.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:35:55 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH v3] docs: replace a duplicated word and add missing SPDX-License tag
Date: Tue, 19 Aug 2025 13:35:51 +0200
Message-Id: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix documentation issues by removing a duplicated word and adding the
missing SPDX-License identifier.

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---

Changelog:

Changes since v2:
- Replace “that” with “the.”

Changes since v1:		
- Add missing SPDX-License tag
- Remove duplicated word "that"

 Documentation/admin-guide/kernel-parameters.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 39d0e7ff0965..7bf8cc7df6b5 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. _kernelparameters:
 
 The kernel's command-line parameters
@@ -213,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
 There are also arch-specific kernel-parameters not documented here.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
-a trailing = on the name of any parameter states that that parameter will
+a trailing = on the name of any parameter states that the parameter will
 be entered as an environment variable, whereas its absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.
-- 
2.39.5

