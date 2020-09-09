Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51B8C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:52:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1097121D79
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lowr0Kdj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1097121D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 93C802E173;
	Wed,  9 Sep 2020 09:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xqs30e+qk4Vf; Wed,  9 Sep 2020 09:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DAC1523265;
	Wed,  9 Sep 2020 09:52:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8988C0859;
	Wed,  9 Sep 2020 09:52:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A68CDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9519F86EAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9nrqYjGsP0L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C245A86E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:52:11 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i1so2025747edv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 02:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1ogT5JHq4/PyB6IIAkr48NNGs8xe6eI+wc2wy6UpSC0=;
 b=Lowr0KdjSZe/iGkl4Zgn6tiNqpdSDpEZ1CH4jYBOgunIeQ+rllKM5HDEkBB7HMHTK+
 dP8tPOxea4sSfmkFsI9lElFW/WNx71MFMWLKFu4X1uRVlRqk8iwM1T3vqHLPzd0PS1aC
 fo6NC/IVc0m2ai/1jOTv/KdVOZOV3El969+5CVQ0alAPJ0iSo+sbNxFyXSfYkhXnSKQw
 4I/K1rfGdEFxYxJ3aezxNdpSRgI6f1ZMDFIfzSZUYXhG7Hcj6S6njc5qejtTEV9+hnzJ
 dA+4nwy7YPR3EFv3bmsYh/aQGHcauY0VdtZxYPIE6Yuwbf5vWv3ENt2ZbhIKKSjSX+Xa
 rzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1ogT5JHq4/PyB6IIAkr48NNGs8xe6eI+wc2wy6UpSC0=;
 b=M6rVWLyY1fGlHiXL4Sc2SsE7EuGbIKDAKMSRxQrDdyQVDweiGzUdEKfiEgtUyXVKA0
 e8wvUdv+WWm5s24Wbn2W6OHVtR4cFILYw2D6ycyWuK34PXhFe3dPY7OTWnwvTxfQR680
 RJFlpwt0lNKajvR9eqqIL1fYSH8+CuUPE7iCGDZoB13Lu2bUGbgAWUHbt6e6XMhiAckQ
 WopPGwzvi6+Y7xRnH8GyT8Sdr2oIfNWWtKgomYG9/mkoxlqPfhC6vRr+mu3F4mj3jRM5
 NGS4C1/2Ix/yd7DINxOj7tSgGjbYFbvDyt/VNtCC8GmShyRzaiq93rJaruTtVYwYmGkZ
 lrgg==
X-Gm-Message-State: AOAM5324qmTV8XSkG0wsshe8tO8peFot3a8KgPmqiuqisofbyEpUkvw2
 V2p84mFwqsybf2ooG0oOCIY=
X-Google-Smtp-Source: ABdhPJwoztuNpTu4zwuNWjKd9qloTBsXUUvzKU/EjObWUWbZ1/P+GGQulHUkKiSrkhvH9pXYDpWoIw==
X-Received: by 2002:a05:6402:304f:: with SMTP id
 bu15mr3246463edb.201.1599645130253; 
 Wed, 09 Sep 2020 02:52:10 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
 by smtp.gmail.com with ESMTPSA id l10sm1573144edr.12.2020.09.09.02.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:52:09 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 11:52:08 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <65d03f2a884a92f5094dc417d0bf47e0@disroot.org>
Message-ID: <alpine.DEB.2.21.2009091145130.5622@felia>
References: <CAKXUXMxBxyQ9KM1d92d0vGuaGRLe6+aVHa3s_O=E-YTq_jLPJA@mail.gmail.com>
 <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
 <alpine.DEB.2.21.2008310702520.8556@felia>
 <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
 <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
 <8802360392ba3dd9ded3999c3f57560b@disroot.org>
 <65d03f2a884a92f5094dc417d0bf47e0@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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



On Wed, 9 Sep 2020, Ayush wrote:

> > No, that is allowed. There can be of course a line break after commit
> > and before the hash, it is just that the current checkpatch.pl script
> > does not handle this case yet.
> > 
> > That would need improvement.
> 
> I have already sent a patch for handling quotes in commit messages.
> (https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2020-September/004026.html)
>

Yes, I have seen that. I do not think it will be accepted (it is just too 
unclear), but you will see.

> I have created another patch which fixes line breaks after commit and
> before hash.
> 
> It can handles cases like:
> 
> - commit
> 1234567890ab ("foo bar")
> 
> - commit
> 1234567890ab ("Revert "foo bar"")
> 
> But, my question is, should I send this as a new patch or append it with
> my last patch and make a patch v2?

Create a separate patch that can be applied independently. As a mentor, I 
suggest to first send the patch only to me and the linux-kernel-mentees 
list, so that you get some first feedback without bothering the 
maintainers and them losing patience to work with you.

I suggest to work on this patch here first and then revisit the other 
patch for revert commits you created.

> My last patch is still under review.
> 
> > I do not think that it is disallowed, but maybe a new check in
> > checkpatch.pl is recommended to make aware that quotes in commit
> > message subject lines cannot be properly handled and are discouraged.
> 
> So, should we give a warning if (no. of quotes > 4)?
> 

I suggest to implement a check if a commit message contains quotes. Then, 
we can check on previous commits how often that would trigger and see if 
we find legitimate cases where quotes really make sense; then we can 
improve checkpatch.pl to handle those well when refering to such commits.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
