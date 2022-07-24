Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56537C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 03:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB94C84695;
	Sun, 24 Jul 2022 03:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB94C84695
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LsldSwyv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoQogq-c4r3U; Sun, 24 Jul 2022 03:45:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D2C8B84661;
	Sun, 24 Jul 2022 03:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2C8B84661
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6D0CC0033;
	Sun, 24 Jul 2022 03:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 044A5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 03:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAB9D84670
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 03:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB9D84670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luVtBy-K6vA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 03:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0237A84661
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0237A84661
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 03:45:38 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id r70so6389423iod.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 20:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urdOpy9asLw3Y6MlWSHoFWdbz6150EOdUC7TdYBaBuE=;
 b=LsldSwyvy+YhsmguyJks6+5wlPrp4WItiFSfIL1Vjp+D33iw4UekGa9I/D+fSLB4VG
 j7jPHJWrjbxipCBmPxShuRBFINBE24/iMBsIIoA/aMLAPPpNjasZJu3rrVMdIfmqQ6L8
 ZY5llKN3UaNPFBeyfnQsPIgcvNlI81fippMTadgMZfNySakXYqLrIxGKvK6WJqcemNoJ
 Cv8vJx6gqiyrZQGVvoL2Bo4jyRbF9l77M0ODMLcGu4lUhYKu5CnRgutqt3bkYpG0kwTx
 Ed6NoKFDzuim6Lu4/f2/fAQM16/I0181UQy/0NdSi74OmhhB0K/DzZx2V/DvHtD9ohCQ
 jcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urdOpy9asLw3Y6MlWSHoFWdbz6150EOdUC7TdYBaBuE=;
 b=fJdRC5vcKHuaR84FmYhI1WXIEJtG1WbpteFnF4vky4CjzgmfdBlWJzzKBH1JXBXYxL
 cNZ98sNdrUXaLaWZMjADXc9HgfksUWzcZWUCKlB87HEafa3+Wal1R/kCJ3HQ5EASIVGc
 kjwaeOwJVMtVh322+n9vgUv3TbIqarksTtTrqvg2YalqxcvXxryN8yWgbyo48WvQ1vGK
 EO4oFVfCG+YaL5n4OR0lFTlMsqSrInVt0ey2CBtQPbvFTNUIA/xEOMkps2aQOqkFjRx2
 z0JBpKJkgomjCuFxaRLHq2Ry4eoELqMU5LuBwHdXAkJISLE1MccabbBiYTvLByHYqn0f
 Gt3w==
X-Gm-Message-State: AJIora9p8mrtmIQAjBG1CXVy0tCJwxndzm56v2fHbYOz/sxbtNznup0I
 K/DL4tAQX/0CDlIqhPv49UQFYD2M71EWpTdYQKQ=
X-Google-Smtp-Source: AGRyM1v7iy25GYE3XYGsRD0mZ/puTi9gGiZl52cB3A4p9UEHjE5y8TJgmOjaRPS9Y/yajSX0p3Tsex8/S1SqQWLXJAI=
X-Received: by 2002:a05:6638:16cb:b0:33f:8871:1b5c with SMTP id
 g11-20020a05663816cb00b0033f88711b5cmr2717685jat.11.1658634338052; Sat, 23
 Jul 2022 20:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220723135447.199557-1-code@siddh.me>
 <Ytv/tUrdK1ZTn4Uk@kroah.com>
 <1822b76775c.69c52873236056.4849193904753307696@siddh.me>
In-Reply-To: <1822b76775c.69c52873236056.4849193904753307696@siddh.me>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sun, 24 Jul 2022 09:45:27 +0600
Message-ID: <CAABMjtEHCy=YcfqYfsQdqt9pWHHRoOLYHiRCsj8HjZVfAOB+6A@mail.gmail.com>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
To: Siddh Raman Pant <code@siddh.me>
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

On Sat, Jul 23, 2022 at 8:29 PM Siddh Raman Pant via
Linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
wrote:
>
> On Sat, 23 Jul 2022 19:33:33 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> > You should not use #ifdef in .c files, it's unmaintainable over time.
> >
> > thanks,
> >
> > greg k-h
> >
>
> I used it because it is used in the same way in fs/pipe.c too (please check the
> stated line number).
>
> That, in turn, is because `watch_queue` member in the `pipe_inode_info` struct
> is defined that way (see line 80 of include/linux/pipe_fs_i.h), so I am forced
> to use the ifdef guard.
>
Maybe, we can use the IS_ENABLED macro here to avoid ifdef in the .c file as
suggested here:
https://www.kernel.org/doc/html/v4.10/process/coding-style.html#conditional-compilation

if(IS_ENABLED(CONFIG_WATCH_QUEUE)){
     ...
}

> Thanks,
> Siddh

Thanks,
  -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
