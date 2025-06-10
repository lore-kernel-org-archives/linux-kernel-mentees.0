Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C192441A0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576837; cv=none; b=sRv+iv/gD8KkGU2MXTk16jjvw7gJyxGCVRjdCe4dkL7enZ4irwNd92ASmg8s1PEzzZHhZB1gM4q2DIxYBiXGK+leGguAPKXRu7inEgMh/cVCFkU9U7tfr0Kj+SuvSVNaFXQ1PNzRCPK5hIx9vcLFVt05rapO8HsPaF2NXg2yl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576837; c=relaxed/simple;
	bh=0CPTphKhrUBOZPlZ9pKlo5NWj8DVPWh9CCrT/9TEVXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tpFBDg1xBwifnYPBgfZkF00yCx1m44mHLyvjxbzNbu/rZjlIYD0QYjpmKUItgh/TJQGJJ1RKEBLkfH4CPVzqHXCKIyC0DtwpGxofu6vY2DJPOpFp3Ab/wR+lZfGXBDOb22B2dom5vbiXjr2zQCu1wxJaxcxLBtDJIxlfzby2XMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BI/QmqsU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BI/QmqsU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234b9dfb842so51575475ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749576835; x=1750181635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ4a1Zth++0ZqMvctA3wgDOhGEIMr6HHOHD5mEZCyYA=;
        b=BI/QmqsUlM8Qpe8WeJRx60pUIjXxh176+a8FO9pZCJWpOrcmGhawTvP/LY7mZMMhqm
         115f3mnsWzLCKPda/oqpdOXiNhB/RF8pald6A8eu6tmiw16rFVqH7WAUF1yU31wiBStV
         54JfO5K3xRsXGhSgRN9NQtA1arNlY5YkYU5SDG3DF2afIKPP2tJ0ugrM3m1u44ADZpka
         og1vfBmmGIKQXcHgjehjudbWKfwEWfOjZGEgTs/CYm4egyAZfF8aMPe0nwGNOWl6+pQ5
         NHa/+vLw9WfqmJWPJvGuBoJnue5AH9qYmdtaErTafNtZJK/gtzAsvks2aAyTPgNc7EP/
         lW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576835; x=1750181635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJ4a1Zth++0ZqMvctA3wgDOhGEIMr6HHOHD5mEZCyYA=;
        b=APX2DcBftJOt0qIIxcTrxfIvknFX3jFthw+WvlRXksk60YQY43XHYlsOdw4Q/m5uaw
         GUFedleALpL93GKGIZqANLuWvCVvwgJ2dQ69YX725sS5ND7L3ghCWkKuhI0PqQivkkfn
         WDAMMAe1YenYf/dJPTwSvctfBmjN8oAtCvSThGrHwgyOXmSZSDWJvd8gaWVCBRPRpcj3
         0RwhlmdlWn8ZSG+LDkhDKgNp493jYE53+TyDNSqsRTKkPfQt0NPPHb7tMYg6dxmaSxVW
         VOqWdd2gKkQqBw2CZeXpQVIdh7YYkGZOuqu7eUjNEG1AOqrF8S+4m9IdYUt+7XK/ULRs
         EuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6KU8OSlTkrjigMh40YM3EE1EHIcg17k6c+b4DHhfs5IHbFO5xOfzZViF3A94Yc9IlgzBV7nWxDTSYskqUgfn22X+Etg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzD2HyszRn0wbWyri465HQKq1qmUWSMfELOTQ9g122YgH42F3ZV
	4NBh124cpB4tiwqvHtk4/HTR6n8toBJlRbgLuDqTtI++7gCGVAew4yCh
X-Gm-Gg: ASbGncscmXwFts+igCD/MWkzIK0dfrOqmfFVYUXK4mdm3Fct5JuPY5UOnJMbz9YqvJ9
	XUCvEz1kOOKGEjREtM+2J+KxjbrsNDhCBBfNVj97LFA10O8dnNmSQG1+myDRrJKwlMgZ/TcsSXR
	0FCX3/aE8/BjQnzGLstIdgPvTJqJzfzxzMbsCWywiCdONY1M9nOcgC2Ne5zAQ4eW8IKOogj5Ou9
	900be1oVoLeA4M9Lcv0O/cOzc+8zHoVXCUgTKQAQsEBm8Zm4/VINjpTx989EiQtivvvjf4jMX7e
	WSvhQdzK/Zeyzg07HNBkbnABQ3feKRud9xPbAGY729/PQlAsmmyEcy6Zc7c=
X-Google-Smtp-Source: AGHT+IFZJTHsdk/TxpbHmEjLgwmerwlZHiNEHv4q9luAbNVAuVqA2jk6ZzkIZbMPI5Jw47KA/seAtA==
X-Received: by 2002:a17:902:d585:b0:235:1ff0:369f with SMTP id d9443c01a7336-23641a8acddmr2433695ad.5.1749576835279;
        Tue, 10 Jun 2025 10:33:55 -0700 (PDT)
Received: from localhost ([159.117.73.36])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603077f95sm73627005ad.13.2025.06.10.10.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 10:33:54 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nai-Chen Cheng <bleach1827@gmail.com>
Subject: [PATCH] Documentation: fix typo in CXL driver documentation
Date: Wed, 11 Jun 2025 01:31:52 +0800
Message-ID: <20250610173152.33566-1-bleach1827@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo 'enumates' to 'enumerate' in CXL driver operation
documentation to improve readability.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 Documentation/driver-api/cxl/linux/cxl-driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/cxl/linux/cxl-driver.rst b/Documentation/driver-api/cxl/linux/cxl-driver.rst
index 9759e90c3cf1..dd6dd17dc536 100644
--- a/Documentation/driver-api/cxl/linux/cxl-driver.rst
+++ b/Documentation/driver-api/cxl/linux/cxl-driver.rst
@@ -20,7 +20,7 @@ The CXL driver is split into a number of drivers.
 * cxl_port  - initializes root and provides port enumeration interface.
 * cxl_acpi  - initializes root decoders and interacts with ACPI data.
 * cxl_p/mem - initializes memory devices
-* cxl_pci   - uses cxl_port to enumates the actual fabric hierarchy.
+* cxl_pci   - uses cxl_port to enumerate the actual fabric hierarchy.
 
 Driver Devices
 ==============
-- 
2.43.0

