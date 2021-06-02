Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515E3C4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 06:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0393E61028
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 06:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0393E61028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87C960770;
	Wed,  2 Jun 2021 06:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1Vj8UTfU8nE; Wed,  2 Jun 2021 06:36:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3307606AF;
	Wed,  2 Jun 2021 06:36:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B91E3C000E;
	Wed,  2 Jun 2021 06:36:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7799C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948F2606CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SY2YYKg4wc_W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:36:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79CC2606AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 06:36:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bn21so1215191ljb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Jun 2021 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eS6pOihuo7Ou7UjCgqCJ2CubQpFcf68kQGYUNz24N5M=;
 b=ON417YzwIsuAf7bjBN5scR+beycCpyYg4V06Ij2KZiaRpZmj2sO0Dp5xeWdqui7n2h
 G5HQjVsInVOkt7ZERv8O5jqpnTdkflzvVGO785O6ps0G5eDAjFVpGM+4pHfP9G238gF2
 YzsatM/gjdb5o0j3dHgRYfHjYb+IEi0pZi4wqQiaO5OK82PHdAebkBEJaZ9f2kK//VOd
 gdh8X9DF1KlBgJlfFq2tawFQABez+nvLWokLCZxrdBSBN8CahYxj8oPeUD8XpaFCogs5
 eYgAM0janiiiEwSWvROeBUiD6ewSNbuBZaWStqde5cUlfY8LspewWcr/mU/VOwesvWy4
 T7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eS6pOihuo7Ou7UjCgqCJ2CubQpFcf68kQGYUNz24N5M=;
 b=QeFOzARv/dseNm8zmn6rLDb2F6z+/cYsc1/olPmaEav6uYtw7n4zAioBDkb4LKtqsm
 81Cf6enJWfWIRvVbf1WzBaJLZE/tyuuS1HQ/4LNwjGc/XWGusWB7i20O3Lf5lt/nSqD3
 vaxSSuo73FaYCpkD+OqlodJeDkDSNGItAq2d8zwF+jAPJy4MkzjDHUEO/XDARKDOdhdc
 qXV4gG1SJJJhcptfBvw/oN9hzZL5SORQCDrchUjHkBwTUbtPRxFLzyqpATZ4/TwqZV1S
 vRcidGYa9EGvayo1WM8LI6VItATGQALNpPXhTtZX4Kszsi9S0EPYTIoy+MNHSMP9xqpN
 8UAw==
X-Gm-Message-State: AOAM532yTasfwJOSU4z9dpXMw/77hT7vfEk7Nfb0I9beZywoHZR65Lkh
 SpDCUHCHoBI8Tyk97St+c+Q=
X-Google-Smtp-Source: ABdhPJwYwC7pTukEjdH9bkJTbwHqhIvsozTFVuKKuKMxcenxqd38qi2Hh1i6qYikElaDnFcbAAyTNw==
X-Received: by 2002:a2e:9182:: with SMTP id f2mr12958177ljg.223.1622615808329; 
 Tue, 01 Jun 2021 23:36:48 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
 by smtp.gmail.com with ESMTPSA id w23sm2408020ljh.126.2021.06.01.23.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 23:36:47 -0700 (PDT)
Date: Wed, 2 Jun 2021 09:36:45 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Kurt Manucredo
 <fuzzybritches0@gmail.com>
Subject: Re: [PATCH v2] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <20210602093645.47501d64@gmail.com>
In-Reply-To: <YLcgrGQ0phBpvHxQ@kroah.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
 <YK8gM6LoV8q8AkhE@kroah.com> <12537-32529-curtm@phaethon>
 <YLZVnNNAkAQFvSm8@kroah.com> <16463-26867-curtm@phaethon>
 <YLcgrGQ0phBpvHxQ@kroah.com>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, 2 Jun 2021 08:09:48 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, Jun 01, 2021 at 11:28:00PM +0200, Kurt Manucredo wrote:
> > On Tue, 1 Jun 2021 17:43:24 +0200, Greg KH
> > <gregkh@linuxfoundation.org> wrote:
> > > 
> > > On Tue, Jun 01, 2021 at 04:33:09PM +0200, Kurt Manucredo wrote:
> > > > Fix shift-out-of-bounds in ___bpf_prog_run().
> > > 
> > > How is this "fixed"?
> > > 
> > Fix shift-out-of-bounds in ___bpf_prog_run() by adding extra
> > boundary check in check_alu_op() in verifier.c.
> 
> Great, say this in the changelog text.
> 
> > > > 
> > > > UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> > > > shift exponent 248 is too large for 32-bit type 'unsigned int'
> > > 
> > > What is this from?
> > 
> > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> 
> You should provide this link in the changelog text.
> 
> > > Any reason you didn't cc: the bpf maintainers and developers?
> > > 
> > Yes. I send them to you, the mentees mailing list and Shuah, first,
> > for review, comment and help. Is this not okay? 
> 
> Ok, didn't know what you were wanting here, you can always ask
> questions like this below the --- line of a patch.
> 
> > > > Reported-by:
> > > > syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> > > 
> > > Does this pass the syzbot testing?
> > 
> > Yes, it says 'OK' in the 'Result' column at:
> > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> 
> You should also say something like "passes the syzbot reproducer test"
> in the changelog text as well.
> 

Other possible way to tell maintainer, that patch was tested
somehow, is to change Reported-by to Reported-and-tested-by tag received
from syzbot. It might be more nicely :)



With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
