Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855F1C2D0DC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:11:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C7F206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="du8GUIma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C7F206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30C0C8494E;
	Tue, 31 Dec 2019 19:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTO1lo8ESwIp; Tue, 31 Dec 2019 19:11:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C22A084627;
	Tue, 31 Dec 2019 19:11:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A95D6C1D81;
	Tue, 31 Dec 2019 19:11:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EE76C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 29DAB20443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQhin6FCLCeT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 6570A2042C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x184so20054007pfb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 11:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cEKkPPh58+NWwC8pljRVd1pm7ncl2tPP6DaJoDLZVBY=;
 b=du8GUImaVYJNTgyEs5bmzYxXzachMqtydAfEWcAtME/FclGylO83pVbjVPaCzF+zIq
 +Ro50CZwi+fIiopjLvIEuGisF5J6EEknTwrtV6TagiQ18ntH6opNO9Y594Z+TtCEAtXh
 /cMqjIIqKASuI7P0XKPaeng8JHKYzX+n/BIwfMuE1sl8MhVJVpDYIHCiOmW8s8KhapTh
 sU/FUQ9miMUnjFmAik/jLEX9uYXYUgjrF3S3n40aRBx54XFYZoA2qtEpT1g6F/RUMey5
 bgi38x890QjbxLxCaqbfyw/RipP+9IbNfxP0EWo7Lf4qZ9vw2HhClGXd2Lvp/VfXpzel
 qXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cEKkPPh58+NWwC8pljRVd1pm7ncl2tPP6DaJoDLZVBY=;
 b=Cm1HRfJmoXc2MxI3VQSndj2TzuWFuX77FKWMzrSbAaY96qaLXanXXMYUjuNeEvOW9p
 ZVH/l7HDi1gwgVnRFJnvmVQAG1vz740qojQCGQFfmQIUImanhFbNP6qz4KeZKNqj3SSx
 Vovos4+n71bY1IZ/8YzqKRJtzGZNt53gl5DenSarBzAoSfF/GgTiof+KujqLwZ7+jlNP
 o+5HvNLV9PHwmUVpa5XGyBkyLnldoNk7YzJ9pwz6HzXM49w2UkT+EoxvXXgGLigJC56D
 5TETFmSniDBC2l5K32SD7gzrJi8IbSlIZn5hL6w3JdfV6Ni5m2v0aWh4iDe0llx8GZg5
 aVWg==
X-Gm-Message-State: APjAAAWry7OxjjiMcj0twdf0ADea+MxqXsk34N3IaLymW7MYk4Nvu2pW
 fCpM/S5a0bWuCSbB4LjKeRY=
X-Google-Smtp-Source: APXvYqyP5hBLa46d2pD7phTH+yVLXDiSITlA22KEXwFyfw5tDX50IUxuo812AZFCCw573ZVgyhvkUg==
X-Received: by 2002:a63:d306:: with SMTP id b6mr77626681pgg.195.1577819491955; 
 Tue, 31 Dec 2019 11:11:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 11:11:31 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Tue, 31 Dec 2019 16:11:19 -0300
Message-Id: <cover.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 0/4] media: dvb_dummy_fe: Tidy up
	the dummy frontend
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
are now compiled into this series

Changes in v3:
As suggested by Sean:
Dropped media: dvb_dummy_fe: Add error messages in case of attach failure

Squashed dvb_dummy_fe: Fix long lines and 
dvb_dummy_frontend: remove 'extern' keyword from declaration with
media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION

Added a new commit: media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION

Daniel W. S. Almeida (4):
  media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
  media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION, AVOID_EXTERN and
    long lines
  media: dvb_dummy_fe: Add blank line after declaration
  media: dvb_dummy_fe: change printk to pr_warn

 drivers/media/dvb-frontends/dvb_dummy_fe.c | 91 ++++++++++++++--------
 drivers/media/dvb-frontends/dvb_dummy_fe.h | 12 +--
 2 files changed, 65 insertions(+), 38 deletions(-)

-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
