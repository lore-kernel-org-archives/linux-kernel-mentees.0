Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03909C8FE
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Apr 2025 01:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730114; cv=none; b=hiGeDCWZLnBIZwFbmIU2GLliEf9ynZ9nFZ0fXbgLusQwnrpGTcMEiJ5F2BaOHFEc+9BlBUHykx+dcwkEjcMFuREHXgyWKARfJ6xsVqqL9PT+7zHqhTFj73tSP4w9u09hQ3GxwHrS77euYrWMFGGqdC2FLDZfbmSRW130kxkSyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730114; c=relaxed/simple;
	bh=rIpbipKaSZwzxcSazWpJgiVIkWHhxh9wS2F9QUtHSq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6PNlcdTB92J2BcB1E1gnKveK3PPwUqAwCMZG7BLYIjXXpGCLvOVbmq+iyiuDImXvjm3buwASpWpeTc+56UCYk9ICgadsnZ60ByaiiYZGQWg8oiDGOCU+2Uya6uRMut5gposz+pUqKLRmKXKpRyi/29BMtCiN7USCzhzgMn2nOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsHRva+j; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsHRva+j"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c6a59a515aso98069085a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Apr 2025 18:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743730111; x=1744334911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKJu88jh4mbtsr5rz+BBFFaZRXP7TxJVqLawVpGfJpg=;
        b=ZsHRva+jKmd/iUpxuTMc4ZRCRA0l5MXnE3dicryw6KSSefrSgKd8LRQI/YWHG210Ni
         QQ8BvGx+RSTGP5rLFccTG7zU0hmfqTXd/kxCzLfwEljr66silYj03cikqKJXiopgBhAc
         p/y3tmsuWUBajx/wEjpByLa/EnaEVmIgMXzd/4q3rFazpIA6akKJNVo4v9qLpKc+MfHr
         4sTiKr/xd85rjq5+1LrQkoGn9OirSM/hCpMMy3PvvuMdY9nO9SBa4aCyVXaFqVrS3ZOx
         +NSEiqasMePIvwhQj/Q7/RXh1E1fD0tm391ZCk6/7Tnv7/DHJwdy9C7XP/VjuHz5yIEc
         vuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743730111; x=1744334911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKJu88jh4mbtsr5rz+BBFFaZRXP7TxJVqLawVpGfJpg=;
        b=o8afHybOhFZRoOPEJih8KNkbpvoy+b8LwhLOfPJ/rpE0x8GpYVz5c3ffJailB/Ak3p
         Al3K66iiORfZadKrCgZi+UgNNF9bFuLdxoROAtGmM8uzc51G4YLx70GPARag5QcMDHSl
         d9fJFY9dB2zZrufzoaMPbm6jlY75JbcLVVlvMrp/1umPmM7hWW5QPRsGswf6o+pudO9j
         sbUFE6GgF7Ag6kHiQdnFxmH2b9n5dVcPzWTWRZ9OUjwO5StXCn4r4nxWuz3wNLA1YeR+
         W0+BFE1qXZTandfvDyw5Uj4FyC2KSWjkOe3sEuz2JXKocAnoAs5RCJdm19PsR2shRTZk
         NEEA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Or3aBGksJZT/zuvjaG4ytiG9K4OkV4jlj2BZdsS0BvVs0B9s9eHUzDMt8+WFQjgGnnB2cXCI45UacMzCIVYhJjKW2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX7+jyOkP+o+AiMDgdATXHUmh1jILCkwQQq13yl3iQzVIrOjnH
	7RyoQQMrr99XP59L/Pn8ApeZXGdw6dE6Swhwdc5u6fv6FzI2jTC5ucYwJerwX2Y=
X-Gm-Gg: ASbGncs2Hiyk/TXkwckFN3zdc+XsxAXhqhLEo/bMYYQhKjqsl/ab2839VFRtxmSE6cn
	Q9OTGqmRu9PwWLeBPaccT1IiutYH0xUYzfdIPSPoAD4iRJ/GqORSrxONFvkiRYWF0C6MBcOhiok
	W1ecKypGYprmiqnSoqk3qggRxjPy+RMYfWNgQYrRiX12jf29d2kwgHkz58cvkFc/wNXXorMuXL0
	TzQ7Oy1ZeiNmnDE4PyBKpKmbfsC7n3vUxBinjLjU/CCZrG7++fUPLI82V8kXkQYoKyIToAU2BwS
	0+U8PmHyX6b2Px6q8/TKlwKcG+pOY/9HLecsPVHkhr6EsWQiJZpc6W5Pe7HSRv9Fb9nF7Cc80Uq
	T6wkA+9fF0qexelECZK9THm4=
X-Google-Smtp-Source: AGHT+IE2g3ZuJL9kYDpe6cJGOiCLNdbrBbng+BtoV0uybDV4dNGAypsGfwfrcNl5Sr2kL54wHyMiDA==
X-Received: by 2002:a05:620a:1916:b0:7c5:e370:5b1 with SMTP id af79cd13be357-7c7759eab09mr143479685a.7.1743730110894;
        Thu, 03 Apr 2025 18:28:30 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58f95sm147401185a.80.2025.04.03.18.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:28:30 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: kent.overstreet@linux.dev
Cc: gshahrouzi@gmail.com,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/3] bcachefs: Fix type for parameter in journal_advance_devs_to_next_bucket
Date: Thu,  3 Apr 2025 21:28:21 -0400
Message-ID: <20250404012822.188485-3-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404012822.188485-1-gshahrouzi@gmail.com>
References: <20250404012822.188485-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace u64 with __le64 to match the expected parameter type. Ensure consistency both in function calls and within the function itself.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 fs/bcachefs/journal_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/journal_io.c b/fs/bcachefs/journal_io.c
index 2debc213e47c..ff2fd20aa8b0 100644
--- a/fs/bcachefs/journal_io.c
+++ b/fs/bcachefs/journal_io.c
@@ -1460,7 +1460,7 @@ int bch2_journal_read(struct bch_fs *c,
 
 static void journal_advance_devs_to_next_bucket(struct journal *j,
 						struct dev_alloc_list *devs,
-						unsigned sectors, u64 seq)
+						unsigned sectors, __le64 seq)
 {
 	struct bch_fs *c = container_of(j, struct bch_fs, journal);
 
-- 
2.43.0

