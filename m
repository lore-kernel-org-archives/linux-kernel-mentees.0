Return-Path: <SRS0=VniB=G7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14529C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 14:38:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EFA64DDC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 14:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EFA64DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EF4262DEC9;
	Thu, 28 Jan 2021 14:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMje94BgjeNk; Thu, 28 Jan 2021 14:38:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 904832044C;
	Thu, 28 Jan 2021 14:38:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73EB2C0FA8;
	Thu, 28 Jan 2021 14:38:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05027C08A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E5259873B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrafAXJM+sIV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F01AD8738E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:01 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id g15so4410506pgu.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 06:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4LE73ezSwns7mEEZC3LY3BMjP0QBXPnuGOU777vzw2g=;
 b=BX04WOkZExv7TRAaFZplmpDGyMPNryK6W9ScA55GjN24CYHEv46zvvWDw7mYkFjInF
 2FFVf4WQRMdpvaPU2s0TM2YBmOgUuXLOPtmSq8MxedzbvHnlMoJra6bJhFVnUycRuLdL
 k7cV+e1raSTGnILRW3G8nidhDBEdJo+LTEeSHWsyAl+cPzSb0CJjXloaPhdxkxVKEZKu
 pKVOQOIP5tLQwlA232B+k4LY3nBBDdIrZjSXoIvA8SSxMVNB31Xp6dIUT7n31KT+V5bJ
 5pWvZRaW5/cfuXcU2I1NOIHQzt/oyDdLGqRRUE2Si4JZ4wltVRs9eZ/+bQAcOGCEGtLH
 ALVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4LE73ezSwns7mEEZC3LY3BMjP0QBXPnuGOU777vzw2g=;
 b=ZmacZQjDD9/uXCYqz/0yL4V1ZKarSHsfJwbZus/CLc2TuNYe+rgUX19RZFrf4y1yHE
 SdL1cnl2+pFzIGOifHDkTTOAVPC96ib7PYWYqped5taU6I3n1C0PLtk/4Oi1vy55Q2+S
 Gg3ur49mpbzT1OGpptZi5AaIUNBJtKM3TxfKJMybUKdpOsqDndZMYSaCCAhy1jexXJDK
 i2QoDvDE+U5qi8pKRu5da+rlbi1iABtZhvw4k1zL8A4V5jvEMsaGW2Y8JUqwOgJYoxk+
 uvcJWSJG/xoR82/vLA1zbQkuZ27/GWDgfs4BgQ/bGp17ljCg2TyOBMJoliTJH+Tu1+9J
 tH1w==
X-Gm-Message-State: AOAM53079+WDIcUkPSqh3CGKVtUjrnhExOu9Xd7cj6gFE+LYzdQfLH0r
 MBJ84dfSZbr0Kq+8ibBWqgM=
X-Google-Smtp-Source: ABdhPJz7LsUNiV8L2CnVB6SELDXnNVbeXfy0SfbPEc/djrRgCQejYLvvqqlN4zgzebatDaEjkTaxbQ==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr16869291pgm.257.1611844681350; 
 Thu, 28 Jan 2021 06:38:01 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:686d:e9f6:a78b:e60e:9585])
 by smtp.gmail.com with ESMTPSA id w14sm5358621pjl.38.2021.01.28.06.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:38:00 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu, 28 Jan 2021 20:07:59 +0530
Message-Id: <20210128143802.15888-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] checkpatch: add verbose mode
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

Add a new verbose mode to checkpatch. The verbose test 
descriptions are read from the checkpatch documentation
file at `Documentation/dev-tools/checkpatch.rst`.

The verbose mode is optional and can be enabled by the
flag -v or --verbose.

The documentation file is only parsed by checkpatch.pl
if the verbose mode is enabled. The verbose mode is also
suppressed when the --terse option is specified.

Changes in v2:
- Use .rst Field Lists to specify the type descriptions.
- Add a few more type descriptions to documentation.


Dwaipayan Ray (3):
  checkpatch: add verbose mode
  docs: add documentation for checkpatch
  docs: add documentation for checkpatch

 Documentation/dev-tools/checkpatch.rst | 269 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 scripts/checkpatch.pl                  |  54 ++++-
 3 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
