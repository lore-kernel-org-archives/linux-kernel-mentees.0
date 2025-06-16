Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189222882D1
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070494; cv=none; b=d94mB4/GN5f1x0Zu8XQDDxPfi2U5Y89qNPskk+ydVbzAq0GmZ/gIH9coxKNAMwxmLCr4iSSPEc0sYte7yZXgg5c1SKYs5OBUPpd+CLJ3CmdMROsM0iv+IbpzOT4FV9i5Xvtlw383bIynlHhlwRdm1EW7C9FFiiQH2JK3zni2hnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070494; c=relaxed/simple;
	bh=V2vEf1txavranr9WehRAx38ioCKVOHTKJXZmVUR0ohs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+ooKQohl4mxKCk/nd2XKJ4CdQXBFte5DOXYV4DRbqOVqw55JLhadwx9ftJOoI0wM26/Z2sjKRHZUdpb/g87JHMT6l1ruJee3mIgd/5AYniJqQEtjXGp4tWSXJb7uYAw1n0UvWwerHF7UXYVdMuSLS0+orUQ3ssK8mg7t6Tu7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIJSWus5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIJSWus5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3566689b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070492; x=1750675292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7htFOZxdAd0AZk3HoT2TGIMCVLzxW3F5ddbQjitwc+o=;
        b=fIJSWus5tgMUC6BkwsURMFwlgq7NLUd8t3aLjUENZqWpQhrJHM9oDpZOLZ01obPr6r
         fCIIHPc8YT/CL/mXO+WpjZauqLVaniMB/VurNMH1KuXC2iCqUZKxM0fpJng/zTIfsqIX
         2hw2z+4Ylks0gABSXNYiICEaVavxy7NU9IyJ2P0bLGNrAzo9G2gv93kjhjLPElBUQdu1
         9R2JLY0999OzAdcVnYBzCALNSYkQ7GryxJ/oahEvIo6QW3QgnmBJQiL46DyhGXuaBdoU
         wyjypYKuygO9Er5CnvK2u0d9F3yeCn9Dsn80HzbY99rod3LDrtOAZRZYr7lcQvJhqdpn
         L8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070492; x=1750675292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7htFOZxdAd0AZk3HoT2TGIMCVLzxW3F5ddbQjitwc+o=;
        b=q2i8s/HSTxoauYqPIUk6/8UW/nkJG19l66L08Ykb7BVgK9khKiQ+1yYQUjlafXOIG7
         eHCJeVInFSFKeBslE3FgEY7n01R8WxEYsiDCAawcOvq4YwTccLAAu64QirZSD2DDRMg0
         SRyaJhc6byrFvcdlM+J4SqSBvWNHkKvDim3gEaEM6fsAmWyJAfiP+8w8MQlZX6wilnlW
         USzEleEWQMuOFD1LCX2gO8I5xHgmOecnPpxT9rW9BKx1bS3PWsLCHvjc0DpRURW/iKnQ
         +TBsqV2i92DG8rRjAgHbIwSAlEZgqMTeOS2qsrEbtYuHRN4nC1SQkNTYomxPmAjwdWEM
         rMDg==
X-Forwarded-Encrypted: i=1; AJvYcCVNCmICiN4axyS7dt/vxOyfL2S6H1aNdpIHDb6mh0jgcOylxLP0zMfY1zf80I5FXhiPIYgPOxq9nrf8zvsebsqu014yzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvsDSwFjByHH62wXDP0ab69EQof4zZcPMaDyxkFcfjoNSezGIw
	KqHn9uf3ti4Zj3/Lm/J15I40/CDmmP67ouvdhefmzADqRN5Av5Dg/uMA
X-Gm-Gg: ASbGncumblz4r5eJWRRN3g+wm9CLfWmm65FRY4oduORoCjX1cJHXk5CtEvmYoKh9BL/
	+pLlJpwkRCbm12pGbwk6RrhrKwMgJlSNajx5fGNWYo6bA9PiKJst4pW+P6xahF39uciwbjbreFz
	tZyr+741KqJVrLI3jLEcvO+3cq9zxQiBfhyCTgi/dZcZsKLgjKcg+gmTjHNfYIk4wJtye50I3HA
	QYWzEazg5nYRyBdovY7o/RoqPfDVGSWNb9vB0hhTcbNYWuU+ZKk7gxjvtcdBTsDq8Z+DJ7kHHpt
	9paDziQ8IsdCi1oVLbVDyMOttSd4D41H2ITrc1eazuxP7S+w2z3w3zOTjvg2mOq9H0qgPjimoee
	PdhmtdIs=
X-Google-Smtp-Source: AGHT+IHJOJ6onIIMZqicZrrWs0JqkgSdx0gliCNfsg73RZ0DBjdADGctqIxGkjQ/9vTtLs74zMRE3w==
X-Received: by 2002:a05:6a00:1994:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-7489d050f48mr14158247b3a.24.1750070492184;
        Mon, 16 Jun 2025 03:41:32 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083ba7sm6669992b3a.102.2025.06.16.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:41:31 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: code@tyhicks.com
Cc: brauner@kernel.org,
	sandeen@redhat.com,
	colin.i.king@gmail.com,
	skhan@linuxfoundation.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] fs/ecryptfs: use scnprintf() in version show
Date: Mon, 16 Jun 2025 16:11:20 +0530
Message-ID: <20250616104120.370832-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all snprintf() instances with scnprintf(). snprintf() returns
the number of bytes that would have been written had there been enough
space. For sysfs attributes, snprintf() should not be used for the
show() method. Instead use scnprintf() which returns the number of
bytes actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/ecryptfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 8dd1d7189c3b..2a97c2b1fc69 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -764,7 +764,7 @@ static struct kobject *ecryptfs_kobj;
 static ssize_t version_show(struct kobject *kobj,
 			    struct kobj_attribute *attr, char *buff)
 {
-	return snprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
+	return scnprintf(buff, PAGE_SIZE, "%d\n", ECRYPTFS_VERSIONING_MASK);
 }
 
 static struct kobj_attribute version_attr = __ATTR_RO(version);
-- 
2.49.0

