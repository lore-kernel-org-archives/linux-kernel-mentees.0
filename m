Return-Path: <SRS0=yjWw=EH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C043C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 06:43:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B194221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 06:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jraOu0Ug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B194221FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E28287B5F;
	Sun,  1 Nov 2020 06:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wp2jJeXNSUqy; Sun,  1 Nov 2020 06:43:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D44F4879BA;
	Sun,  1 Nov 2020 06:43:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1EB7C0859;
	Sun,  1 Nov 2020 06:43:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7A55C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 06:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C68AE876F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 06:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puG+P0DzdjMI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 06:43:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 666C5877B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 06:43:20 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EACF221FF;
 Sun,  1 Nov 2020 06:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604213000;
 bh=Ojn3moHucYh45QKtJz4u/QErgzvV6zQZDP+i3fp1XZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jraOu0Ug4ZMRBgW3TlezkzZt0a9+9mTy6KseqaWfl8xGibv2UqkQH72JCFKfDPLfe
 y6ZCMnC7EK4jfWNJcwWTe1ETG/dip+Qpif1CGaRfyPwrRVPAoGaI0yAQvYeN79E6EG
 YxMMkPRuFipIpb3Uf6YDZ24F0W0ykIwPWgpHhA38=
Date: Sun, 1 Nov 2020 07:43:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Drupad Joshi <drupadjoshi64@gmail.com>
Message-ID: <20201101064315.GA432993@kroah.com>
References: <CAJ3Q+7bum=ESExRa7mcjLWq9wXGfHOrVMOFqTuwVW60DUH=87A@mail.gmail.com>
 <CAJ3Q+7a_Ddw_iUcA4ijJxuD+Vt_E2M9X+pw7=nnBeZvfhh9v9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ3Q+7a_Ddw_iUcA4ijJxuD+Vt_E2M9X+pw7=nnBeZvfhh9v9g@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fwd: Linux kernel upstream patch
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

On Sun, Nov 01, 2020 at 02:23:02AM +0530, Drupad Joshi wrote:
> ---------- Forwarded message ---------
> From: Drupad Joshi <drupadjoshi64@gmail.com>
> Date: Sun, 1 Nov 2020 at 02:04
> Subject: Linux kernel upstream patch
> To: <training@linuxfoundation.org>, <info@linuxfoundation.org>
> 
> 
> Hi ,
> 
> I want to upstream or contribute to open source. Any training or help
> provided from you?

What have you tried already that did not work?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
