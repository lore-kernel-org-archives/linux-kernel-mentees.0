Return-Path: <SRS0=FCUG=5I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FF2C3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Mar 2020 12:58:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC02206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Mar 2020 12:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqlcvoCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC02206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6030F881B7;
	Mon, 23 Mar 2020 12:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWJEWan8Pfy3; Mon, 23 Mar 2020 12:58:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D857A88196;
	Mon, 23 Mar 2020 12:58:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC60DC089F;
	Mon, 23 Mar 2020 12:58:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C552C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 659D886A8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmVrPY-gskVM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CD70485FD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t9so7512191qto.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jd9kwn2zd+0ypqKpSt+uwDL2hne6ME0vFIVoatUBeDY=;
 b=YqlcvoCGQTIS5tOMfxM+oEogAN5hsAl/qK+7UKoYhf55OJJnzKtIS6zv31FrZzST8T
 VGxr3el7QpQZIeSelNHAMCOgjnsyHgclHCgw/cxFvZXKSkWrO1MJ4Qb/BZPCKPVN5OeY
 E6ycUk6JnmYRyij1z/0bw1vdjdnTuy+0GEWGR8V1Wr9u+zZ4b4XRjuu/mRXgPZxEWRKD
 0ZOxwQ2KMrtwnTV20IZP7T9/eP3Vmg6wXdMDKn4zI37mwhJ/52g/t+gaHjgRtIWYyQRu
 CJr6hBTcZeN4LyLeF14adwlYkVLJVNJ+MUkG7ubPt0QWlso/4lLMPL6P3b0pEbaDf8iU
 6CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jd9kwn2zd+0ypqKpSt+uwDL2hne6ME0vFIVoatUBeDY=;
 b=OBewGaV/P4DzWJwMTGLUsVhaUJbzHSQd5aqSG2FQeF5qEH3GbaAP3ljJX1RwMFTUva
 iLasHL79U9UDdULzJeANck1kv31znYl3T4Luryx7PlcmNSpRZvBXtpLydMripjfr3fBY
 OIR8D3/6fP53hrDKOOygSd7y3WbPVO+AwmWPXorI+yNgbHCRymhGmlSW224eSQu6o8QW
 zxZgya32ipAOGxe0/IsKhCjFTES1dudV9eQysfkC44os3CHyOjm3eu8/0dWFC6Kqcb9d
 TDvGjSFKgiB0RtUWtRp4SHZSvzg5GSKON0HeriqiBL6UnmyO/+HYCzUJTLmVdX60EKok
 vcZQ==
X-Gm-Message-State: ANhLgQ0rz/O7asKOYyM3LzC4veBnq6RDtMkTS2orSMtV2JvWU+DRxUlN
 yWBXu+u+h731OiQ9KcXRrgE=
X-Google-Smtp-Source: ADFU+vu50oeN/AGL7WjeLRjcfIM4xuXhaIPUR7VR9Pa1oI20XsVr7SRrFX3JRnWhzcpf+T0kkdZlvA==
X-Received: by 2002:ac8:3072:: with SMTP id g47mr21195319qte.278.1584968303732; 
 Mon, 23 Mar 2020 05:58:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id 16sm11075800qkk.79.2020.03.23.05.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 05:58:23 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Mon, 23 Mar 2020 09:57:29 -0300
Message-Id: <20200323125732.281976-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v2 0/3] Implement a virtual DVB driver
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

Changes in v2:
	
	Attempted not to break assignments into multiple lines as much as possible.
	Code now passes checkpatch strict mode

	media: dvb_dummy_tuner: implement driver skeleton	
		Changed snr values to mili db
		Return value from 0-100 to indicate how far off the requested
		frequency is from a valid one

		Use the frequency shift to interpolate between 34dB and 10dB if
		we can not match against the SNR lookup table
		Remove sleep calls for suspend/resume

		Fix memcpy call for the config struct

        media: dvb_dummy_fe.c: lose TS lock on bad snr
		Randomly recover the TS lock if the signal quality improves
				
  	media: dvb_dummy_fe.c: write PSI information into DMX buffer
		Split the patch into multiple header/source files

		Hexadecimal literals are now lower case

		Prefer short function names / reduce function signatures

		Add #defines for constants when computing section lengths

		Change signature for functions that take a dummy channel as
		argument (i.e. channels* is now channels[NUM_CHANNELS])

Daniel W. S. Almeida (3):
  media: dvb_dummy_tuner: implement driver skeleton
  media: dvb_dummy_fe.c: lose TS lock on bad snr
  media: dvb_dummy_fe.c: write PSI information into DMX buffer

 drivers/media/dvb-frontends/Makefile          |   1 +
 drivers/media/dvb-frontends/dvb_dummy_fe.c    | 389 +++++++-
 drivers/media/dvb-frontends/dvb_dummy_fe.h    |  32 +
 .../media/dvb-frontends/dvb_dummy_fe_common.h |  55 ++
 .../media/dvb-frontends/dvb_dummy_fe_psi.c    | 902 ++++++++++++++++++
 .../media/dvb-frontends/dvb_dummy_fe_psi.h    | 287 ++++++
 drivers/media/tuners/Kconfig                  |   9 +
 drivers/media/tuners/Makefile                 |   1 +
 drivers/media/tuners/dvb_dummy_tuner.c        | 419 ++++++++
 9 files changed, 2088 insertions(+), 7 deletions(-)
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_common.h
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_psi.c
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_psi.h
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c

-- 
2.25.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
