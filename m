Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DB2C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 02:33:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0914E20578
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 02:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u0v+vFxt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0914E20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B952E885E5;
	Wed,  1 Apr 2020 02:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5Ejg8HABGwG; Wed,  1 Apr 2020 02:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E5658855D;
	Wed,  1 Apr 2020 02:33:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2ED2C1AE2;
	Wed,  1 Apr 2020 02:33:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34300C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2463920493
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wc3kgaoPaZdt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:33:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 45BD62045E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:33:16 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id r5so21579595ilq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 19:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=ObKcUz2lh+VxE4tN2LiRS0G1bDw6LmON+P3aqYeVSqA=;
 b=u0v+vFxt6xrzwsayAW7iyTUISSsaWOA7pTg4LodC/ctSM+2qVvbri8xnR4v2GPpEY9
 jULrMXk5jkLdoCI/WCm5k6in3HTth8ehYd89LyFRU9R/YMnbfvPVorqaLi9/TX3EBK/m
 e77NDITGYhT8cdqmE7omxBuQrUpRll+N5OnyXJZKEm6LamV6qlMI1zgIUT9Kmjl1sX0i
 7hGSNstlL0c7EIJtZayHZdapeLhDJon8YWTssBfVzjH4QnOYGIxE0BFv216OSbpGVjO5
 Xm2X6egM99LJaeGMaZmwRdAP1xOxUvBJICOPpl7SmI1N0MxFbhDiDhObntZV0GEk/n7V
 df6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=ObKcUz2lh+VxE4tN2LiRS0G1bDw6LmON+P3aqYeVSqA=;
 b=mGOspcoMEPMBYdPv/nhwcHZSzGKBiYMFkYZxJkHgtnZXHVvN3k615yPZTi6IVuI+Vl
 /RMYS0LeR8CljK+Dih8Y5q/mV8TbHQObyljPym/AiWQtOOrsVG6EAUnDnkK3zuCSpoTO
 6dNQUe8RYg5SHeGPAy1i6foqZRHgYK3X7zm0QtjSnwekOo1b1qDex6Ro2mi04XCsMOyj
 aJ4FpETJqzfLfFMJLsA/GA2uRCYPPw1FWLIzyidhuWmye/mwJKycC9HRCDWVp5m8gIe3
 9JD7c6QSs4EVB307uFuafh6xVCIQnjpnMu5+aEFYeHeIn/owurzcTQTVpny1bLfCDj11
 aAng==
X-Gm-Message-State: ANhLgQ0kd3cxf+oNGy67IxAJk6MXoBDIszMROCzARw4ZkvxuO8J/KcvC
 RR4fYDh7eHdzNkbfpT+dXrUVlrt5RArPFRyGxYA=
X-Google-Smtp-Source: ADFU+vvnOrld9guaLnHaq4ZTqFm88JBnHchb1r1FDHWadRC4BBAALGIphAj67LR61+yFL2bxpiZuzDL4wX9+CkPI5cg=
X-Received: by 2002:a92:c90d:: with SMTP id t13mr19139568ilp.10.1585708395479; 
 Tue, 31 Mar 2020 19:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585693146.git.vitor@massaru.org>
 <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
 <20200331165707.7c708646@lwn.net>
In-Reply-To: <20200331165707.7c708646@lwn.net>
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Tue, 31 Mar 2020 21:33:03 -0500
Message-ID: <CABhMZUUqERRO-4EWabuesK5+ZQNzOFQmaND-tw7j4q5D8UX33g@mail.gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Mathew Wilcox <willy@infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Reply-To: bjorn@helgaas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Mar 31, 2020 at 5:57 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 31 Mar 2020 19:28:56 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++---------
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst} (82%)
>
> Please supply a changelog with your patches.
>
> The conversion you have done in this file is incomplete; I suspect that
> you have not actually built the docs and seen what the results look like.
> There are literal blocks that you have not marked as such, as a minimum.
> Please actually do a docs build (after adding this file to index.rst) and
> make sure that the output is what you intended.
>
> One other thing of note...this file dates back to before the Git era, and
> while it has seen numerous tweaks since then, it's clearly outdated.  Look
> at what's actually under /sys/devices/pci* compared to what's documented.
> I will take the conversion without it, but what I would really like to see
> would be an effort to document all of the attributes that appear there
> with current kernels.

If you do go ahead and add/change content (as opposed to simply doing
the .txt -> .rst conversion), please do the conversion and the content
changes in separate patches.  That way the content changes will be
easier to review because they won't be mixed in with a lot of
mechanical .rst changes.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
