Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD4194A67
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730961049; cv=none; b=qLrVLVyhQ49fc06NBSwQZryuKCcNdK7LbdaQJXLU2shJWyLn5dAQLJXvhbr6EGOEUQR3nSeplXki++WZUiR/Gsh19cfmqo8TLtXukg+o2B7jNppMD5vEJZbgNYwbYZ89hEqtVdmbwEIwc7UJYdB7rCs/+G6kMVUmMiZWH7gvgiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730961049; c=relaxed/simple;
	bh=c0xw6QFHGeT5H5b7lLLmPn/NEJNuTUlU1VlFcjgsflU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=US3NLnTRqwh76BG0lTfa2Pl7p3gOxSdehdBpC/PBr5Kg9hanvl4V98s/Yup0hoet44mHs9xL/3+x9WJKpEx6dUrcLU+FzTWra9mi+yU7AIqbS9uYC3mBzk4P4m6ucU7zWBkZjY4gltcanacxG/kFatsL29Ia02dOGtBLg7Hwvzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bzu3tteu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bzu3tteu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AB460B9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tac-H99X6tMC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B479B60B9E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B479B60B9E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bzu3tteu
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B479B60B9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:30:46 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso480695a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730961045; x=1731565845; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhAeNBnk5UCCI+1vhep/xtCYN3LRsWKDceL6il0Fnk4=;
        b=Bzu3tteufnK49hXyyF95yf0CEz8oMqYekEZ55wZPa8iv4cEmJaqLAwYpc12GBNkUvV
         iLofniStM7mv7vRK1ceLesI2Ledo7UZ10PZwpmzkyCj5BnmPIVE/IJEffO1zGTK6Prmn
         +fl+MAilW9rmMXQeZTP2Fyqa9Fk6mwD7032KCxzOV0EYHvJj/KImhXw9C+2pwkBoC2u7
         U98Pocti7+nuTk5JruPwkxRamnGUxoKWhMtazt0JZ+VayE15mxsNOcNR+dXMzqNS8deH
         1yKjg4YBIXvEozcuxa6zV18g+SojyFj6dylN4vSLw6iN44ynFp7DRLTJaSmz+PEOQ98z
         2b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730961045; x=1731565845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhAeNBnk5UCCI+1vhep/xtCYN3LRsWKDceL6il0Fnk4=;
        b=kbJ6yzwiw7oI1yVyG02Ofz41Q9tWX9Uikfl5dHq1u2Xf/gtWZnppv8X/loJrfNEi6w
         y4alS5SfbCxLWv4X9/4UNm3vil5g5T3q7a9VViylmiSWplP75/qj3DO/Ogx8PzO36x7H
         GGYQEYkdu69WQNhrVZULgNidTw+ec0t+H+QSdLjWJd6wWFW/yXB5/kf9FNE/fxhSDBIC
         K84EYi3w8yHyED4PkrtWh2Iu9wQIkHIYOMtYy/Wso1nlhi/GlD/uyOVOmlFL6RJZxIlV
         Q0e0pQczccFjCDcrdNwfb1u/rD+e3cEIZk3qPwogXQAVF5BkCVOhbgl8Geou1QXworSY
         7NvA==
X-Gm-Message-State: AOJu0YyqAVuR0ltXQ/iq3u7Ws2Bgd5LqgllAcyxZBVuMFiUwcnBknvbk
	iHJ81+ASWP/0yS7KZWw+xkdcnU/xY0lXjjQckdX+v8RIDeL0RglxS2YuBvpj
X-Google-Smtp-Source: AGHT+IG1VbB/6+p3Irp7fXFoIsnaAVKL1mLw0MG7955Bw8iIVmEoZqxiGeSAeKqdLDVzoK39Ar+Xwg==
X-Received: by 2002:a05:6a21:170f:b0:1cf:3677:1c4a with SMTP id adf61e73a8af0-1d9a83d0a71mr59470398637.16.1730961045398;
        Wed, 06 Nov 2024 22:30:45 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f8f4e2sm725206a91.26.2024.11.06.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:30:45 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 1/2] Documentation/mm: Fix spelling in hwpoison.rst
Date: Wed,  6 Nov 2024 23:30:41 -0700
Message-Id: <20241107063042.106228-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling of "focusses" to "focuses" to follow standard English usage.

Checkpatch.pl reported this issue.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/mm/hwpoison.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/hwpoison.rst b/Documentation/mm/hwpoison.rst
index 483b72aa7c11..dd02fae484dc 100644
--- a/Documentation/mm/hwpoison.rst
+++ b/Documentation/mm/hwpoison.rst
@@ -17,7 +17,7 @@ To quote the overview comment::
 	hardware as being corrupted usually due to a 2bit ECC memory or cache
 	failure.
 
-	This focusses on pages detected as corrupted in the background.
+	This focuses on pages detected as corrupted in the background.
 	When the current CPU tries to consume corruption the currently
 	running process can just be killed directly instead. This implies
 	that if the error cannot be handled for some reason it's safe to
-- 
2.34.1

