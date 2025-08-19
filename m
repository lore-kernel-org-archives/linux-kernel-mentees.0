Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F963090CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755626823; cv=none; b=VPH3y1BeDvyY2E9mql0Jps+zqRK3+AUHbSShLAI2crc0Bkzqnu+UoWofumZePITgAsK08EMyJo5gSFvOVKzERpj/QM/lPRwGriFTdXK+VuhEHUPKhO+1ysabEaKeJfIS9odBpDpY1PiH9GPH2PZ6Rm5uP6yJcvUX8yrjPkZp3YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755626823; c=relaxed/simple;
	bh=3DxhkkThZ4I+6qbZl2FvYXszNoptrc/VngFBPXWfh6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4RnOJ9kVb3CJHi4zsowvXEDZHfCjioojkFq91s61TkXsVQQkx91oKAIB2LV87cBqpPEky3GU+Tuz0SdGQtpj8aqQR0gB7fVo+AXsgf7N05vcAmac7BmjIE9SI/82htUsPFAePWXCybtMsqW3cmwxBYPrpGAb9sD5vGSX0tvoxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VChKVn72; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VChKVn72"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042B4812D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 18:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8C7_wBvSZIT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 18:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=snikilpaul@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 330D080C1D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330D080C1D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VChKVn72
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 330D080C1D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 18:07:01 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2445826fd9dso66204645ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755626820; x=1756231620; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0R9p2fQn8GJnwVe64YN9Xd1bbPGafk73sPRkSBdSdk=;
        b=VChKVn72S9B8q9ljjA5ili+p7rSAUYzOcD5YZGQ1We/Em/9vmzDBXf11hWyqwT5Cb+
         5kwxrp2byAeR7HFyoGb9ET9874LDCfWlKj/CWx+Oawh4Fl/KYBqfysY9MHG/mnylj/be
         7kVVYPWKEf4ompqcc6eusfE+BXOd4bbeCWKcmVbeIcNvL2EMHvVlUbUTwLKRZtSlg87f
         kKrRKsQupNhFL3yXH8T4vgm9OYwUKaqjkNdrhACYJWUz75cjZCO0H5ZTuBJwIjAgyXtf
         6uIDTZxkLNNA6zSfpR1xFFemBKwkophpNUEMuyzanbRzOsNfq2d9klep/t/wLuX5iaZs
         OfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755626820; x=1756231620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0R9p2fQn8GJnwVe64YN9Xd1bbPGafk73sPRkSBdSdk=;
        b=q5z6GebSYXU5U0azcmGf/xZmdalMIVebIqfW7zVGs+8d8xBwAvopl/epOAuz3502Af
         yo/5dcQkkko3j7uT1/BvWf7xCVM5GxprzE1yt3k7gmc6rdmTJPYt6+ndrdjuQ8WmfQh5
         w6WLamV+KYoun2k6XNr3zCcT2nXtn4x/VEezB01kHNpm1oskH/9hiu2YHT9LHVe5UE00
         Yn9CiiEJdO7aB/J1eJTKU+vOUShC3+obdycTljE8ocK7NX12nLxcbSfLDcPJQC1nAmxI
         rHH0ohsfAa8DfWIrJtCDCxaA4ym8C9JzBK4a7BqrHogViNjqaGhSyiD8hyixDKk9P7Eg
         vUcg==
X-Forwarded-Encrypted: i=1; AJvYcCX/wWqtfLCtG2137fn4GyUSy3MVKc85TkqWxMcHFMBx6LZGI/ORdvvsSnil4b7XNiv+gx517C4IwKUOTq6hfP5FcO+dcg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxJ+ZGtDdR7nwlQeL/Xu5FoNTLWLstUFkL59LH9GzXTqACMIOYa
	Rcj8RZyON3//o3xwgAPkz2Wr7wGuHewkJtcadBNfYA25zhP9IgZI+YQ=
X-Gm-Gg: ASbGncvCrYTUpdv9Pu+0YL9+xk5Es/GpX01LoRbK/jGvjNS6pixsK6WdWnYvFyW5xBI
	2yAtfPJNW41jsp/wc8YwqBWZ2okLz/uCWBMAFGme3HXatEy+4QGS2Xs8M6Y+SAcffA1IAs86nix
	ICtJw/14bDTq4AxZVXL7ncivvXVgStBKxh6aWFvsLlwieblgvT/k5w/Etwq/U8VQJt7UAYXpAVX
	1RU23HZzoeXpTXnZFMWHpOUJjY3gCyFKu7d4o+cUFD4wFTCtjPiEAmeKkXO8CbOsox9/Zbk77A/
	nVRUh89AaPjEvqy8ZmlW9X2/DKzqjjzR0VSqWnndmgYN5+1I2DagDyYElpqwL8j4P8/uNof05lV
	q6t5kg89lcvSjNWbw4N6DjIG3LGgmh58/rdCpVcMH1vZv0igJhTE=
X-Google-Smtp-Source: AGHT+IEMUDDAgxGLdiNk+Ulj8E4woihdXtGuuFLm76/KtgRJfNvTjmcIEctMlTiCJ1kEYYd+Xu0+Qw==
X-Received: by 2002:a17:903:2389:b0:240:5c38:756b with SMTP id d9443c01a7336-245e030b78bmr37919655ad.14.1755626820047;
        Tue, 19 Aug 2025 11:07:00 -0700 (PDT)
Received: from kerneldocs.. ([157.51.109.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51ae48sm3200305ad.139.2025.08.19.11.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:06:59 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	snikilpaul@gmail.com
Subject: [PATCH v4] docs: rcu: Replace multiple dead OLS links in RTFP.txt
Date: Tue, 19 Aug 2025 18:05:46 +0000
Message-ID: <20250819180545.3561-2-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates several dead OLS links in RTFP.txt, replacing them
with working copies hosted on kernel.org.

Originally posted as part of a 2-patch series, this is now being sent
as a standalone v4 patch to avoid confusion.

Changes since v3:
 - No change in content, only resubmitted as a single patch instead of
   "2/2" from the earlier series.

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

