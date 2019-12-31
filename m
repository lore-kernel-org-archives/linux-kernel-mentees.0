Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD36C2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:11:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB7A2206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Til1MmZu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB7A2206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A262020456;
	Tue, 31 Dec 2019 19:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6CdINNj1KiV; Tue, 31 Dec 2019 19:11:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3067720360;
	Tue, 31 Dec 2019 19:11:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F95FC1D81;
	Tue, 31 Dec 2019 19:11:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68348C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 57E7384DDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IzpuFcAdbGC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CDB31838B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:45 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id n59so1514010pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9GfKOO98mLmW+DdmACwpqWQT43A7np+giNx/HT6uWc=;
 b=Til1MmZuV4E/d9iQUF/gCA4zz07qu0do0t5QqeE3JvrbTHGq+IrD6X4sGlBcMwFRjn
 QcBQSlZxPmALTMvuC7Z4M7NuLFAozJF9e5ojvkb7SHq84pBg2oDrEGGXqyMSK1glJAKs
 xpgK+NavZtU/MrRW8KFUR7wNZNKECNydQz4v+RCH8dlyKcOx/0isAM0CSKFzjYs/RCP+
 4rs/NxjVKJEvzytuRoiS+hWs2kn4ZIgTbIf2Ae0CjIhGBXe3yv+NxLc9TXTWPB+J99yf
 MUOr85iERJupJnCo1VC4a//75XfcoQ18uxwM/5w+UgyOCH5dvpd9bFdE6EXYGMyDDshN
 FIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9GfKOO98mLmW+DdmACwpqWQT43A7np+giNx/HT6uWc=;
 b=LtDlyVzLFFoQSHMfzy6lG/LRno6sIcnkTx3mFH3JMzoRo93tK+O7hwZLCi1wKwrxd6
 zgo7SIDsx6hX77gbZSCudwT9Y/6WwWlVrfdJ5KeQ+2E8RhJ8kJE9Poz2H56eJHnr12fR
 kd8bBgj6U1C/7xJxhXpmC+9JBHWSXZk4p2/lm3+oEVFV5ky5y4V4HoDyjF0Fkijd8Y5G
 yU5x4htzct2cmTEQ1E+icVU5NnWmwW17LN5xGsi6fgji4gHKbo9qTT0XeUrXcJaJsYV2
 x9NoT045RkSWYQ+xrY8z9+exKdgJgQblmjt9xy4aItWVXIyE360iFhJikA98xPD5Q7wm
 IIuA==
X-Gm-Message-State: APjAAAUXCqpB9xmRCcOHqxjkYA0n5+R2BjEMUiYO/apfhHWo6p75hx9w
 R7YqrxQZMSeCRjFVm8KuYp4=
X-Google-Smtp-Source: APXvYqxAHyyWgIAmnBTE3YfTzv4hLEsBVEpht/EycOHxjO0ky6GRYg1fdc+j9W4Ozz+YAO8uOrzE/w==
X-Received: by 2002:a17:90a:d787:: with SMTP id
 z7mr8267446pju.10.1577819505442; 
 Tue, 31 Dec 2019 11:11:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 11:11:45 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Tue, 31 Dec 2019 16:11:22 -0300
Message-Id: <9b56605120ee19438df872e209703ad300a781c9.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577819245.git.dwlsalmeida@gmail.com>
References: <cover.1577819245.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 3/4] media: dvb_dummy_fe: Add
	blank line after declaration
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

Fix checkpatch.pl error by adding a blank line

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index e7f51d581d63..9ff1ebaa5e04 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -103,6 +103,7 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
 	kfree(state);
 }
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
