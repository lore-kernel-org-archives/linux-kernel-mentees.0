Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE90180A81
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985414; cv=none; b=ZxZ0bO7BFFWCTqFpfHjVk1FFjO1XcAIFPQ+m6bzZPHJR0asppQMtDLd99hPDnDnUZ8Awktb2CnnR5u/S7AkEPJh0YJWiMWc/d/ImnWRVUNiuOPFUKo062D513R5hTZWHhKH7ES8MWbMsVJzpy07/pMfaUMiGGJcKsBGjNxDwYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985414; c=relaxed/simple;
	bh=SFsdFGM1tKYQjt5FyT4kYb2Qr9hSQyKl3hmka6u3AM4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mFB649uH8v4YK7gxyJwS+T1IudsznGNoojvYdShLq9LlPpi9/u86nyCbb5d7cs7SS91wFOs2/vOGzqoVxH7gM12ZLtBUjcqeQYU1HqsvObxHkNZhzL4Ypcle0c79xDobDpYAWxYJqN63cBgS1NVNK7VHWdGNMK3GusrUyGWeKqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSNiU8eB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSNiU8eB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E906A60642
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 12:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tILJN3P5SQM0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 May 2024 12:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DA19605BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA19605BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nSNiU8eB
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3DA19605BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 12:23:31 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2bd816ecaf5so1494342a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716985411; x=1717590211; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu8X2LCUalqzu3Ya3NkSgnwgrwDIZEosx1eIzHQjc28=;
        b=nSNiU8eBAcVFNXmV7NThR8GO2YDRjl1wObvCdLlY/meWib2MOLx76vKdQpmQ1i1V/A
         Tw63CuS4t1F/cYEuVR6Eth6kDyGB5n408hPiXxBODgN0jf2bDpW/td20MFu/e3Vfq41L
         2jClY+4UQqIU7HO9KWyuOky2a1KzPl6b5/bW6BIHa1kPKZvVZqibp0MY5db4bobFGRHX
         6mHIPZyxKhT888PSSbSk4N/ueZfDHXwFKrnBWjdcflo6veD4BzZVT85T7SMt1GMyqQFE
         diW43s/kMIo5MnSRRkDJaq73bJn3y9e8ilu3RIxHVAgmbJS8/1XzwyQFfSEAGwMPXh2+
         clig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985411; x=1717590211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bu8X2LCUalqzu3Ya3NkSgnwgrwDIZEosx1eIzHQjc28=;
        b=dbMD8f4TDUYon2KcI/TbIEzlKZVwu5JH/fdZhzrWi7ojfuWYY9J0Sv76F29Q8UDN2o
         ynH9//9M8b5gq4z7LlyqQRUVinlabdqFi8ks6UHQAA1cIgTLuvULT1augpRLS5MX9uyM
         XMdLq59WSWLp0lfqBOPmtrQlNZuGXKpnyEi1oX52uvhxk6Qk4nxa0Jo6Z6Pr/yXS9w+B
         n1TVfdHVidQh6Rnlsq82u4XBEXFY6OygutmVkH3uIaMoNagxVc+wLF9vGIZVb07DC/5k
         sLAoy2P0/fxqrR16cMm+ABvnzxrkrYni2GJrx7AI2+fyhdwrtO9RTWbNW5YwGadL+w2j
         f9xg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4AmGxLdbMqIONoXgIlykYaAUyn1DuOHs8bkmVxl32/8s+shl52k/9Zdl8yUpknk+kKhpfPUSsZfcxOUvRlx1O2oOJItDmLdhBJFgFWDla+Op0nyOCHCTCLldU1qs
X-Gm-Message-State: AOJu0YxVKjrLfFZVHaLuF7QnaI34i0Z7Rm9GO/7W/Pp8hAoezT9zQjOJ
	fKPAvsfiMi7QQJJzyI21ofLQrmFdt9yjdmnFf6QCJf7SS6TdBCz3
X-Google-Smtp-Source: AGHT+IGpop5Rh0Gl6NPGn+yzSeNeXcyhhaZwMs48bAu4Ha451DIdYSt4ISyatz1BTqz9iqNA8XPlsg==
X-Received: by 2002:a17:90b:46d3:b0:2ae:7f27:82cd with SMTP id 98e67ed59e1d1-2bf5e171f8amr12877376a91.7.1716985411004;
        Wed, 29 May 2024 05:23:31 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f987248sm9399359a91.44.2024.05.29.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 05:23:30 -0700 (PDT)
From: yskelg@gmail.com
To: Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org,
	sj@kernel.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] xen/xenbus: handle potential dangling pointer issue in xen_pcibk_xenbus_probe
Date: Wed, 29 May 2024 21:22:33 +0900
Message-Id: <20240529122232.25360-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

If 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
not point to 'xdev' when 'pdev' is freed.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 drivers/xen/xen-pciback/xenbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index b11e401f1b1e..348d6803b8c0 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
 	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
 
 	if (xen_pcibk_init_devices(pdev)) {
+		pdev->xdev = NULL;
 		kfree(pdev);
 		pdev = NULL;
 	}
-- 
2.34.1

