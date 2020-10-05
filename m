Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C1CC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 17:01:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EE82078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 17:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKBkajXe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3EE82078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A6E2870E8;
	Mon,  5 Oct 2020 17:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-k++0huyo7e; Mon,  5 Oct 2020 17:01:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B9AC870C2;
	Mon,  5 Oct 2020 17:01:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2281BC016F;
	Mon,  5 Oct 2020 17:01:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DF7FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 17:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E02BF203D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 17:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgQB74NAlHON
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 17:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 48BC3204C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 17:01:21 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b12so10158652edz.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=U+d0iY8MaGL/r5LzAlJyfbfuGbSZOaxiiOtqe0biLao=;
 b=MKBkajXe3O9vD9bBlKatlzM4b+tGtBz3x/n7qMSIuBIit7dhAE54o80z5DgptLrdZw
 ewL1VueNSmgP1Hj9gh0OAXrXMGJFICeXRclm2oTltftwtOEo0kf9YZDU9XuZZ/m3u8Z/
 aLEkoCJ0J0k/XsMdQOSECDc/s4+wbYLdqJsQVyEnzbIYQOyQX/0P+DF6aby7AOBzyHb8
 t5aIljYTaCiVBwpqHP/5UcXCG6h6cnFjuqOw+N24iaLQxcaHVmuSSIsBUSq3Ieha9Imc
 xUKU9DVS45OH210cSTPDkbu8aQyCftI3wyv7D6ItVaKWy1gPcNXm8SL3af/WvoJQLPxU
 38ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=U+d0iY8MaGL/r5LzAlJyfbfuGbSZOaxiiOtqe0biLao=;
 b=fumYsXzuJ3Xhr5rem6yrmLhJINIKm0GsN+WdtCBdObtapdXv4qcANBY60FPYyz0c1S
 q3NRrIorD8DertKeFxoMPA9Y05bPuyO5LRMtlIqny90Lj5a+dEP+/LmHqzfPDf9cJBwB
 tG/51gMDrFwMyvAGxSDfIQjV/Pb26/ElqUDs95WLvAvv1cYous/YFG3EsxUtzSIPjGkV
 umqBArrjoF82G1Yg0yj1j/WIiX5//WR3pIHwzrtxAL1VkY9HN3x/TxPTuPfbtNx43D7O
 XSAS+E6lGiHuHflbKdANAIkHRI6or49+xNfNR9jhQoZfhkQ5RiJmEVCYW1JZQr++6YHR
 J0ew==
X-Gm-Message-State: AOAM532BAnM6gVRD59Z2/viePZpj2ECBH3BMDHs47YxWJrFS5NjZWfld
 fLu+csBKTftPatLnud5aGLs=
X-Google-Smtp-Source: ABdhPJx1Pp4XWyHl/TzsiVTCvYRzfE2X+TPBgCopIb60pWq/LaZeTJTQjDQyn1Mu+RZ3niHDJzd9sw==
X-Received: by 2002:a05:6402:396:: with SMTP id
 o22mr563020edv.361.1601917279636; 
 Mon, 05 Oct 2020 10:01:19 -0700 (PDT)
Received: from felia ([2001:16b8:2dcc:7300:c984:a2d0:fd72:6e87])
 by smtp.gmail.com with ESMTPSA id u9sm141924eje.119.2020.10.05.10.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 10:01:18 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 5 Oct 2020 19:01:17 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2010051755040.12029@felia>
Message-ID: <alpine.DEB.2.21.2010051900180.12029@felia>
References: <20201005095634.69713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010051755040.12029@felia>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add new warnings to
	author signoff checks.
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



On Mon, 5 Oct 2020, Lukas Bulwahn wrote:

> 
> 
> On Mon, 5 Oct 2020, Dwaipayan Ray wrote:
> 
> > The author signed-off-by checks are currently very vague.
> > Cases like same name or same address are not handled separately.
> > 
> > For example, running checkpatch on commit be6577af0cef
> > ("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
> > gives:
> > 
> > WARNING: Missing Signed-off-by: line by nominal patch author
> > 'John David Anglin <dave.anglin@bell.net>'
> > 
> > The signoff line was:
> > "Signed-off-by: Dave Anglin <dave.anglin@bell.net>"
> > 
> > Clearly the author has signed off but with a slightly different version
> > of his name. A more appropriate warning would have been to point out
> > at the name mismatch instead.
> > 
> > Introduced three new types of warnings:
> > 
> > 1) Address matches, but names are different.
> >    "James Watson <james@gmail.com>", "James <james@gmail.com>"
> > 
> > 2) Name matches, but addresses are different.
> >    "James Watson <james@watson.com>", "James Watson <james@gmail.com>"
> > 
> > 3) Name matches, but addresses without mail extensions are same.
> >    "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"
> >
> 
> Make the numbers and cases match the return value and just add which were 
> existent before this patch.
> 
> Looks good to me. Send it out to lkml for discussion.
> 
> I did not check the whitespace and tab issues, but I hope you got it now 
> right.
>

Also, remember to change the subject line of the patch to PATCH v2.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
