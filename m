Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6174C5ACD7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 06:00:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D88E20724
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 06:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh6hv01f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D88E20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4848286D94;
	Wed, 18 Mar 2020 06:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pm66Qj_Nu6qh; Wed, 18 Mar 2020 06:00:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD47586D6F;
	Wed, 18 Mar 2020 06:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D68C18DA;
	Wed, 18 Mar 2020 06:00:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD830C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 06:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A3D5686D94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 06:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEukMhOZqRZR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 06:00:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D48386D6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 06:00:28 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q17so12230684qki.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 23:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbpntlACNTf2KZls1XosmvOl6RuPNFt+vg13rIbAn3w=;
 b=Lh6hv01fFXCZeXv4NhyciK9t2jnmHpwB3h5O0giQegHmO/xpTSpRXnnNlzEX+vj4rm
 qdiBPDmU/6taO042gMWZoxgjVhumGhqk2ffjgTRlkwtxzE8OYdcjtfYpY2iMbUQEwJGZ
 6eYoTwcwxvK2zWWdthdHOomAvUBV6S8b4Xik8rzgbEKxlvciJ2NCdh5pGUaDF0uDzWQf
 SW3278LLPWI/JJV4CVbBND0iiN5//5hTXPUhQOUJb4X+sAf+TgZwI+86njcmMDxmCYap
 v/aOR71ExSq4rFzYPnU7sg/m7QjaDelikp/u4vNevI+NwV2pJ/bIMITGO6tULjxArgvb
 bcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbpntlACNTf2KZls1XosmvOl6RuPNFt+vg13rIbAn3w=;
 b=TpqUS1B6njh769rzSybFrsqmkM1ygn/Gdruy2EpapD5zjdplpSJ2uvxB+GmSK4vJRh
 S1oMH40j44zFtW66buxMIhIBYFJxYAVfa/QWivnTIjoJSyEyEV3ZuqqpMXdExjYd2Qk1
 jhfdRdkDdXGqFcv8vWQ00X1U4O5CqzkRqh+bDivCQlBo9jVFu5bqEG5iVwLqgPWNk7r9
 3+0AByqsHafoYBef4BU2oGzRJ0/yDEmxdM+SImi4rjYr13kabXR18ZErpDwQMcoV388O
 MxjWD3IAHoH/npOp/kxFUotlTubjJ21WjGpEp1eGVkyUxFAU6ATkCRdiVIHh3wGB8tqi
 8R0A==
X-Gm-Message-State: ANhLgQ2xGjkupNEXEtxyIYjQ21CzYh7sKP8qg74z7TOQHNx/57x8Q2nD
 jzD0itlsibGwoZcnzZgsg8c=
X-Google-Smtp-Source: ADFU+vuacI1bxztRsBFwK4FgIjABBnD+nKVi3YfuMJGwcur6EeO5bpZzZIThhoith0Sf2A0ERd2haA==
X-Received: by 2002:a37:8781:: with SMTP id j123mr2442881qkd.308.1584511226889; 
 Tue, 17 Mar 2020 23:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id c10sm223303qtp.13.2020.03.17.23.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 23:00:26 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Wed, 18 Mar 2020 03:00:15 -0300
Message-Id: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC 0/3] Implement a virtual DVB driver
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

This series is work in progress. It represents the current work done on a 
virtual DVB driver for the Linux media subsystem.

I am new to the subsystem and to DTV in general, please take that into account.

Currently I have written a simple fake tuner and I have been working on
getting PSI packets into a TS stream and then feeding the stream to the
hardware-independent demux layer. I have been basing my work on ISO 13818,
ETSI EN 300 468 and on a real MPEG Transport Stream excerpt.

I am aware that the first patch generates plenty of warnings due to floating
point to integer implicit conversions. I still have to rework that.

The last patch in the series is also WIP, it still misses a set_frontend()
implementation among other things. This will be sorted soon.

A few bits of code were taken from libdvbv5, mostly the structs for the
PSI tables.

I appreciate any comments to improve this.

Thank you.

Daniel W. S. Almeida (3):
  media: dvb_dummy_tuner: implement driver skeleton
  media: dvb_dummy_fe.c: lose TS lock on bad snr
  media: dvb_dummy_fe.c: write PSI information into DMX buffer

 drivers/media/dvb-frontends/dvb_dummy_fe.c | 1538 +++++++++++++++++++-
 drivers/media/tuners/Kconfig               |    9 +
 drivers/media/tuners/Makefile              |    1 +
 drivers/media/tuners/dvb_dummy_tuner.c     |  421 ++++++
 4 files changed, 1963 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
