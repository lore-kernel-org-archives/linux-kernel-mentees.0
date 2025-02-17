Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE481A3178
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 21:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829322; cv=none; b=EWhnCleISXQckVANTmu91PeFrocoqI5ZOb+GeaTFMNFY37iTA0seOyzpbT26HZSYDc/njJQ3KugUQDzjK1KbSXEVznMN5I6Y+yA0P9hvpjZnNf7mAfsmudgc/URk7fbJfPuqpqawlo2mVQ95TWOp6Ug5162n7AsZCeOgolMbSro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829322; c=relaxed/simple;
	bh=Klq5PffbptHsOJVEB2b5DtQvJLo5pgHVICeP/mMF60Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oPcs5KtBkHJB7vvNRPi+n6zzkF4sAIJeU4X4Gtigflvh7hImsOA8FZf4/r0QNdCOEsfD8285gWHuJQ5cbRrNgjKdal6sKj1W9mYoCqqZTOkt97MKRTXDeJYHNhxwApd76M9OCWtDxj8Wgp/q9MB/qxqQ6RhjkdEE1WqDqUrxQAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+m8fqyt; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+m8fqyt"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCE480EB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 21:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CU7AU-GYDFYZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2025 21:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D18F80DC3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D18F80DC3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W+m8fqyt
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1D18F80DC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 21:55:18 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7270003d9c8so2775404a34.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 13:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739829318; x=1740434118; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYbyfH/z3kCWKfyK+UZYlz7QdA/EN+W4bn8ufKQeJxw=;
        b=W+m8fqytrtA9q+eLSZqCdetH2RQzzNQYfdZfHPaWlTNX6NvK3ZG1TkZfhPpl/g6rTT
         oJasDB+fjTF06QRxCa1hVsO8xddWR9f/I2NM5jniYk5Vs+4rz5+jXn7Lx+ZwhaRfNG3Q
         zojey3TGll0tOUFbFUxm3s081l76Nq5dE3udvXMfkpiFRaWW6zuh5JLpzPP3ryKTnISY
         /gJyIgsmn2hiNX6aUmW7OtPTar95R98bibJ68jL+GPTO1Ix+zC0EtqUdl9BAgio/WPk5
         7JChzZfJ7RS5da5fxpIlPSWqPLbcmrRxjxdrADSiuEyO1kO9x4ty0TeFcxLMz1Ipf0dP
         olVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829318; x=1740434118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYbyfH/z3kCWKfyK+UZYlz7QdA/EN+W4bn8ufKQeJxw=;
        b=DzdNBNAhqQY0TsINym5tdNgWWVD8Azniq/NXpKiBsHW2Sf8sJhHDuzwcVPK5G6tXmk
         nRdlPq4JtnI/9mR3zcAR7cTN9d65lSNwbJAN9kEHaE0LD08d91tP+Eawlpm4Gpck974c
         KIs6q+3qdr3icfsWsD/TIROwP8hV4hCNpiy5CMCz3hfJmM3eWR1nQ93GuYZtY8kHcKHQ
         GKAZJqIi9gYrr+Y9TffnN3tqs/JDTKgaJbIjBN5BdXrY/nLK+ZikplwdJvEYoiw6t4Ka
         mNGM8S52PUOfZHGLnf+kVNTvbc78UkPErbjbM5fove8LOXXQzn7UlY+vMtRB3gU7txHl
         4ERg==
X-Forwarded-Encrypted: i=1; AJvYcCVhwUF74ZPcFWEGB9CmHzBSQu8v9Qt96ymF5lW1ZZ+akKtgRm0/+xBalCEA/tN2gss3tPsDYb18g2l9Croj9U3ru+J2ag==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxwyERTvLcXx4Vk1zEll2ynyg3wvMrLU3RoTx4lnupEYaHIFgQm
	PRLCw9JkGjsvEOQIMxrqUAcMDFXrdco58v40NSfL9OFUe6L+Zm9n
X-Gm-Gg: ASbGncvF//uqt2rsvyzWd2luHU1i3U/OiQYrfAkShlrKf2u8aZ++YsH0SH/JJg0WAJ0
	0bhsHHre5Z1y3PTq8n3/jeC8Gfl9n7XxVwv79776czFSLKj7mrKgzet3iNy9xkuudfWca0XN3fF
	38savZdAq9JCcP+QXHRD8CMmM0Tfc0nEWM1zaopHIb+cBL84mgNwoCbDJf8fBlFMPaa94qJMV5P
	JXDBDyLtxFQT4XgmM6PXShDDDeUBmVsrOkNqE8qeYBWLFznSAeWXSplGQB2AX3o90KJf+At3HrY
	pU4e
X-Google-Smtp-Source: AGHT+IE/Z8qDavaEeJ7asNwxo7RVPa/QkzcDHNrjSkiIXGWHCNus7ijcxp/G6T/9w64ZpoGE6m7fbA==
X-Received: by 2002:a05:6830:25d3:b0:727:10dd:ca2c with SMTP id 46e09a7af769-7271203f2a9mr8475106a34.10.1739829317811;
        Mon, 17 Feb 2025 13:55:17 -0800 (PST)
Received: from fedora.. ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72728549a33sm518922a34.2.2025.02.17.13.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 13:55:17 -0800 (PST)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	damon@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] Docs/mm/damon: Fix spelling and grammar in monitoring_intervals_tuning_example.rst
Date: Mon, 17 Feb 2025 18:54:31 -0300
Message-ID: <20250217215512.12833-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes some spelling and grammar mistakes in the documentation,
improving the readability.

- multipled  -> multiplied
- idential   -> identical
- minuts     -> minutes
- efficieny  -> efficiency

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 .../mm/damon/monitoring_intervals_tuning_example.rst      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
index 334a854efb40..7207cbed591f 100644
--- a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
+++ b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
@@ -36,7 +36,7 @@ Then, list the DAMON-found regions of different access patterns, sorted by the
 "access temperature".  "Access temperature" is a metric representing the
 access-hotness of a region.  It is calculated as a weighted sum of the access
 frequency and the age of the region.  If the access frequency is 0 %, the
-temperature is multipled by minus one.  That is, if a region is not accessed,
+temperature is multiplied by minus one.  That is, if a region is not accessed,
 it gets minus temperature and it gets lower as not accessed for longer time.
 The sorting is in temperature-ascendint order, so the region at the top of the
 list is the coldest, and the one at the bottom is the hottest one. ::
@@ -58,11 +58,11 @@ list is the coldest, and the one at the bottom is the hottest one. ::
 The list shows not seemingly hot regions, and only minimum access pattern
 diversity.  Every region has zero access frequency.  The number of region is
 10, which is the default ``min_nr_regions value``.  Size of each region is also
-nearly idential.  We can suspect this is because “adaptive regions adjustment”
+nearly identical.  We can suspect this is because “adaptive regions adjustment”
 mechanism was not well working.  As the guide suggested, we can get relative
 hotness of regions using ``age`` as the recency information.  That would be
 better than nothing, but given the fact that the longest age is only about 6
-seconds while we waited about ten minuts, it is unclear how useful this will
+seconds while we waited about ten minutes, it is unclear how useful this will
 be.
 
 The temperature ranges to total size of regions of each range histogram
@@ -190,7 +190,7 @@ for sampling and aggregation intervals, respectively). ::
 The number of regions having different access patterns has significantly
 increased.  Size of each region is also more varied. Total size of non-zero
 access frequency regions is also significantly increased. Maybe this is already
-good enough to make some meaningful memory management efficieny changes.
+good enough to make some meaningful memory management efficiency changes.
 
 800ms/16s intervals: Another bias
 =================================
-- 
2.48.1

