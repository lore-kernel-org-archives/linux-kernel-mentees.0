Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6974A08
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722054855; cv=none; b=NXmSZhYhcN91gxrKOI6CVVHwltc44rVmrD9oMp7hxk5PBayGCsgp2icR9e4aKyx4fe3fP/n69yCEq4ePeVfhVvVUfJnqwsYprYw8joHseW1hK3e4Pvhn/SXZuXdWkhYztDwpmkp7Dq4qHkF7zbTf+uyWprJQDaVErfK810QUVj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722054855; c=relaxed/simple;
	bh=SATEbQ7zbN+owssdLCL84MbZRt/64rdIvkxlhHBqI/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lA8T94cT5uewl13IQMnoeYMs9mnccSxF2ZmtFzoSVwWHXjmq7KWEmzN9RN9HepvlDqmAoSO+x8cb0GVbkMkslH8epOAjZq34k0L/lkVp/RxJ5TPgK0XxerEE+JGXhoyCha+zSv52Qq3lh2E+cOEJ4usvuovloS5A4OI1FVG9jN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPyQD2yS; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPyQD2yS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 892AF4017A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBtNIwjAkL_6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 04:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC1894010F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC1894010F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TPyQD2yS
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC1894010F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:34:12 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso9418005ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jul 2024 21:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722054852; x=1722659652; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8C36rWzZ5CEFyfLmLBvUIfIdLBTOkwvSaRR1h8GCuTw=;
        b=TPyQD2ySQCbkCM/fcyucA3Q46c5vMiGeNt9n62zpRFWZfsjcOspcL0y7Feyud4w39S
         Gr3S/chGTQf54RMLvqTAJVUFZ/IYlSSSwnP2uf8Fs5l6pazEmH8gd5v6Q9C+HqBEmNFR
         NFxEF1Oif+Wak2gBbDvxOax7vFD0tGMMJ7vY2DsgZJYW0LSkquDHHDXBNa6ra51phf62
         DanJYfhPG9Vkz6m11IfNt7E5lATAzlZmBQcRXZARIUb/pG6qZl7wRM4//3lK/mnVUXwR
         dHsUOpSZZghK581MJo/TA0epR0PCOW85ZqosawfUCuXbplajTlUXWuWLMr2u+td/Tdbk
         YgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722054852; x=1722659652;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C36rWzZ5CEFyfLmLBvUIfIdLBTOkwvSaRR1h8GCuTw=;
        b=VbiI2lgmzijjgd0eWK1BeWUzwoPIqSIFdxI8zZIar3C2DG44Sf1EIHSDcC3ouqWjgS
         6rgWFykXLGS21PPNchSQKPIcizMKkFiuzQQEgQHjgu0U2Hgdvb6gdvXkxbJ+m+x6VUJ6
         vU2d0+1ICk7aL+nya48he1xem72mSAmnXxePCOmoevG26iRVHzCCBky/Ez25/yfrNh9+
         NpphE2L5ah8sE2nee8/6Ucj+HG4obSBes4irPG+ccWWoFy24rTglDxVMWFRjyzRUFV+f
         AmqlSMyAX+VwRV3W2CW8db6bIavw9piM9xfiKcnl1pbFPeoBDyPDrhLnzBZ2s/81oFrM
         ZBXw==
X-Gm-Message-State: AOJu0YyhEpkCw7ZV2nXtZ7jaY5JEjhplYD76Evpsyb6RlJT0BM/ONCEI
	JT/fK4zD3zYJVMf2cvAZz4W8heQKsLDWrZw8iUeKNcppaXGjgFeT
X-Google-Smtp-Source: AGHT+IHZliN66Mjdy/pPmJDl6iBYogsAzKgh2eDWlcCzfyvTOmaGlkru1RZ2BhX6odh/AcNrPcjoJg==
X-Received: by 2002:a17:902:fc4c:b0:1ff:5b5:d546 with SMTP id d9443c01a7336-1ff05b5d9d5mr12968085ad.65.1722054851702;
        Fri, 26 Jul 2024 21:34:11 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f78491sm41544485ad.244.2024.07.26.21.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 21:34:11 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH] Docs: Update LSM/apparmor.rst
Date: Sat, 27 Jul 2024 10:03:17 +0530
Message-Id: <20240727043315.36554-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
AuthorDate: Fri Jul 26 23:43:49 2024 +0530
Commit:     Siddharth Menon <simeddon@gmail.com>
CommitDate: Sat Jul 27 09:48:30 2024 +0530
Content-Transfer-Encoding: 8bit

    Docs: Update LSM/apparmor.rst
    
    Update AppArmor documentation after deprication of CONFIG_DEFAULT_SECURITY to enable and configuring AppArmor.
    
    Signed-off-by: Siddharth Menon <simeddon@gmail.com>

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 Documentation/admin-guide/LSM/apparmor.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
index 6cf81bbd7ce8..f324d750468a 100644
--- a/Documentation/admin-guide/LSM/apparmor.rst
+++ b/Documentation/admin-guide/LSM/apparmor.rst
@@ -18,8 +18,10 @@ set ``CONFIG_SECURITY_APPARMOR=y``
 
 If AppArmor should be selected as the default security module then set::
 
-   CONFIG_DEFAULT_SECURITY="apparmor"
-   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
+   CONFIG_DEFAULT_SECURITY_APPARMOR=y
+
+Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is no longer used. 
+Instead, the `CONFIG_LSM` parameter manages the order and selection of LSMs.
 
 Build the kernel
 
-- 
2.39.2

