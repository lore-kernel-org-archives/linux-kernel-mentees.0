Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF724221F26
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 19 Jun 2025 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334906; cv=none; b=C+P9hzG122Rl4PwdxnwXPIBlrlTkPNb0BV/fqZL2YK2NndoICbQE4bfzay6BNsBkb4Vw3hK/ddDYRv+AilCQhp5vaZfrMUWXFoQ9mh/EGfz2l33UwdPfMvcirPMApieBc1SUs9v4V+VzWwk649zFP7nTN2SCcObcGywGtGsIrb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334906; c=relaxed/simple;
	bh=5F3P1kfhpvJxNCeVfDn/5ybrVPWmzKVNAGZPkMTYSKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLvLhLkzw2L271Z6czm3lNaw6T7NTh0h3Fp797nfmSe1NPFXX7Sk2GHsFEUZ/mpEjL/Ac0dV6oN4j41aOKyH6E0RlcdNAeHKeOn/l5P6HEMMxchmnWhK2zGPKljEkTmhU1FsJ6ipFgsHs8F2DLlIfMjVshucyQyHKpAkbd27Lik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=vqjeUEoz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="vqjeUEoz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cfb79177so3929665e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 19 Jun 2025 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750334900; x=1750939700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAxRLAejUsHjypjjnrTVOYXan4TT7QUHhYtr7a8fqYw=;
        b=vqjeUEozF6nHutPhuA5so2JqnC+eM5hkBZkbNDZZqEXhbGxx2xaKZ5QdV9gyDho6qB
         IrHrlMrM7GTW+uVHN5iFhihHRO3i6JI8uEVRpiEoQd2Ojo6CjeyG/nTu4H3kHJRcwTfA
         0sQYiZFMLEwzOF2KXj9YTY0/MeMNDIi/6v433gowabLu85LscUwE/72NcAnxyFWpgMLx
         Kt8kvpOj2q66qns5DrrXOaOMh8sL02ITLWR4htAw2W68vGLHcGuUw1DNJ6QAXB39Dtre
         P4a7atlWI9unm6ndKdSE4/7zILSFW1km2otMYbk3PuDBRj6AU+PHX/XmJoxnYF28f1Vv
         30uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334900; x=1750939700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAxRLAejUsHjypjjnrTVOYXan4TT7QUHhYtr7a8fqYw=;
        b=ec3S7HALr+bfieNyG4YXDSp4ox7GgUkQGjGT7Y2fqCWmVK5bM1zKKXdPWYD50WoG4I
         qLX+zOz+OZzIUeMOxXtxNn4NlHkLPRZv07NM7ZEos4miS7+16lzmpRuY44ss6/P1zww0
         8Ym8ndowzppYzkxcUZyotdTWjGzM5/bTk+ti44l1e/xOWr9OOihkHCjv3GQWg8357KoN
         SwmIEbIhWPBOuB3apDqFASlMucoXXYk0pL0sbdNP/IVIWuWRudH/Pn9H7CjR4xYny04h
         k5NBjM9WIyN26I2F0wWYHKcZSt6Xre+VVv/DtFTRqPqp6iGwhDS/ZOFMlP4aJU1ng0y3
         sjpA==
X-Forwarded-Encrypted: i=1; AJvYcCW1pyK5utFp/U489/KwUxw4fpHRH+9uPF7AdmApPpxIlh7EZMWVoi1rC37rLavQ0yno6sfH9FgfrlLQ3f3zuxDJxeYsgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjM9BlvX+rxczUWG3lndPvceo1NNjVnXgioTNNH9sF1L0GVqID
	ASba3Af5XBdXznjk4qgCpxrhQ0xNFIlA32lY1HB10XvFFqBppiSjiXVnS/oqCh/aEzY=
X-Gm-Gg: ASbGnculLFk60ST+f5wATbKDIqyOXSYcx+jKtXDIpMiDHENzzeqHMnZhkgVk7/N1QXd
	PURogXDYM2yKR05BddgGrICNjPRlM1Z5/iJm2q+crDQFIyJvtDFGSm/4A8Kgo8sMt3rdBnqERoq
	mqkEon3SfSs9R30txhdXtd6Vz5BJ6P+2DBDdbE88eg/7hcyIz0JXjVz7CGJrh2YFKIGnDU44Jio
	1DG29B1bKDvC2phnhAv+wNrSfctDFd2fZBxkznw4Icf7vyNvWZZ16Gz/WRm6Z2vcVf8d3lmixrO
	YmEX6iM4vyMeX7FL7cdSbsmCl/x7Nbp9Wst9t2Jok1AdR4vtji8VfOqvjrg3l4JHpFoenq7oHWh
	llb3JGOJjGrIQ
X-Google-Smtp-Source: AGHT+IGHvY1nrgiqXrIeN83GM536uQ7g5PaEHQSZe6jlMyRnlGAW4XCRb7LuhCIszof1RGsKeAWgUA==
X-Received: by 2002:a05:600c:4f53:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-4535d8ddc69mr47412025e9.30.1750334899741;
        Thu, 19 Jun 2025 05:08:19 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:546c:6067:d6b:b4e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm19738748f8f.33.2025.06.19.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:08:19 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
Date: Thu, 19 Jun 2025 14:07:11 +0200
Message-ID: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, show() methods should only
use sysfs_emit() or sysfs_emit_at() when formatting values to be
returned to userspace.

Convert the uses of scnprintf() in sysfs show() methods to
sysfs_emit() and sysfs_emit_at() for better safety and consistency.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/usb/host/ehci-sysfs.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 8f75cb7b197c..3786e81b0ed9 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
 			      char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			nports, index, n;
-	int			count = PAGE_SIZE;
-	char			*ptr = buf;
+	int			nports, index;
+	int			len = 0;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
 	nports = HCS_N_PORTS(ehci->hcs_params);
 
 	for (index = 0; index < nports; ++index) {
 		if (test_bit(index, &ehci->companion_ports)) {
-			n = scnprintf(ptr, count, "%d\n", index + 1);
-			ptr += n;
-			count -= n;
+			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
 		}
 	}
-	return ptr - buf;
+	return len;
 }
 
 /*
@@ -70,11 +67,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
 					char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			n;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
-	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
-	return n;
+	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
 }
 
 
-- 
2.43.0

