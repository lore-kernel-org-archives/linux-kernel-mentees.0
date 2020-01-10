Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D25DC47409
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1295320838
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u6O4jlfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1295320838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E58FD85516;
	Fri, 10 Jan 2020 23:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfTLOaawrcsB; Fri, 10 Jan 2020 23:24:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 890C786B20;
	Fri, 10 Jan 2020 23:24:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78745C1D7D;
	Fri, 10 Jan 2020 23:24:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47B8CC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3555B228DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jz4urHP67C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id CD61B203A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:56 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a203so3605904qkc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKAaRI+qny5owK6vpx9vqe3tT/EASWXktBmYILK1Mfs=;
 b=u6O4jlfMkYBmXT56NGy+JdgFcILfCzVVCqhPL1Lmg2+995slwtwdqyw3ikunUx5Bpu
 4QE9NGY7muRXc1pSBbJRi2DUusXVglb+eLrzjA/PHTr9CKfXNHN61IVYompJsK0A7N/P
 9jfVJF8D82GE0KLCRoHjpkFqjSTOPlKas3j3yuITRkgHfWhPMqnAyLO6ZWnV7fGg7ZTV
 R00Eylm1qKs0gifvsX24/3BW3g0+e/7tX+WD2y9w2tlc5gotpcQmortPmOk8sQzDT9Gk
 sRow2ceiTP1sdBPJu6PY9oT/uGqIXjNTNEwrxuzculNxReZ1sy0aljUlARi8xm//vHZU
 5+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKAaRI+qny5owK6vpx9vqe3tT/EASWXktBmYILK1Mfs=;
 b=i76iJrlsNy1jFJV7xSB5IFpG7Uk3bTJKNnIJOoYcjA5WAksPA2xCx+EtgsM1BQxmpT
 bBjXu1BWMAFDaItgWw+1sduL3gP/xt9UFfQFmw8aRB8+w56X4T45g+yV2hUjKf8VFO/y
 1xPAUvnsoMsxh30zmtdHmVzrzTdR/6bbYWVcy+5IH06CXyAX8eMvoIfsew2kJrDhOPvS
 dNYjWbMfJyXKqi5ECBIbk4wkd8P05meBtEtkRojwpjA+NNKhraNAAQp8SRguoX3NwkPU
 E/e1Ohrqntv1cMhqj//sevcL8IEy02Wji7P5r1/BDbrjLNnWdnEtwspeOyXYNx98iNC0
 PVMg==
X-Gm-Message-State: APjAAAVrPwp38vDZfkYnk2n5bbg9vx1B2pWKeJmLwG0+jvmoTxafk/18
 6wklZyVPklnbgOu1yLPfIpU=
X-Google-Smtp-Source: APXvYqwq3pRWBI9u5dbk8GTLz2Ts3jAsJTsAnx+g29BO0WUzjb6at/0LoRz3P7kurTPl/uwYboKGRQ==
X-Received: by 2002:a05:620a:1327:: with SMTP id
 p7mr5726392qkj.148.1578698695844; 
 Fri, 10 Jan 2020 15:24:55 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:24:55 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:25 -0300
Message-Id: <58c50f6ba94a0a2f212c4d2a42f64ffb40336b68.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578697871.git.dwlsalmeida@gmail.com>
References: <cover.1578697871.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 3/9] Documentation: nfsroot.rst:
	COSMETIC: refill a paragraph
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Refill a paragraph to eliminate long lines.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/nfsroot.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/nfs/nfsroot.rst b/Documentation/admin-guide/nfs/nfsroot.rst
index 9249be637833..82a4fda057f9 100644
--- a/Documentation/admin-guide/nfs/nfsroot.rst
+++ b/Documentation/admin-guide/nfs/nfsroot.rst
@@ -15,13 +15,14 @@ Mounting the root filesystem via NFS (nfsroot)
 
 
 
-In order to use a diskless system, such as an X-terminal or printer server
-for example, it is necessary for the root filesystem to be present on a
-non-disk device. This may be an initramfs (see Documentation/filesystems/ramfs-rootfs-initramfs.txt),
-a ramdisk (see Documentation/admin-guide/initrd.rst) or a
-filesystem mounted via NFS. The following text describes on how to use NFS
-for the root filesystem. For the rest of this text 'client' means the
-diskless system, and 'server' means the NFS server.
+In order to use a diskless system, such as an X-terminal or printer server for
+example, it is necessary for the root filesystem to be present on a non-disk
+device. This may be an initramfs (see
+Documentation/filesystems/ramfs-rootfs-initramfs.txt), a ramdisk (see
+Documentation/admin-guide/initrd.rst) or a filesystem mounted via NFS. The
+following text describes on how to use NFS for the root filesystem. For the rest
+of this text 'client' means the diskless system, and 'server' means the NFS
+server.
 
 
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
