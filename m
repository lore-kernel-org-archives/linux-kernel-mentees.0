Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30BCC2D0F3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 17:22:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE8720719
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 17:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Sh/ZzqZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE8720719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B77652041E;
	Wed,  1 Apr 2020 17:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0IjwPyEcyNI; Wed,  1 Apr 2020 17:22:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 18BB1203E2;
	Wed,  1 Apr 2020 17:22:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 036CAC1D7F;
	Wed,  1 Apr 2020 17:22:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE541C089F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 17:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E2FF2041E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 17:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-u5vbk+V9TA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 17:22:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 70EB0203E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 17:22:29 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id g7so674763qtj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Apr 2020 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=xTRlV/+OJrlZT0JK0WxSLE6AeDjc28F3deBsYW9Nn18=;
 b=Sh/ZzqZ+gIp2imFS6l85/eOVYyu0fnjpakqSuVDeBHB9HZgzzJE9Mdpu8huO5OUpT2
 /Jt75OewJHCjiqkJGzWJs4hSrGbGk44VJuGXQxvfNfYje3JSD/6aooOizJdXfkh+1BkQ
 9YVe57gMiD8kiYIqo4XySYo8X3CnANAPnqJp8lYVtYtHTiXQrBmsJHLxjHfAKKLFCRWZ
 JqnFjoDySrzIgEoMBdFYYvFFJJcx2lBfHRy3WQH/xW9UJmkDSBSGfMdIZ0RMgHBA3t/i
 Jg6zr1XKzxat13iKDv/x2NBBwKxLwYax/aRezAdh8g3XBoJyNnHis3lWlV4vR8oHxbbq
 Zibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xTRlV/+OJrlZT0JK0WxSLE6AeDjc28F3deBsYW9Nn18=;
 b=FqClCj/M9ImB/MFFu559vzXye0z2Xu77fVpy1G+xyKf1WXhTyxb6DloHjeDx73I0oU
 4pUfpj+6b3pZrnoO6n1JtlvAMHhgFXpY0TRNGrv9G7QqF4UsO/TM7+GBv7X3LpNlOlpX
 4DJcMl4bdPfc/qbVZ2dhUtb+mtWQf8PVkUfea8+wIs1TjMhrVHMy0Dc5bJO8C0ayTwv2
 +xcOzvYhcK+d8sOWcu1bee2hCHnes9zYK/m/O6uhu6FSE9MGrr+TxrL9g787b/hdNQh9
 5DS2mSnMf2oDYXwRSaP3zoj1yOxckb7OBE8y9GmwWe1QCtrCS9JcHDvotI6C3jufby2h
 6MXg==
X-Gm-Message-State: AGi0PubG+5kJO+2/x4ZArzYEL2SYtP0jI/H6tGOKBoD0vUEthcHT6YtF
 hDx4poiBFINTca7K9z/iJcLkbg==
X-Google-Smtp-Source: APiQypK8VTn5wASrvf6hQCinJh9tWaD1/IFdVQbeVSom0dhZPO/oqNr4fTPMT4+n4w0Kk82ZKZUDiA==
X-Received: by 2002:ac8:7397:: with SMTP id t23mr676471qtp.196.1585761748385; 
 Wed, 01 Apr 2020 10:22:28 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id c27sm1825241qkk.0.2020.04.01.10.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 10:22:27 -0700 (PDT)
Message-ID: <0b87192534e3b792cbefe0fb5ef771b79ee0f050.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: bjorn@helgaas.com, Jonathan Corbet <corbet@lwn.net>
Date: Wed, 01 Apr 2020 14:22:23 -0300
In-Reply-To: <CABhMZUUqERRO-4EWabuesK5+ZQNzOFQmaND-tw7j4q5D8UX33g@mail.gmail.com>
References: <cover.1585693146.git.vitor@massaru.org>
 <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
 <20200331165707.7c708646@lwn.net>
 <CABhMZUUqERRO-4EWabuesK5+ZQNzOFQmaND-tw7j4q5D8UX33g@mail.gmail.com>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>, Mathew Wilcox <willy@infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] Documentation: filesystems:
 Convert sysfs-pci to ReST
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

On Tue, 2020-03-31 at 21:33 -0500, Bjorn Helgaas wrote:
> On Tue, Mar 31, 2020 at 5:57 PM Jonathan Corbet <corbet@lwn.net>
> wrote:
> > On Tue, 31 Mar 2020 19:28:56 -0300
> > Vitor Massaru Iha <vitor@massaru.org> wrote:
> > 
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > ---
> > >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++---
> > > ------
> > >  1 file changed, 22 insertions(+), 18 deletions(-)
> > >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-
> > > pci.rst} (82%)
> > 
> > Please supply a changelog with your patches.
> > 
> > The conversion you have done in this file is incomplete; I suspect
> > that
> > you have not actually built the docs and seen what the results look
> > like.
> > There are literal blocks that you have not marked as such, as a
> > minimum.
> > Please actually do a docs build (after adding this file to
> > index.rst) and
> > make sure that the output is what you intended.
> > 
> > One other thing of note...this file dates back to before the Git
> > era, and
> > while it has seen numerous tweaks since then, it's clearly
> > outdated.  Look
> > at what's actually under /sys/devices/pci* compared to what's
> > documented.
> > I will take the conversion without it, but what I would really like
> > to see
> > would be an effort to document all of the attributes that appear
> > there
> > with current kernels.
> 
> If you do go ahead and add/change content (as opposed to simply doing
> the .txt -> .rst conversion), please do the conversion and the
> content
> changes in separate patches.  That way the content changes will be
> easier to review because they won't be mixed in with a lot of
> mechanical .rst changes.
> 
> Bjorn

Sure, thanks for the review.

BR,
Vitor

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
