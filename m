Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DE9C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 05:32:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8043D21D7B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 05:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3/z9/m+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8043D21D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DDD18638E;
	Wed, 21 Oct 2020 05:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkERIz3_eJQo; Wed, 21 Oct 2020 05:31:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F22685F72;
	Wed, 21 Oct 2020 05:31:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82E10C0052;
	Wed, 21 Oct 2020 05:31:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54649C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47F1886365
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wal4QA6YBwXI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:31:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7606985F72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:31:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c16so70155wmd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=anBy5FgjrEzHh+w/XBSkWmZULm8L6JOZrjHuLprpg8k=;
 b=V3/z9/m+dxtZONYXvcDPF0xsnlVVDeqti8mAvkUPURejQ64ycPbuewgwGs8Q8pSMXv
 kHTTUOkl+fFRNlYZ+fiuL1QUOKYL//2jcLZHUF/JRHsdjceD3TdGoTYsVaMf5W9/cfXJ
 as7ywHQp7hDBGQkMUWTkV1FkJJ7FaR1HKHCTH0sJgu5yzdDCHGfIygrIb7o3hyHkkiaT
 iuzFIXGQ7HiwYVwXSphsmn8foM9zaoBhshm/7TdafnVZfA9tKKJeX7QbXbD4adzgHhJb
 DXMqcLOtDS23D/eMqPgfV19b/RQv6nsB4GIswzRCkKNoWwkcEcbnEYbjf4peSnYIm3V+
 9rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=anBy5FgjrEzHh+w/XBSkWmZULm8L6JOZrjHuLprpg8k=;
 b=t4uVEp4PFyd5q/jN6nQTjzNVqjYJGbXl60uiOBbJRRYOieMFvKvrro3mPWXBVb5Qz+
 HwYpLJFjsRLXpZBxFj8SJYlwDw79PuqS1EmRNY+1hU0mKR1+PoEjQqDawakyz9jQxxTD
 xIo53/MSzZpkRUc/85Yv4asV+iJyan60umbIJ/rfjpV1G0C2cm8D6dhOwYpVFvft+YCX
 awd+SEzliswAeo30dVdSEIyGpmpQt8Csj6LAmh+e0w2IKWm/pnamvpOhML142m4taeaF
 KOH1OhDL6OD/EtYXyO0mLS96G/ueoPgY4w47Ip04PiDDlPy6wrH/uXHaiW1Skjq6n1cW
 nSaQ==
X-Gm-Message-State: AOAM533FU/jN235DbMKr338MuCyDpc3fUE97erFac2Wn8Id15JqEjNSk
 bQYu2qRIJQA6OOUsCxIa1nc=
X-Google-Smtp-Source: ABdhPJy4vj3FBxkm1LfGJDc0kJZoji74nW8s/oTOc3WzfwfKg3uw1kg6pJElVAgSbH/c1dy8DAfKtQ==
X-Received: by 2002:a05:600c:2888:: with SMTP id
 g8mr1645280wmd.130.1603258315798; 
 Tue, 20 Oct 2020 22:31:55 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:96c:5366:5c94:6f3])
 by smtp.gmail.com with ESMTPSA id d4sm1617782wrp.47.2020.10.20.22.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 22:31:54 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 07:31:47 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010210717460.8328@felia>
References: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch: improving comment parsing in
	email
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



On Tue, 20 Oct 2020, Dwaipayan Ray wrote:

> Hi,
> checkpatch seems to have problems parsing some types of
> email comments. Some examples I could find were of the type:
> 
> 1) address@example.com (Comment)
> 2) "Name (Comment) " address@example.com
> 3) address@example.com #comment
> 
> These comments aren't processed currently which causes
> false BAD_SIGN_OFF warnings.
> 
> Examples are:
> 
> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com
> (big endian system concerns)' might be better as 'David.Laight@aculab.com
> (big endian system concerns)'
> 
> WARNING:BAD_SIGN_OFF: email address 'stable@vger.kernel.org #4.20+'
> might be better as 'stable@vger.kernel.org#4.20+'
> 
> The earlier warning is very frequent in the kernel.
> 
> I did send a patch solving (1 and 3),
> https://lore.kernel.org/linux-kernel-mentees/a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com/
> 
> Joe points out that comments and multiple comments can
> exist at any part of email. (perhaps RFC 5322 Appendix A.5). So
> that patch didn't solve the problem at the very root.
> 
> What do you recommend be done?
>

I cannot say much of BIG value and insight.

As of now, I think these cases should be handled correctly and the check 
for: is it the same name or is it the same email should work properly no 
matter where and which kind of comment is used (as described by RFC 5322 
as you pointed out).

I might change my opinion when:

1. We have an evaluation on how many cases of BAD_SIGN_OFF (and related 
types) do we currently still observed among 100,000 commits and how many 
due to not handling comments properly?

2. We have a rough idea how complex this whole checking function will get. 
At the moment, I cannot say if it "just 10 lines of code addition" (even 
if they might be quite intrinsic to get right) or if we need hundreds of 
lines with thousand of special cases etc. (which I do not expect, but who 
knows which complexity might be involved, once we go into the details).

So, I suggest to evaluate and prototype and then we can better judge if it 
is worth really going forward, discussing it with Joeand adding it to mainline.


What do you think, Dwaipayan?

Other candidates for mentorship can certainly help here with those tasks. 
Anyone up to helping us here? Just reply with what you see you can do.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
