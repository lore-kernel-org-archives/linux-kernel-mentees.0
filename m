Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8531DE89B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Oct 2024 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176708; cv=none; b=MzyVO346DWuKudnpCBYk/1sbNqfOgyfFRRnjtdo6ROc7+SPx3U+4HzsD2eCe/7NR4c57INMWUDh8cGCN8f64oc3THiqwC6yAz0n3CZrTSh0S2e6CEe8AGFS7IChH/q7Z2mrgsngjWCPeTsxWfcf0qzdHpXzRIggke0lJdoSgABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176708; c=relaxed/simple;
	bh=EuhtQH5bex7/i0COwlqxw03mixVVhAkIYmn265ypFEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDcHeEllW1IZkx94DkPb1Tp0hYGqYIUnWDQGFAfjiYQb5BV6Z/RZSGKM5aPXSTPME8GbN4DXBdRHaXZLRcBuNRVOX+sm38c77ai9+JRSnLEZYLYmimkaDJUF/TtTau+F28ZfH4tWuCKQhk54jHhAZ4LWJcSyt5uCOIXmIGFUEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+Ey5ZXd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+Ey5ZXd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F01160A4A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Oct 2024 14:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rj6GQT79b5ya for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Oct 2024 14:51:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 743AE60A49
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743AE60A49
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+Ey5ZXd
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 743AE60A49
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Oct 2024 14:51:46 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so834395a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Oct 2024 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729176705; x=1729781505; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGAXgC7FfrdTSppqbnulVF8CdRAJ5Pma8ywisvco0CA=;
        b=m+Ey5ZXdGbrQAMthZN3vJH2xaw6S4y4vLFi4LuJQhHWzg57n/KGNGTAB2TB6YvIRic
         7kGzMmyeTkFU1puZsqDA5KHH102QU4LX9gKFWF+H1B12SKRTw5ATc5WA/Hmx4rsmi0Xb
         IYX8I6A1QXww0qFGRzwMPSTXamLY15BtN6FzzP2fyy1BT3p5Ve4B9LjhpqHG4XSGuQJv
         uGXwNhyuYZYlsmrIfBUzRFrGzoAqIMHhnPdTedvbbr6GXQ4HJj7jdvI46BXUdOX9KEdH
         D/vev3zHG2Wgh0AJxJpInuvJL9pt6TcSbxfRFRXvx9e2beKFjuA3TV9AqaEjQSiMcal1
         2wMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176705; x=1729781505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGAXgC7FfrdTSppqbnulVF8CdRAJ5Pma8ywisvco0CA=;
        b=i4bqVgXnVQ5lj3R4YfayVdgGYkfF+gRQ/TPf45PGqM3Ztmlq1MKqtn73H26tFplrGH
         2+zoF+MuMtKFCix1OX1Gjb7O5ONNmeLe+5qMSbWhydzdboBx3lzy81C3+ABv4kKLXA7S
         UjLiUEAkucmmXB1Yzczr5k+s5iLy6dp1pL0vPoojLovfX+Puwf5QJ6/mKzZLGQUZbhu7
         AhAyKWDzMIdRwdPA31dDWOKhUyxNSK0wr0Y0FNszTG2ALDH9FeyCb5t3wSFHM4FUcaTC
         Eh9p72dwehtscMGSxXYV8Gv+JCIEVVryObk5C55MKQezV2GDarANGH2fKPFPOsE26Unv
         iKFg==
X-Gm-Message-State: AOJu0Yxvxobg/b9qO+KuWSjUPLmf3ccxB3paSSx0RhkU0BSqdG5XX7U1
	dmLFU3GEbMQuURfFufYiTQ1Ja5fmTeKk9t2UEhNyJmn3FsfHH4zIK8kEhnQz
X-Google-Smtp-Source: AGHT+IFhstisOgB5ENTbIo7OsmYiTc+/emFeQDDHfpKn0UhVxc9aXoSyDuh5MufuBK+/z4SaNzTbkw==
X-Received: by 2002:a17:90b:4c8c:b0:2e0:b65b:6b4d with SMTP id 98e67ed59e1d1-2e2f0dfe7b1mr21726981a91.41.1729176704837;
        Thu, 17 Oct 2024 07:51:44 -0700 (PDT)
Received: from ernestox.hitronhub.home ([2407:4d00:3c04:81a0:a609:723d:8a7:5889])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e3e094be93sm2009196a91.57.2024.10.17.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:51:44 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] misc: rtsx: list supported models in Kconfig help
Date: Thu, 17 Oct 2024 22:47:38 +0800
Message-ID: <20241017144747.15966-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rts5228, rts5261, rts5264 are supported by the rtsx_pci driver, but
they are not mentioned in the Kconfig help when the code was added.
List those models in the Kconfig help accordingly.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 drivers/misc/cardreader/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/cardreader/Kconfig b/drivers/misc/cardreader/Kconfig
index 022322dfb36e..a70700f0e592 100644
--- a/drivers/misc/cardreader/Kconfig
+++ b/drivers/misc/cardreader/Kconfig
@@ -16,7 +16,8 @@ config MISC_RTSX_PCI
 	select MFD_CORE
 	help
 	  This supports for Realtek PCI-Express card reader including rts5209,
-	  rts5227, rts522A, rts5229, rts5249, rts524A, rts525A, rtl8411, rts5260.
+	  rts5227, rts5228, rts522A, rts5229, rts5249, rts524A, rts525A, rtl8411,
+	  rts5260, rts5261, rts5264.
 	  Realtek card readers support access to many types of memory cards,
 	  such as Memory Stick, Memory Stick Pro, Secure Digital and
 	  MultiMediaCard.
-- 
2.43.0

