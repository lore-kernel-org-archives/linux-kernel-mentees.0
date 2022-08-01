Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08982C19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 16:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 812CB408A7;
	Mon,  1 Aug 2022 16:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 812CB408A7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bKc+Xzrg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCTZtVNyZe5Q; Mon,  1 Aug 2022 16:16:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 547084029F;
	Mon,  1 Aug 2022 16:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 547084029F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 231E6C0032;
	Mon,  1 Aug 2022 16:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF6C9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 16:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B628460736
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 16:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B628460736
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bKc+Xzrg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKIl7I0iYfMF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 16:16:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C55296072A
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C55296072A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 16:16:45 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id w10so10942823plq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Aug 2022 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DyQ9K8ymMDEzTjm8+aouou/83gQAMkkB40Lq7COAi90=;
 b=bKc+XzrgkCFZiEUbnAS5/FO+43F/9SjycwR/YkYtA5DisTt0Do0fsQg6bF49bGnGd9
 YA0a3vSXT4RPvmr8zpb5WPNfsG11qdnVmP5H+cZ4kmPs3GXxtQb13FmSs/fqFOEBXLQH
 anlVgMx+bTF316hXTuS3rispdu1AK1ZbEhokhVLNBAJzU62ck1eKyaEuoND5XoMx50Ig
 gcveZR6kzZRu20VjweEzzurVLn1Mf5i49vnaK7i1JyiV4ityVX4lsHE7wg3cWc4Q+j6S
 6NvGPsgenWjJdFEmu9Wk4wB66TR//iFiNIsncnefryw8HBT/ThlsXMA7A+daWK3oj587
 7/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DyQ9K8ymMDEzTjm8+aouou/83gQAMkkB40Lq7COAi90=;
 b=a6WoKwQ6m3FAxzk4yrGXODfwj6fj/dpI5SigMAIbd2WP4smmAV1wLslcHpq+psCkZh
 3wIrGFUGTYoxl+CL1+7EWYAbGNWIsKqPCnS2AyEPz0nlOp+o8sBmQnP+JPemnMWTftz6
 lw1Y2dXDUWN5o7aTeEj+d7hblqEamwglOaETAW8SDWM3og3Hq7Wm7lTE2cBcXUQh+hoO
 tjHIPXrZXXZPTPo5KsD/v+ETLKEuZCX/zXt1emytbDB8CvRZ49nHfwDYrpx3kFKLlcYo
 M3quLDJJUlhZv0kCdMcUzk8Q/gm4JUYH6nt7OgzoMjkWLKUTqF2hAk2RPX9lmzMghZvm
 Oinw==
X-Gm-Message-State: ACgBeo1DHUl50fHnPPjJvBYe5YKQzIqJVDUnRQbjIAo8yZiktS9RBz/Z
 5XCTJBtZkfK85ufoQGotRFk=
X-Google-Smtp-Source: AA6agR5WQHS2QRnUdDFKIXQxlmyPnqxXuPRAoKSIJNemA2+P+CYErRyt7sfsSAhSbAbcAFNBb+Sz3Q==
X-Received: by 2002:a17:90b:4b81:b0:1ef:cd2c:bf2e with SMTP id
 lr1-20020a17090b4b8100b001efcd2cbf2emr19492079pjb.137.1659370605031; 
 Mon, 01 Aug 2022 09:16:45 -0700 (PDT)
Received: from berlinger (berlinger.seclab.cs.ucsb.edu. [128.111.49.72])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170903204b00b0016c27561454sm9671277pla.283.2022.08.01.09.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 09:16:44 -0700 (PDT)
Date: Mon, 1 Aug 2022 09:16:42 -0700
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <20220801161642.GA1932489@berlinger>
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
 <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
 <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
Cc: Eric Dumazet <edumazet@google.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Mon, Aug 01, 2022 at 06:30:58PM +0530, Siddh Raman Pant wrote:
> On Mon, 01 Aug 2022 18:28:25 +0530  Siddh Raman Pant <code@siddh.me> wrote:
> > I now tried the 5.10.y branch of stable (which has v5.10.134), but the
> > reproducer isn't triggering the bug for me. 

Are you referring to the reproducer attached to our original report?
https://lore.kernel.org/all/CANX2M5bHye2ZEEhEV6PUj1kYL2KdWYeJtgXw8KZRzwrNpLYz+A@mail.gmail.com/

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
