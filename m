Return-Path: <SRS0=PNQn=ZS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A214C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 16:48:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7832064B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 16:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1vVEnMA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7832064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2ECD85725;
	Tue, 26 Nov 2019 16:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cPmYObZhLqD; Tue, 26 Nov 2019 16:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 613D584F8B;
	Tue, 26 Nov 2019 16:48:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51612C0880;
	Tue, 26 Nov 2019 16:48:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87B5AC0878
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 16:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7662084FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 16:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAfnNgcqedVe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 16:48:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C8D4E84FB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 16:48:42 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id t5so726514qvs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+zPkA8+xnxZt5YlzMia4m3XjGDeqnWO3gTXHV1iMw8=;
 b=W1vVEnMAfoWOr9tfIE4OO7WOdRBMvYJr1iYrardHluig0uJv5ZiQhcgVfJ3jvNvIZn
 5kq0zjR2/vxZonoHZQVDPtM4lUJp4HOZHu0tnX8UuXvpVV56VDkDVEefvhcqjRWoqlH+
 etupSk6HtmMFYihC1R1e70per9jH8vSzZ/2wc1M4miC+8HvX2AwZF/seoaRNhElD8NKA
 Tvxihiz+wMGJxqwlQsZgLnb5N1KqAHj6VU5oxSVt5eRJvtXyeVlIKITU2YRT6J62NWET
 DoiM4OKNeA9coOEkNFgB/aH1l7GxvjMWgL/wOTyDHmseVIyr5y+4a1JpRi+5sgaAX1Ty
 h76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+zPkA8+xnxZt5YlzMia4m3XjGDeqnWO3gTXHV1iMw8=;
 b=lg8NU9Nw7h+qQF4+7Dh+p9cFgOMKXPLDv25NemT/5x88SgRjMtZUO1ClkbqVk6b+xL
 qACI11jLk2um9UjWx4PWnOFbYAZjleglGkRarm2Qh6Y2C+wUJwkyDhdEAz2YfRXntjWY
 I0dg/Dy+mnyYDby0HKNg9gHVHwfJzoHXFSSYxR1+u9G0PIKXKT3EpGgBuFWgaqVdQXmq
 Z3EzWyzb+vFDsKFACUVAUOoSrnQ1vmKGJHDkjliQxPd2+SvWfHVeHPFkadp1XVfmYqTg
 QM8Qzc4RjyqWkvEcMELg02Wqy4Nsom7WbrzLZswg2MJL20Y7JVz3r6ICRvwFG85vvkz5
 kLdg==
X-Gm-Message-State: APjAAAVSfdH16K+/txDLcxULK8Rn7nP0qmYWl+ZfZ8+/6U1rysmreKVS
 HFQcz5vZCJ0JF2Qy20DhEIE=
X-Google-Smtp-Source: APXvYqzLtSh3CFHeSjcjesN7FVQ5aF0i3rYiD9rP9xs+OmFmlzVG5T/rlkNfe2f+aPpLGoxvpDF2+w==
X-Received: by 2002:a0c:f114:: with SMTP id i20mr34101622qvl.167.1574786921642; 
 Tue, 26 Nov 2019 08:48:41 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id e5sm5936362qtq.29.2019.11.26.08.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 08:48:41 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	p.zabel@pengutronix.de
Date: Tue, 26 Nov 2019 13:40:51 -0300
Message-Id: <20191126164051.39920-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Documentation: media:
	dtv-frontend.rst: fix a few minor typos
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

Fix a few minor typos throughout the document without changing the
meaning of the sentences.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/media/kapi/dtv-frontend.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/media/kapi/dtv-frontend.rst b/Documentation/media/kapi/dtv-frontend.rst
index fbc5517c8d5a..b362109bb131 100644
--- a/Documentation/media/kapi/dtv-frontend.rst
+++ b/Documentation/media/kapi/dtv-frontend.rst
@@ -15,8 +15,8 @@ The header file for this API is named ``dvb_frontend.h`` and located in
 Demodulator driver
 ^^^^^^^^^^^^^^^^^^
 
-The demodulator driver is responsible to talk with the decoding part of the
-hardware. Such driver should implement :c:type:`dvb_frontend_ops`, with
+The demodulator driver is responsible for talking with the decoding part of the
+hardware. Such driver should implement :c:type:`dvb_frontend_ops`, which
 tells what type of digital TV standards are supported, and points to a
 series of functions that allow the DVB core to command the hardware via
 the code under ``include/media/dvb_frontend.c``.
@@ -120,7 +120,7 @@ Satellite TV reception is::
 
 .. |delta|   unicode:: U+00394
 
-The ``include/media/dvb_frontend.c`` has a kernel thread with is
+The ``include/media/dvb_frontend.c`` has a kernel thread which is
 responsible for tuning the device. It supports multiple algorithms to
 detect a channel, as defined at enum :c:func:`dvbfe_algo`.
 
@@ -220,11 +220,11 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
   - As the gain is visible through the set of registers that adjust the gain,
     typically, this statistics is always available [#f3]_.
 
-  - Drivers should try to make it available all the times, as this statistics
+  - Drivers should try to make it available all the times, as these statistics
     can be used when adjusting an antenna position and to check for troubles
     at the cabling.
 
-  .. [#f3] On a few devices, the gain keeps floating if no carrier.
+  .. [#f3] On a few devices, the gain keeps floating if there is no carrier.
      On such devices, strength report should check first if carrier is
      detected at the tuner (``FE_HAS_CARRIER``, see :c:type:`fe_status`),
      and otherwise return the lowest possible value.
@@ -232,7 +232,7 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
 Carrier Signal to Noise ratio (:ref:`DTV-STAT-CNR`)
   - Signal to Noise ratio for the main carrier.
 
-  - Signal to Noise measurement depends on the device. On some hardware, is
+  - Signal to Noise measurement depends on the device. On some hardware, it is
     available when the main carrier is detected. On those hardware, CNR
     measurement usually comes from the tuner (e. g. after ``FE_HAS_CARRIER``,
     see :c:type:`fe_status`).
@@ -323,8 +323,8 @@ A typical example of the logic that handle status and statistics is::
 		.read_status = foo_get_status_and_stats,
 	};
 
-Statistics collect
-^^^^^^^^^^^^^^^^^^
+Statistics collection
+^^^^^^^^^^^^^^^^^^^^^
 
 On almost all frontend hardware, the bit and byte counts are stored by
 the hardware after a certain amount of time or after the total bit/block
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
