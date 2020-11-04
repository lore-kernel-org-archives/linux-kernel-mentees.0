Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F6FC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 08:51:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10087206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 08:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uN5cwPl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10087206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 883178685B;
	Wed,  4 Nov 2020 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lagxHkzz2pxq; Wed,  4 Nov 2020 08:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2111686880;
	Wed,  4 Nov 2020 08:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11FC2C088B;
	Wed,  4 Nov 2020 08:51:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C91AFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B140587447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHAoXmvs400L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:51:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 37958873F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:51:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id x6so22116667ljd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Nov 2020 00:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDsafJWCwrLrG2/+xFl5bOz8OxK+Pcz3yiEjIfibRFA=;
 b=uN5cwPl/OnTA3voNDn3l/4URDFS0cUGOnuPXpne0LKuyX5D3iJJl6kG8HMdXcW6pEZ
 2nzn6hYLdRWuyBKlHPxLT59ZlRM7/2l0nw5a8Z2DP3IqN24PjvqytnCSlTOWaZSdCZpJ
 OmSl+YHynt+wsMrEyRk22ahNeJP2pDeoE0eRhM3hUs2tdrx/WCtnWNCaR3Hc0NF8gddm
 1vd1zoukS3qIz4/EofMiIjdqMUxYCC4AN35xSAu23MCNsGMdzVAlD3TJg9w2w9RrCQv6
 bMtArNH8BH1t/fuYvAIEB3QiU44UVTsy59bZotjLFWov50hqtl4FYRNDJVWbAS+tvYMw
 uwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDsafJWCwrLrG2/+xFl5bOz8OxK+Pcz3yiEjIfibRFA=;
 b=J59C1U1TO6Wz7BDLTem4b/mgQxymU2pXOMiY0j1ns7ZE/ClatoqLIuGaUPYjp4u4EF
 StPoCsK9ckg9b1aCNzqHF/JjAEhZtggxko1bshdglb8SCqefEOXO6ga91jq4Lk0rSsus
 vXtz1w+HcoYvZwjAOLC8zLskhil5bvo96qjKiePx0RYh3i6057vGk0RAFTtS0VfUmugL
 LQUCGAl07yweq97h5vGcxRaSTr5Qy2PppSPVNGyIAHu1nGDEx7w5LJGD7OfbiGhrxOFu
 2QJGMtrpCeiRsGlo/M7/3nmmuKdZwJIG5ERDVoOBD3ehCEhNtySA/g3tLA+szuwmi12/
 VRAA==
X-Gm-Message-State: AOAM533ST+wPHmuC/IlFiq/CxQgGXNGQCx6m2d8LSRUVHa1oEf0v1LKK
 BY3/50KznT2L6yGm056JRMkMY3EbOmE2+GosKMo=
X-Google-Smtp-Source: ABdhPJziqXgF98ch4Eh+EBdlSP4tqXFrka/+pgo8zsXxwkvQRX74u7Rayj94zlqgj2b0RdAawjn4OPjOEA4ILtb4gc4=
X-Received: by 2002:a2e:8116:: with SMTP id d22mr9644010ljg.331.1604479860115; 
 Wed, 04 Nov 2020 00:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20201103054810.21978-1-dwaipayanray1@gmail.com>
 <CABJPP5DkJ3gwZDW+FBShs3Yo8z6GfP4LSMRW4hO5hL+fVXjShQ@mail.gmail.com>
 <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
 <CAKXUXMwH+tEBSV6xA952xQQFe+HvdJ5ew6V=n63sk89enj6p7Q@mail.gmail.com>
 <6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com>
 <alpine.DEB.2.21.2011040848420.21917@felia>
In-Reply-To: <alpine.DEB.2.21.2011040848420.21917@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 4 Nov 2020 14:20:29 +0530
Message-ID: <CABJPP5AFd-i+haMCis7EUAht7hfRqB3sqCp34S=AUUsZ2aRjCg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: improve email
	parsing
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

> I agree with them as well. Let us try to establish one common way from
> comments.
>
> Dwaipayan, if you code this into checkpatch.pl, maybe you can also add
> some hints on conventions for tags in the kernel (process) documentation
> to explain the rules and conventions we think make sense.
>

Sure, I will do that.
Maybe I will start afresh on this patch with all of the above views into
consideration. Once accepted, I will try to go for the documentation
part.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
