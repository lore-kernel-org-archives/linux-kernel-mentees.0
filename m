Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFF9C43141
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1271820725
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho08fRQM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1271820725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B57928651C;
	Sun,  1 Dec 2019 16:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kSkhyoDm5H3; Sun,  1 Dec 2019 16:23:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4620F86501;
	Sun,  1 Dec 2019 16:23:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E29DC1DDC;
	Sun,  1 Dec 2019 16:23:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFB34C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D769F879C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEKgudpKo4P2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 927E4877DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:40 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d124so14974483qke.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5Od0x6vUCRqcGVlDVkGHT0CIlXPckMQvdNmbEd1AGc=;
 b=ho08fRQMV0wU3zPR9doI190XmpqECF18dlDsG1J9KMuNW9MvHqMfe/u5F1c2rsw3Ee
 SUpcbE2T1Gr5LDaB2rNBNZ9MH45DxdOkpWCFbF6+qWwHnJzG+A1NR6l+YOa4877G/46r
 565kZj0DT4Icf/wLAGGlcBiqmX2K3Lds8wcugNuebd/ht+F9geDAeZ5jV+k2uMVEkevm
 upFlssgkRTBGGF6PGK7nruFrYc6B5yP+lgv8N52GYZPGMlueFEAbktlVVN3zwgtjFDzA
 MF1AcHRfmwcjrHujZqK1byNuluAiWCQBfG6jAwqj0YWsX7QFBLQCS+lSIRFOXi8kHBn3
 K6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5Od0x6vUCRqcGVlDVkGHT0CIlXPckMQvdNmbEd1AGc=;
 b=gAV2zayIIULYkS2k33GPrFBl+JpCYYesdRNkgX1HWjHC32yMpcz4E2D2bJDdt8tqrK
 GhbpLNIrAYEYu4pDPhTs1aSEzFfNPVaqGUsOyX8w7LpHrFEyKcSthhJS6zwcV1WzkflV
 ZzFHF+jjOjH4zbgbzmZuxtrsk9lafeuOhNDbaaELVa/5/kmrVGXBj3l/Kpe+GRbaiBK6
 ySUZQJG7YohWAZqsHBPPqFVmlXbA/P/kgbtLU4l14a2BptpyhKUHYYPEsh56ygpV1+BI
 qTDVX/Hk8iSXhsMHBlQi5GJ+OsUgQe2aa0UDjHj45CcZPkMuRf2xTwOBB0N6WYifS65q
 OIXQ==
X-Gm-Message-State: APjAAAVAAjmsHoJEbgXPbpkTS5Ki7otzWFY0plufkS6k6D1vbOjHzsiF
 cfPOz7+MeB+7vdZYLAZEntA=
X-Google-Smtp-Source: APXvYqzkLHa+PMKo+ch6fc/oQfVS+ED+Z0ZyPzJq2m6vvKPbtJxPJ7zUXMz5UDETdwwWU8CprQFFpw==
X-Received: by 2002:a37:490c:: with SMTP id w12mr28304114qka.101.1575217419482; 
 Sun, 01 Dec 2019 08:23:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 08:23:39 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sun,  1 Dec 2019 13:15:36 -0300
Message-Id: <20191201161542.69535-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 0/6] dummy_dvb_fe: Tidy up the dummy
	frontend
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

This patch series irons out checkpatch.pl errors in dvb_dummy_fe.c
and dvb_dummy_fe.h.

These patches were sent previously in a separate fashion, but they
are now compiled into this series. One of them would not apply, but
I fixed this as well.

Daniel W. S. Almeida (6):
  media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
  media: dvb_dummy_fe: Add error messages in case of attach failure
  media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
  media: dvb_dummy_fe: Fix long lines
  media: dvb_dummy_fe: Add blank line after declaration
  media: dvb_dummy_frontend: remove 'extern' keyword from declaration

 drivers/media/dvb-frontends/dvb_dummy_fe.c | 109 ++++++++++++++-------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |   6 +-
 2 files changed, 77 insertions(+), 38 deletions(-)

-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
