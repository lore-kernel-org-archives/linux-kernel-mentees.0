Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DF5C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 16:49:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB6020782
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 16:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqBYNQvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB6020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AF28520C45;
	Tue, 25 Aug 2020 16:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fb-SFvTxSjXV; Tue, 25 Aug 2020 16:49:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4275E204D5;
	Tue, 25 Aug 2020 16:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28104C016F;
	Tue, 25 Aug 2020 16:49:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D462C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 83128860A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2zhwfCX80bh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:49:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD27E848F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:49:11 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q1so1534869pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOmXAx+g6AYdmKcdtOAJb/8DkoFuv5X12lGh19wTah0=;
 b=LqBYNQvYi+P0BNF3Y12On1ZZO83Cj2Ctnu1HX1scg2WJpZ2vCQ3YXvazQgyvJpa9hw
 6mAlLdbF1SqQfhzJut9yZ+Y6QsnQ7Y2J+1CK19IL/ZyLJcs3H4VQydH2SXLSI8BSuRiJ
 JKNVr2T4J6YyMvAxxwrZmOmEdBQ2FTH/lZTKYe61H9FFuRbdqTb/GlPIYixoOAIB52oh
 vRBftreDlVMP6H/8H/q/c5ss+l/2FgZAD8KtWu6eZbiLkA0KwSz0LveVpnRrrA43Gspa
 O6V+vt8vmQwA152KJ9sM8CVs7FFv4fTSBLlt/hYbILOLOcDHb+GbD8ynt5hMebg95lvH
 MjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOmXAx+g6AYdmKcdtOAJb/8DkoFuv5X12lGh19wTah0=;
 b=e5pley1sdeyegSPzdj14ByaOkqvyK+u95YotO65acmc85G2ueU4TF1IlflZQ4Enpm1
 Vlrqkk8RzVNW+6wCTq0pOrqN7+tpIMJstSNVzHvWHgQ6OVF4uBohUT+glEMzWnokpriX
 ObUNmU6hWHaCKmEJBfy5my25yPJVE+1MzCy/lPZWJmuYBvmDKMm0yePgrtmy4fVVCJMW
 1oRvB0MuW/V8SSV1zMB2o9o7fpMc3nhesMZuRWEFycKONBkSK8AaMgKGBHpmRBv56EcO
 p+tn8wax1yxtbP/AuBplpv0ABT/NQJM4Xwzm7jiGBabafhVBlRtkphAVN8HS0PulVJOk
 4szQ==
X-Gm-Message-State: AOAM5330VzbdvmLs00JAw7XQ+amdWg4mBqOiReEjUOmnZcCl72uXjlZm
 eVRxhOIzl7uqb+J3n+75PA==
X-Google-Smtp-Source: ABdhPJxJniaH/TLwosXRVvYOc5w1FpSJBIScyt++FcpHV0j2yRV/ev3rIRUqe6DE4jbPsVTPpLuqHg==
X-Received: by 2002:a17:90a:9103:: with SMTP id k3mr2353650pjo.4.1598374151495; 
 Tue, 25 Aug 2020 09:49:11 -0700 (PDT)
Received: from localhost.localdomain ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id t5sm3314443pji.51.2020.08.25.09.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:49:11 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: jslaby@suse.cz
Date: Tue, 25 Aug 2020 12:48:04 -0400
Message-Id: <20200825164804.860743-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200818085706.12163-15-jslaby@suse.cz>
References: <20200818085706.12163-15-jslaby@suse.cz>
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 15/16] vc_screen: extract
	vcs_read_buf_header
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

Hi all,

Link: https://syzkaller.appspot.com/bug?id=f332576321998d36cd07d09c9c1268cfed1895c9

As reported by syzbot, vcs_read_buf() is overflowing `con_buf16`, since
this patch removed the following check:

-		if (count > CON_BUF_SIZE) {
-			count = CON_BUF_SIZE;
-			filled = count - pos;
-		}

Decreasing `count` by `min(HEADER_SIZE - pos, count)` bypasses this check.
Additionally, this patch also removed updates to `skip` and `filled`.

What should we do in order to fix it?

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
