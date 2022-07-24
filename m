Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20CAC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 04:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E9B84878;
	Sun, 24 Jul 2022 04:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E9B84878
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=ByFyVWEX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT4C5AP3osbu; Sun, 24 Jul 2022 04:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81AA184874;
	Sun, 24 Jul 2022 04:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AA184874
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F695C0033;
	Sun, 24 Jul 2022 04:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7C15C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D6B084874
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6B084874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbOo3YCUuUtu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:02:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A1584873
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8A1584873
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658635334; cv=none; d=zohomail.in; s=zohoarc; 
 b=FKgmmK4qST/lw4r8NbvBMwkC47maL+Vn68jcKSRRTr9yN5eVH4djyiPYot/BeAWI7wD+EDBi9zGwVl/SkkKMoqlVSAguglKUp6BsMNpx5QM/DI2mApiid5zHu5I+T1MLb8QTXwTMQ1SoFBbLyKb0/EB/4gF4ywkRVjOmCMBQWuU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658635334;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ZsIO24j3JVV1dGHrjewZL3uR5Q3eQ+kXFdkNGODCBfw=; 
 b=A59IBYy8EidnQCVDDH7KxoNqOBZ9Q+XVz8nTwAhv90pXatlvgF+kE4wvy+CQ1Rsas5pKchSzux0yU4vcY3nHW2XjhtaUf84fCLONRthl/TUI7839DZfPqFOdaBH2kEh59xjt5vx0+T0m0cWtGvLXFcJVuHFyV93l5kR3qcit1Qw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658635334; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZsIO24j3JVV1dGHrjewZL3uR5Q3eQ+kXFdkNGODCBfw=;
 b=ByFyVWEXVlIkXz4FEwz3wvsZXLYNGsn1uC9hrdpSw2a7Bnw0Gwvy5h3jGPDjGQs0
 AYebS12UWXLtXXZJB2Qv2PiSPDnIODcoFj8g/KtpZ81TMsYFDZEmOSQ2AG6oJxQ4tEy
 0RbilO/qxVyAlqRZN7ZdzUrIuIVIewzV0MxahS74=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658635323452803.7680563486452;
 Sun, 24 Jul 2022 09:32:03 +0530 (IST)
Date: Sun, 24 Jul 2022 09:32:03 +0530
To: "Khalid Masum" <khalid.masum.92@gmail.com>
Message-ID: <1822e5e8826.6da46246626262.8013427986163664185@siddh.me>
In-Reply-To: <CAABMjtEHCy=YcfqYfsQdqt9pWHHRoOLYHiRCsj8HjZVfAOB+6A@mail.gmail.com>
References: <20220723135447.199557-1-code@siddh.me>
 <Ytv/tUrdK1ZTn4Uk@kroah.com>
 <1822b76775c.69c52873236056.4849193904753307696@siddh.me>
 <CAABMjtEHCy=YcfqYfsQdqt9pWHHRoOLYHiRCsj8HjZVfAOB+6A@mail.gmail.com>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 24 Jul 2022 09:15:27 +0530  Khalid Masum <khalid.masum.92@gmail.com> wrote:
> On Sat, Jul 23, 2022 at 8:29 PM Siddh Raman Pant via
> Linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
> wrote:
> >
> > On Sat, 23 Jul 2022 19:33:33 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> > > You should not use #ifdef in .c files, it's unmaintainable over time.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> >
> > I used it because it is used in the same way in fs/pipe.c too (please check the
> > stated line number).
> >
> > That, in turn, is because `watch_queue` member in the `pipe_inode_info` struct
> > is defined that way (see line 80 of include/linux/pipe_fs_i.h), so I am forced
> > to use the ifdef guard.
> >
> Maybe, we can use the IS_ENABLED macro here to avoid ifdef in the .c file as
> suggested here:
> https://www.kernel.org/doc/html/v4.10/process/coding-style.html#conditional-compilation
> 
> if(IS_ENABLED(CONFIG_WATCH_QUEUE)){
>      ...
> }
> 
> > Thanks,
> > Siddh
> 
> Thanks,
>   -- Khalid Masum
 
I have looked at it again. The guard is superfluous in watch_queue.c (don't
need it since we are already in watch queue), hence I am sending v2 with it
removed.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
