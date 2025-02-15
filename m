Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1D1624E0
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739638856; cv=none; b=in9oHzvgjOuypzXn3VO6T6KZUQiej4vV5IlSa8JTfNgyGKjMdctzshBKOgW5PjeGlWCOcx6jaJVZikOFl6aZP7TziupQmmtkqb26EZR+zrchvDoUVnDGzSdBSp/HYUF8fok6tLE/8q8X7gqvycI45d9qElpZ58eQQClHOkl+qb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739638856; c=relaxed/simple;
	bh=uy5cH16JsX4JeqEfRAx/FFIcMBDLoTmq8s1tlKdmEhc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=t0ayUAu0psa3iJWVD/1iJ+Mj0v95pqXVfHrYB+65rjfw02uqviLsCN2laYpnx2PcJ0gfM2m73N1zgZOUz/Vkbq/Lfj43wNIAwFd08leKFZPbqtdOwt0AJmG0QlhMSC7AYs9hq2WnftrLedUlb8H0HkQJ/bVFQknIh3ecGznVVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNyDnO17; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNyDnO17"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3d3d4fc40so2082675b6e.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 09:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739638854; x=1740243654; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fFgotg9MMog9YPyVCTVdN/A41r7u9eJzo/q5sMJJgW8=;
        b=VNyDnO17vbr7T7z98feKPhMCqyi8jAAruMpH61D22F2ki3ExhwgJ32Fqdm1p0kObt1
         1VlDo11BRz3v7AcMFbV3oVp17+B+SU5KAHmF7hGSLA4tZBLxcGRSAFLSKmKIZd2shFiY
         YDPv3La9VTT70qx0hqKRWG4iSM5rjQuunz+V/+nw+OOFZHUw9gANwEtjF82JL3n2FB8+
         q+l7jWIt8lJEB9h/YGKBAh69i1xnxX13fl8xVnhRuTngwBs3AcbhJyzR/S8vQGh5cFmB
         n21Qq4VmRMpMVq7vTl3AnPcxR2Q+3T4xJpVgMHtknZ44a8u+CuwdS8drAk97ROjhlUPx
         nkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739638854; x=1740243654;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFgotg9MMog9YPyVCTVdN/A41r7u9eJzo/q5sMJJgW8=;
        b=JmCh2JNRkwGTzFSSSsqyoUYBIoJfmyMJXbxV6GeRhQJll9QXS8CDTaO1NVvogCsx8A
         SyY97Xq5wLbnlaNMJhYaDejcH9FgPPA08FSpsi228goVMkx/AodUR1SLdKSy1SLDOgl5
         7WDXm98tDIhAsi4C74w9dDQ4WVUomfpUqBhWYiMIEZ7pjc2nRZ4kn0hzZYDaYuFIic2A
         8UAQckuTL8Xt2JE1APo5nZKMOeswCbklOH8c25FRSoRfI8co9Q0+IXEWapq0WSeRWc28
         G2N3XU7+EAym4YZhTuwYvb9QEBfNJbK0456uxPsVEs0/WhL0ldQ6CPXKEWOo14aIRqtN
         WU2A==
X-Forwarded-Encrypted: i=1; AJvYcCWGgz9FhVzw5LAg01Kl6d2idFxqyFNuGWrhM+UVVE+rB5YRmBHV8VtHzBEDr7UOOKJkZAtGI+KVTKTx4FByVQcOAXePyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUxdlNrHsU5Vx8eGuFxQjBcK/nkAl5T9okMMGEDmdeTktasnw5
	RTKZ94tvdoigPl65sZiNjmuJxEgcXNhYZZL0WKxm6iv7bRBtLFKfBHwvBgU35v3nXEiMgQQYdFl
	VIvBYQAzGg0LigbmKc8PBJaeOhtc=
X-Gm-Gg: ASbGncsMSD8ZBynh8ctdiZ6Wg0MunZhah08VqjJflm0ZN11acaE18rWksdNuuzr4tGa
	mUSh88LeJheGKsq3NKWlC339yKxSe3/5PW6Xgj5MrteNn3mNNpPo0VE/Sh9EpzHyMTc6Qhok=
X-Google-Smtp-Source: AGHT+IFCE/ujiPdHP+4NuCAT8iQjlOyrijo3LcUM+5WICOd0f0Wy1TP+CpF11sc0YvuV5vk3xilB1nbZdK6s7ywGhF8=
X-Received: by 2002:a05:6808:1447:b0:3f3:bd43:8870 with SMTP id
 5614622812f47-3f3eb127cb3mr2685351b6e.28.1739638853708; Sat, 15 Feb 2025
 09:00:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sat, 15 Feb 2025 22:30:42 +0530
X-Gm-Features: AWEUYZnjUakxvfVroE4-xJQ6oTeQ2JVIPhF7OnNS0SB8lYYBB3LZ2DiPulj_kzw
Message-ID: <CAO9wTFhe4sf1eVVgijt2cdLPPsUHBj7B=HN-380_JSpve5KbvQ@mail.gmail.com>
Subject: [PATCH] Documentation/mm: Fix spelling mistake
To: akpm@linux-foundation.org, skhan@linuxfoundation.org
Cc: Suchit K <suchitkarunakaran@gmail.com>, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

The word watermark was misspelled as "watemark" in the balance.rst
file. This commit corrects the spelling error.
Signed-off-by: Suchit <suchitkarunakaran@gmail.com>
---
 Documentation/mm/balance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/balance.rst b/Documentation/mm/balance.rst
index abaa78561..c4962c89a 100644
--- a/Documentation/mm/balance.rst
+++ b/Documentation/mm/balance.rst
@@ -81,7 +81,7 @@ Page stealing from process memory and shm is done if
stealing the page would
 alleviate memory pressure on any zone in the page's node that has fallen below
 its watermark.

-watemark[WMARK_MIN/WMARK_LOW/WMARK_HIGH]/low_on_memory/zone_wake_kswapd: These
+watermark[WMARK_MIN/WMARK_LOW/WMARK_HIGH]/low_on_memory/zone_wake_kswapd: These
 are per-zone fields, used to determine when a zone needs to be balanced. When
 the number of pages falls below watermark[WMARK_MIN], the hysteric field
 low_on_memory gets set. This stays set till the number of free pages becomes
-- 
2.48.1
