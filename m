Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97FEC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 11:38:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15E2207E8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 11:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OugQUVzj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B15E2207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 804C587FD6;
	Wed, 29 Jul 2020 11:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1bdxoOVYKDu; Wed, 29 Jul 2020 11:38:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E0B68677E;
	Wed, 29 Jul 2020 11:38:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10F8AC0050;
	Wed, 29 Jul 2020 11:38:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0F25C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A969A87FD6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbL1RoeEhZxY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CD71C8677E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:38:27 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u64so21767193qka.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kq86ugZ9Kh4uvA8FGJVxsQ+ntooQ4buHazTmCg4C02E=;
 b=OugQUVzjgJHFzjAaY04UeeW/f2lFj6q18wj/s6NeyGmXMYVBGC3HBg8OANBrExC4pu
 mWq6CmVr+2tY6l83HfJlAquylDRJqXkr01Lakt5ttkOPv+Mdbklyze+Rnjzizv2n5eia
 m1vbgF3jlB/ICPiYPKySvDDOz/sNBONWbBt/gc2rpwKTmudPpoTaZzGmMRhDX0B8/DxY
 u/cUVpQJv+HdEJFGzwy1A8HPtWVTPNrXGuVebR8iwrcHfjeWw9OsIstqAF0+cC/ExnE2
 Kyg92WKivbuwrRp+tV+CWLkWbJHWz+TvANJu8/mfMVq3nR9Rc5WoVu9te07DnWGPYuwb
 Gcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kq86ugZ9Kh4uvA8FGJVxsQ+ntooQ4buHazTmCg4C02E=;
 b=Gh5EbHWmL4be+RPrOez99i3lHryKeYhDUhbKtiy1OFpDjnMSbsjDEUzeWOzEVUzf0a
 1x04UhKsQc7NP68tJaB8Ae61l+STk8k6J6O6LbiPibnBnSQ/CSvOuDZI+yMiVboXZfgk
 SaVvNASOrNGNk+lCm0JWy/S3qLpRVybcTzthqzwQo+iOsQP6t3/m/LOns2ieYsf68YEO
 SmotIErCecHDl3LGD9hpDMSGgzMkNg1d3DhAU79s/cvMFX3hV9AEuHxjXvY5CVfOZHO9
 PIa1RIOmibJu5oI6elehDTZNupku/jnvbcrfFxriknH1Ic+36WcHaAGy3fqCUHBn1Xp9
 6Y/A==
X-Gm-Message-State: AOAM530u0Z3ErZRoaTz/nYMjXnZHwJaK4M7b9P+1D0jg7dJ42jWYw2ti
 Puw1MWvtM+JWPJo1c58JVQ==
X-Google-Smtp-Source: ABdhPJw9BUCTIZt9eRkU3uKUsVVckjWP0KInvHs1YXHSPKjeWDir27IpG2UJ4zddVfZscf1Vj3OQnw==
X-Received: by 2002:a37:4048:: with SMTP id n69mr30825844qka.421.1596022706871; 
 Wed, 29 Jul 2020 04:38:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id k134sm1377330qke.60.2020.07.29.04.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:38:26 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 29 Jul 2020 07:37:12 -0400
Message-Id: <20200729113712.8097-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200718231218.170730-1-yepeilin.cs@gmail.com>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2 RESEND] usbhid: Fix
	slab-out-of-bounds write in hiddev_ioctl_usage()
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

`uref->usage_index` is not always being properly checked, causing
hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.

Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
      Dan Carpenter <dan.carpenter@oracle.com>)

 drivers/hid/usbhid/hiddev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 4140dea693e9..4f97e6c12059 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -519,12 +519,16 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
 
 		switch (cmd) {
 		case HIDIOCGUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			uref->value = field->value[uref->usage_index];
 			if (copy_to_user(user_arg, uref, sizeof(*uref)))
 				goto fault;
 			goto goodreturn;
 
 		case HIDIOCSUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			field->value[uref->usage_index] = uref->value;
 			goto goodreturn;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
