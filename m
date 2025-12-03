Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A530F552
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764793393; cv=none; b=HpWfbqBh73CvX0PnsXsrDcFPD4ZA5Ivetc1/VTF2D6KFMHKIdGK/UiGRPRp32llDnEg4HB12TuVLDaTyHd9mrdvrAJkwwW6pp2/haK55Tugd6OTXrkDeyJlI/r+ELfhhDbYrAcEfgmtINJYodOtS3dksVJpue1oEMX4qW5B34H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764793393; c=relaxed/simple;
	bh=0f2cRLdtpfZ6XvzrazRLf77iCUv6pFST8p4qLMv4o/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQYMi4FavsO02UK5755iJ9nQ7bZUtDOKLuci3IWPJFKSOYFnHBLYJfQkofwraV6kIf5/4UFhUor0JyCwpcXyhBv/5wUk1DUxYjBNwOsBWFes3koHaQsXkqvyEgt/RjYu+aMS+QriTVTWQmL6NaBFQRhxGAZp4pQx7B90On9o/SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtDn/vaQ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtDn/vaQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 279CD40058
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxjFHoH8UoPb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 20:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6125940028
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6125940028
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VtDn/vaQ
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6125940028
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:23:11 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7ade456b6abso109141b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 12:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764793390; x=1765398190; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1l8AoDl5OxCUERbVgKYnUrs0Din3CsV82rQuW5hqhlI=;
        b=VtDn/vaQb30B+tYAxBFASOmVzmQfYh+l74f2cr0zPYJNkT9pVlogxjU5ymqSuhL4VE
         90gPum/mgfOr4vp8ETIqIW3+WoNl/wNh++aos6wo6bRK6OPV2QZpOzlcA873dqdAXTeI
         HtJeCvmTwXuWa6+466zbZU39lWpvfPriMZfdMh1Tr7vn42UOm537QJG52tbVXwhTj4pr
         7EFLOlMz46XLFgmT0XDZ1t5PeGFH8k6PWsPAoNnECV5z60I6PCRDfmhnHC1Mi+nAcGrb
         QNo25Y8HOVN5+HFjQedXHVmE6MnUjDDeX8g6bydTApOkoyJuHEKF9ogvZZeuivz/grk0
         TH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764793390; x=1765398190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l8AoDl5OxCUERbVgKYnUrs0Din3CsV82rQuW5hqhlI=;
        b=GcTstCtroA3tOTYCenygk7K1634WZXT7tKnQeepv5DRxVCPRNvWybRG/ipVGSGGwps
         My2qXjAi5d0dKhWDGHgacETJoy0cKjB6XJXg9gMqpXO4LnKAnRsxgKKuYEXTD05+0KaK
         hmEU2ygaGDSpu10pTld0eWLMug60ye9v48VkgK9zSQqvXINgFtp6daGEmwxiPk1GphgF
         UA20HWsylHZSK9gWSaBIDQhjs8Ji9ANaIqVt9RXPQiYuMnFBZ+lK+hHFDWVk750FEK9L
         Ma9r4ftljiA/4xVBmfLAFGcC6N8G6g34GaYNKnVUj5l0f8/6DNWewgNivaRkF8ZpjNHd
         JgtQ==
X-Gm-Message-State: AOJu0Yxwz87b3hNq9U2I9mxK4N5L0IWUxyIhZDu2O1tduOFmMUjtkpu5
	5OTfXwROBQDrXntWLpbkTTPceH9hpHbPOamd+liJqKc+tKvIVpm0/DZRrFNroctY
X-Gm-Gg: ASbGnctHAFN3Pg0Gr7onrEQCkCuDOWOzETIMnD27PuruLX6PzDJmMFiEAzHqK3oRQbd
	RZg0I6mRXR7n05z5ncGqIrjBqJISw6Q76kcZlMG35EheiOp1jd3cskGUw+2ZyVblVzI43oqKC2n
	VdweXyol9KyLCTZ2Ugzxq7dVHGn9jr2g9VR/eayS5fzdZTpzUuZS4hQIy4Og1yYZRngw6VeBwmD
	ewNNMVmKRTdJIXLZHxL5oVjT+k+rTuexLgC088PS93Ama/kz9eucJdpb3rbKKykNlcr4rLGJXDq
	BhXWFa+GylUUotn5BgkWa5vYdsdGJZ7gHPGP9PcdnJHU6gpQQaPBzVW6dcuhbhgxmsKX3sIh1jv
	bk//fuhG6FmYgO6AUfzARfwep/LX/XePw5cDxXJ9wn7gbgwqQYOveekawum8noM8D1fuP1B/i3q
	BpCJ0lRvDq3FeRND34iWyg
X-Google-Smtp-Source: AGHT+IGUUL9n7DaIa1cXN6PrpkeXmukJ76Q6yRwk7pkWsuHejik88WLcCt6xCXQTWG2Rg79pZuVvbw==
X-Received: by 2002:a05:6a00:2d0b:b0:7b8:c7f7:645e with SMTP id d2e1a72fcca58-7e00dbe88a9mr4580243b3a.17.1764793389917;
        Wed, 03 Dec 2025 12:23:09 -0800 (PST)
Received: from soham-laptop.. ([2409:40c2:116e:6f1c:ab6e:2f5d:e763:cc6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e15f4e0810sm1287230b3a.7.2025.12.03.12.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:23:09 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] rv: Fix dead link to monitor_synthesis.rst
Date: Thu,  4 Dec 2025 01:52:59 +0530
Message-Id: <20251203202259.69116-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst' in
commit f40a7c060207
("Documentation/rv: Prepare monitor synthesis document for LTL inclusion").

Update the reference to point to the new filename.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 include/rv/da_monitor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
index 17fa4f6e5ea6..c2cea209f230 100644
--- a/include/rv/da_monitor.h
+++ b/include/rv/da_monitor.h
@@ -8,7 +8,7 @@
  * The dot2k tool is available at tools/verification/dot2k/
  *
  * For further information, see:
- *   Documentation/trace/rv/da_monitor_synthesis.rst
+ *   Documentation/trace/rv/monitor_synthesis.rst
  */
 
 #include <rv/automata.h>
-- 
2.34.1

