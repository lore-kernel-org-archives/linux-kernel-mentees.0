Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF4BC3F2D7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 17:40:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037EE222C4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 17:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7fj8X3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037EE222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE768877E7;
	Mon,  2 Mar 2020 17:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRiG4IZFs4Yr; Mon,  2 Mar 2020 17:40:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D672877E4;
	Mon,  2 Mar 2020 17:40:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 745B8C1AE2;
	Mon,  2 Mar 2020 17:40:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DC49C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7591C877E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeqUFy7Cs9Ng
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:40:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E499E877ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:40:04 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id d9so163223pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ccLgGlXJeyfNwA0nueYiFsMbc5nyvrsM97a1+xIUUac=;
 b=W7fj8X3a8gokG5mZbNte3SvQJzMLyc6ZsZ3I18q1+2Qnam52farx0iNFiqbPc5+HxP
 kJqiJEsRLC7eaogsdWtKTTkETP+UqktTIdofxDvV8J0WE8RmxhwxTk0dCADgqzImBe4l
 jGDig8SgkU82S1wb93DXjj1hGpbSm+o1w0WuHdybfxaIoIE6I+tLhWOv69paXjU0w/3O
 hPdgjlViSZdNcxbYiXUKUEy9EGlDS+84Dj5xOMt9yEGKBlEIwYy0BBaV5fX8UIuorLcD
 YCuSfHRae8WrrTT2YFHLY1dJ59s3tN1dDGPnj9bl+337a/0xutqLOgpThGS2Uoo073ZM
 fU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ccLgGlXJeyfNwA0nueYiFsMbc5nyvrsM97a1+xIUUac=;
 b=aN5N5DlOSIDQx27xvND1I+iogz+V5hAs3mBdPGe8ZwN9ydR5cuxM/pUoU1WdPWlMlT
 l0jX3U5iqudna9glRIAcUBLc2/173UqmjVUXkGKW5iID6ZhV97UhcR4XV9Wry5HAI3bs
 kZ4q8RIOPHpJKWMmii6KHJlbmzGmBuwlzE60mvGmUtTyc4caDNhmTuVHTQrPsHopCJUt
 fCJRxtb0qvyBx/KojcsHrcE2wv4FzOBntprv5s1/pmTi1TUqEY7nRV7trauAwyYG4284
 CE96/5Dhk2smAXeAAmpMrzYOqGqPU/5ItBEVIjS6nHuFJGg2UUSKcI9+GZdMy8YsB9aF
 hORg==
X-Gm-Message-State: ANhLgQ0A2ERcwlbv0UTTIGDo5wnsYpNAxzNyl4Mxs2CjZgDMbykMwUIi
 2PlLwe8gwVDAIWJXhdIzuA4=
X-Google-Smtp-Source: ADFU+vsmcgwBaN2ggQ2yDntxSGZzld20AoSwZIazsRFr8GSGi0fFrYx982ZdTaikc8pnRwYPy0tVLQ==
X-Received: by 2002:aa7:8b17:: with SMTP id f23mr149223pfd.197.1583170804359; 
 Mon, 02 Mar 2020 09:40:04 -0800 (PST)
Received: from localhost.localdomain ([2405:204:800a:15c3:b0b0:78ba:d728:349e])
 by smtp.gmail.com with ESMTPSA id c184sm21764462pfa.39.2020.03.02.09.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:40:03 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Mon,  2 Mar 2020 23:09:18 +0530
Message-Id: <20200302173920.24626-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] Documentation: Add two new rst
	files
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This patchset adds following two rst files to the Documentation and
references the newly added rst files into TOCTree of index.rst
 -io_mapping.rst 
 -io_ordering.rst

Pragat Pandya (2):
  Documentation: Add a new .rst file under Documentation
  Documentation: Add a new .rst file under Documentation

 Documentation/index.rst                       |  1 +
 .../{io-mapping.txt => io_mapping.rst}        |  0
 .../{io_ordering.txt => io_ordering.rst}      |  0
 doc_make.log                                  | 35 +++++++++++++++++++
 4 files changed, 36 insertions(+)
 rename Documentation/{io-mapping.txt => io_mapping.rst} (100%)
 rename Documentation/{io_ordering.txt => io_ordering.rst} (100%)
 create mode 100644 doc_make.log

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
