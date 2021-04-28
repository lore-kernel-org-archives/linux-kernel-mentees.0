Return-Path: <SRS0=jYeA=JZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC85C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 13:23:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 369AB61151
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 13:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 369AB61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC5ED605F2;
	Wed, 28 Apr 2021 13:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkIZCP6vNWyr; Wed, 28 Apr 2021 13:23:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A99605D9;
	Wed, 28 Apr 2021 13:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3DF9C001C;
	Wed, 28 Apr 2021 13:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85704C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 742EF403A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zn2qJTaEWzqz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:23:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BB6C400D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:23:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d14so10373776edc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:in-reply-to:message-id:date;
 bh=Qurx4YE2CnWj5SccQuHCNVHoNHHibWJ+v2DqzGf5B1w=;
 b=E5y1u8wxhoIscd78L0E+vx3KfSGA8A4qRxJ0cVBBpDUdZeIPyJCnL0Syc3dypZI0of
 E/0hJEL4YEK1OtI1vjaPjzEpMHwVE85fbB0AxmixZwCB5UQRv9xMEIR7Ozr25gpefIe3
 G8xTBwh+uGxfxYklUg6+D6inDSifQpIxA3f7QjPUoMYAB/P9ne1AcZ0BEFGXDS5WRucz
 q5rnFqm+I/Y8BLw5KQuGSowWg5gnEsskdVj98vHfWTuuoXyzBP5BXWdS72TvCWWu25vE
 LYc7zD+MIRAZ3pcLbLpZ+RlxPwO2X73mX+Wf1ASfb006CdoekLkRWIP3pZiq16HWzm69
 oadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:message-id:date;
 bh=Qurx4YE2CnWj5SccQuHCNVHoNHHibWJ+v2DqzGf5B1w=;
 b=iDFHGNFxa8wc9M3Nuh+QuqqaMVAKK+F1kqKdD8mVFjnTVUfUewj57h71rWy+3cip1g
 oCvOok1g/84mmofZ/vArtomqrIY/iUe2edrlRwP81q72FCl3pOI2xyZVn3UL1dpg5oxZ
 KXaoYZA5bipesPBCzgORcbnxlOHFJ1K/r9f+TARp3PO/z/yB/i116U1MgxBYz2qPxVdB
 Rk3MYJFPKxVNHIIlQVsZgw81LB9CWpeb7dwwVUHwKSXLrcq3iymK0vLJLx8CKZhCSx+I
 iQt0i5qqG9KCbjd7wqR3gbAB4373Tf5pqF753FCNX6ir/7zIDCdonWdgf9no8aFo5kKp
 ggmw==
X-Gm-Message-State: AOAM532eaIGY5QXjzxMVztjybPwNrHvUXOC2OPApOg/jdSYbclIuLzRA
 7TUQ7OscoGjonyKrPueXeXw=
X-Google-Smtp-Source: ABdhPJxzT3wzXUBCioXxAhOiz48mUxh5jsNaSHG9KAwUt/hLVQRPK4or3iIuIpHITtjRBjpdb9sg6A==
X-Received: by 2002:aa7:cf07:: with SMTP id a7mr7759834edy.261.1619616210441; 
 Wed, 28 Apr 2021 06:23:30 -0700 (PDT)
Received: from localhost ([83.218.172.57])
 by smtp.gmail.com with ESMTPSA id hc43sm1958779ejc.97.2021.04.28.06.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 06:23:30 -0700 (PDT)
From: Kurt Manucredo <fuzzybritches0@gmail.com>
X-Google-Original-From: "Kurt Manucredo" <fuzzybritches0@gmail.comi>
To: esmethedev@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller@googlegroups.com
Subject: Starting a Wiki for Syzkaller Bug Fixing Resources
In-Reply-To: <e486aee7-993c-e50f-f14f-aac7f701b752@gmail.com>
Message-Id: <5705-18963-curtm@phaethon>
Date: Wed, 28 Apr 2021 15:13:14 +0200
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


On  Wed, 28 Apr 2021 04:50:18 +0800  Esme Xuan Lim <esmethedev@gmail.com> wrote:
> 
> Hi there,
> 
> Having been on the bug fixing mentorship, I've been collating a bunch of
> resources that helped me as I was going. I've been thinking that there
> might be a big gap in resources in where interns might be looking and
> was keen on trying to put one together. Given the current conversation
> Greg has brought up about syzkaller bugs needing more attention, I
> figured this could help fix it if interns are the only ones available
> for this task.
> 
> I think it'd help the kernel mentees current and future sink their teeth
> quicker into fixing bugs, and less into helping themselves learn what is
> needed. This appears to be a big gap that would really help if it were
> filled. Resources are heavily abundant for the Linux kernel, but a good
> level of curation and maintained resources could help with bug fixing.
> Resources look old, but are incredibly insightful. I would have skipped
> looking at these resources given my experience with more modern
> frameworks and toolkits (which is that it would be best to avoid
> outdated ones as APIs change very quickly - but this is not the case
> with the kernel)
> 
> I've got links and things but I've been wondering if it made sense to
> build on the Kernel Mentees or to build a wiki (and host it) on
> something more modern like github.
> 
> I'd love to hear suggestions for how best to go about this, and if
> anyone would like to contribute to it too.
> 
I would love to contribute. I've started my blog on:

https://fuzzybritches0.github.io/

If any of these entries I made are helpful, I'd love to help you
incorporate them into your wiki. I'd also love to get feedback on these
entries. Count me in.

thanks and kind regards

Kurt Manucredo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
