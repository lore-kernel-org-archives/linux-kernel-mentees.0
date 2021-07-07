Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E4C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 02:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E5F61CAA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 02:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E5F61CAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D646340195;
	Wed,  7 Jul 2021 02:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MHU2l2mzJ8k; Wed,  7 Jul 2021 02:36:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1584540015;
	Wed,  7 Jul 2021 02:36:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF9A8C0010;
	Wed,  7 Jul 2021 02:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1ADAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A22C340529
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaMk0zoDIvmC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B76540528
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:26 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso693867pjz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Jul 2021 19:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCxCbJlJiqNeiIjObMW1i82bs2z6LZMv7wXyXYhR9UY=;
 b=sKCXnleWWkjorBPJdQcv0RhDEn8XoGWzLD7XBRZ4y+PfdPegQ5aF0qGHwm8gP0hRPN
 wt1vKhublUX1mPP4zyjlltWW9rxInI0ztJsSMtIJ/AfQ18bu6kV1qow29SZCPxSU4y57
 BKyt0JwxRpZ5uYhELLv5Dfzb3tOQLg6b6rDsxUk0bSDSpR+8ksVZQyFRcDJEbc2gTRmt
 +UhiKP9EzL/jvBBAchlv/i8EekT/OZ0+zf5qL0CECX/fOh1CXZJxKg2tJFyiT/Wnma8Z
 Br/Ak3G8K6oKWXJDAbHt1YO3mQ/5vhcR2Xwgch8g0KGDHHOsyyB7SWgE8dnMP8nItVSz
 caTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCxCbJlJiqNeiIjObMW1i82bs2z6LZMv7wXyXYhR9UY=;
 b=GCVh5ERh8qf58NnoO0+OP7V696VxkF1y8JN5HiG2+oBVPIUX0ddzLHHibvuf6F4O4L
 Aa3Kaiuj3ab8+IW3oCWOBLv92Ld9UXJk2w4vaeqYBsCBNl3nD/tIMwf6SQuQ18bEaO9X
 axCopEAPErAGa8DTJK1RPpclvYD0JTKWmRPVqqNX0lS2KdY1qKepL6ay/c4QzuIUDvmF
 STrkId4fhhSh7OgN7glW3p7D8PtVtBBYjikzjc2eF0Bck9ZVvuyPvyPDh5vrNcrTmeo7
 CnJSHBr8xV/M886Ej4lL0lrbio6aW+qIwXNNgDH73GhltP3mG/prclZViHJLoOKgCu4U
 EHDg==
X-Gm-Message-State: AOAM530BlhzutcV7+Ft9lE9Scwce6j/bPQ6/ikZCH/K63AEUhk8SqZu+
 +lcRDddSBS5E6p/I/Q6RQI4=
X-Google-Smtp-Source: ABdhPJzhZho7v0iBKzVWkaCF+D5/fnmu0nCJ1sZyZl+vvZighIoY9emIsRGfaHg7xD4w97d7jSMMDA==
X-Received: by 2002:a17:902:ff13:b029:129:9a0b:c2dc with SMTP id
 f19-20020a170902ff13b02901299a0bc2dcmr8341242plj.45.1625625385504; 
 Tue, 06 Jul 2021 19:36:25 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id r14sm20589446pgm.28.2021.07.06.19.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:36:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v2 0/2] fcntl: fix potential deadlocks
Date: Wed,  7 Jul 2021 10:35:46 +0800
Message-Id: <20210707023548.15872-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

Sorry for the delay between v1 and v2, there was an unrelated issue with Syzbot testing.

Syzbot reports a possible irq lock inversion dependency:
https://syzkaller.appspot.com/bug?id=923cfc6c6348963f99886a0176ef11dcc429547b

While investigating this error, I discovered that multiple similar lock inversion scenarios can occur. Hence, this series addresses potential deadlocks for two classes of locks, one in each patch:

1. Fix potential deadlocks for &fown_struct.lock

2. Fix potential deadlock for &fasync_struct.fa_lock

v1 -> v2:
- Added WARN_ON_ONCE(irqs_disabled()) before calls to read_lock_irq, with elaboration in the commit message, as suggested by Jeff Layton.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (2):
  fcntl: fix potential deadlocks for &fown_struct.lock
  fcntl: fix potential deadlock for &fasync_struct.fa_lock

 fs/fcntl.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
