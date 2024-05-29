Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9C11185
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988931; cv=none; b=LcWKpm0C69TuR4W+H/2sInM4V+Z16L5Sw6DKIOdSr+f9TTjm/CLH8BZ2w8JaJ+m8n7haw0Dzfiycq9t+P/OGHKV6fjNT0mauDFw5AA7wDLBQYNRYm/8dNEEtHSuUk1rz0bZD3pVATJ2cIf9zn/Ng+F+F+gSbMoBpxzg3xrlKmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988931; c=relaxed/simple;
	bh=LmG0Zbh1S2hp91Sn/hvYhhZTKcmSBk443WWO2UHQ6UA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NI3TWkma3Dnd7DEiFCXoSPO/DNKhPbHVZU2r9SwhTgbsRsiuhPtoS0WEjPLGkyMnpw+mo9EwJjn3e6O3/UkteCUBcHVsGN28Ny7RPyxRvHxFdfG1SVP/l5Y2OH1IqMaOJyTxKAIzKb/rHdvG7u9LJgoWv6YYhnuiYzEUKZeG818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVP8YNB7; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVP8YNB7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23EB4057C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgoJi0_jlSsy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 May 2024 13:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F726401DD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F726401DD
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NVP8YNB7
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6F726401DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:22:08 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f44b42e9a6so16687615ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988928; x=1717593728; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kur8IddoyK7auUB0DpsJfjxMjtBncw932qUbr08xEk=;
        b=NVP8YNB7Btbg23CI5e/TvffFbGYuEXkweit6sdQXqysyliBHe72evSLJWiNAzktmov
         EITOU3JX/qYO/7IzcR+IHiI6GI3RIRO4XHiYKP3bBNf/aj3GUGAul57aWN2DiKaXSeWw
         IhoJF66XTGFmuYgGiMEoyn4caKapRNfR4OTV+85/kSXisN9+pxvZpi73likkebHTAbL5
         YJ5ElltU3UsxlPwbAay3cr8SE/P7maLnXbRveBqZabiH+U9SooCi7NRW0B2SxjRN3Kwt
         2bl+7g0gpz4QAcQGJChKWa3qx9LLjpIw+8Jnwz0f3dhVkws/bcSIS1hmkgV2yHR9zL9w
         bXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988928; x=1717593728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Kur8IddoyK7auUB0DpsJfjxMjtBncw932qUbr08xEk=;
        b=eE+iotj6bFX34O7Jf51Kwlb/xMAHCjgcsLmWPrvcNqXTYvab2/frSGT9aCH5znjhch
         hpDfUpm9WtUJpjGtw6vywqxw5uWs3AnuD6fO4OxkTYfNjE5kN1pUS5VcRcM71grsEbpp
         Dl9bhOSySjdtBK2v2fl8m16bdzrskC8DZJXYEsmln00Pve9IvtAG5+JIr7cZYidEbniz
         Cqao6kg2CyxZL999PzRiv2ZLYa2PLTWRu4Zic72Cep+NDRwLOLUygHh3dVEswS3z3KMZ
         1+LkzYHTJnxH/T6TsoFeD2csqzmZ+TE/fHM4WeKDFl+M24WKv31rYDN+ovdP82dHd8m/
         Hj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0tZWWw7SphOaOiWCIC0KjCLe3EdM5TUgLojUbET5a0psgY92Jvg3qgwfLJTSy6gqP2OJQNlikfU0LAAZqbc9SHrhy1eExC09srAWO+IIIJ3n6fPbawXjFkoG54jAF
X-Gm-Message-State: AOJu0YxmGrTtamMprF9q9wfccbwOQP4s+mZytUwWnzQUewU3f3YZxedd
	Ivf7xbUDmq7TWhja97JjanX96ZqdSCpGh72n2kaw85IEZRAXJqkz
X-Google-Smtp-Source: AGHT+IEsBv5bIxgTY/q47JQPTYogoxqv6LI2GlfX+nm0L8UY7lG45NwaKZRAtWholBUpgq2B4dfkIg==
X-Received: by 2002:a17:902:e84f:b0:1f4:990c:5ef1 with SMTP id d9443c01a7336-1f4990c5fecmr96953905ad.31.1716988927615;
        Wed, 29 May 2024 06:22:07 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c760a21sm99183205ad.4.2024.05.29.06.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:22:07 -0700 (PDT)
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
Subject: [PATCH] xen/xenbus: handle pointer to NULL in alloc/free_pdev
Date: Wed, 29 May 2024 22:19:28 +0900
Message-Id: <20240529131926.29590-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

Modify 'alloc_pdev()' to set 'pdev->xdev' to NULL
if 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
not point to 'xdev' when 'pdev' is freed.
And modify 'free_pdev()' to set 'pdev' to NULL.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 drivers/xen/xen-pciback/xenbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index b11e401f1b1e..f1709b8e284a 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
 	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
 
 	if (xen_pcibk_init_devices(pdev)) {
+		pdev->xdev = NULL;
 		kfree(pdev);
 		pdev = NULL;
 	}
@@ -102,6 +103,7 @@ static void free_pdev(struct xen_pcibk_device *pdev)
 	pdev->xdev = NULL;
 
 	kfree(pdev);
+	pdev = NULL;
 }
 
 static int xen_pcibk_do_attach(struct xen_pcibk_device *pdev, int gnt_ref,
-- 
2.34.1

