Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923E4C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:23:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0332C206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtiFeo5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0332C206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94DA7866B9;
	Tue, 15 Sep 2020 13:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJjmQOYUJH-P; Tue, 15 Sep 2020 13:23:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2845E866DA;
	Tue, 15 Sep 2020 13:23:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C852C0864;
	Tue, 15 Sep 2020 13:23:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 275C5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0FF138584A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1Vac5693hTU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:23:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 38CC88583F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:23:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e16so3342939wrm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HS6WOc7dx00pu/3nY1bGoVp8yqWB19u23njbttvM5M=;
 b=GtiFeo5K7KJEVRbbqQu8lQSpalhSoyVqT4pcqjaHnwIzf7AictAZGzIscCjCUpXSVx
 6iqy4UPCMmvzpT4a/kiB4pfTesLfOmSv52XtspA2tlv4wjVlmN06aQJoGwbmYxL3Zhhe
 xe6jfvftgPqzQSROdoKdRfYxgSMBY8Yv6agw1Wp+i8TMEGxYOlphUn8tP4zW5AbEj77W
 MTYXbv+YATiSq97Skdei5boZDFOsjLjI9jN+oqq+7rYiX0bGdXUlcyaKzu5s6iIcdqgg
 W5TTEx2mfdY/Ps0zX3HAFLLKhs1q8QMVEzDM0Gu5DKxg58ENxoy93P1EGN5woMe8yUx2
 KabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HS6WOc7dx00pu/3nY1bGoVp8yqWB19u23njbttvM5M=;
 b=kR+ejtujhCBXNUlvwBWLqceW+rSUZHPPGB2LSEhDyhOxop6CqWF9lynGu1ZBOFOid7
 9CCmtq4zqvVURjopZG2nP2F1QOhlVPWoKO1AM4675ULaHP2R1v1GG7HVPoloCL1k/XaC
 JVAIEpQQOqJIgZlOCzhl0wTA3TIoDQO+VbW8JzK66FwCVfdSBi9kKcNdDrlBkvvbj6yF
 4zqSP2h+doJ9PD+H1/wKzkcwuk2l4zUVx2c/3QAQoVC/kdPR7r6tRre9qQMahMFN5S3k
 cUChkHwLHV+4MC9bhrYvtIUQ+/gwWJ01XnEfsL/jwuHRm/mnaTHe2RrXAzvkquvCp5y0
 RPtg==
X-Gm-Message-State: AOAM533amcKMEXPYYG/K/8v88iPiD9Dki5kVe/Q2Ybdq00rOpdfLxg0Z
 QKvs+Kc6Z76my59F6NXFyv9UWZvdzqcJ5ezOLZI=
X-Google-Smtp-Source: ABdhPJxUdNd18EIryaAvQ2FTd4T5NsP4UnA0exQpFRbAR1u/hIaXDAIUGgcHv2/jSX4wdvo9mvtPe1NRr23uVubFdW0=
X-Received: by 2002:a5d:4710:: with SMTP id y16mr22182221wrq.203.1600176184615; 
 Tue, 15 Sep 2020 06:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
 <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
In-Reply-To: <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Tue, 15 Sep 2020 18:52:53 +0530
Message-ID: <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Question regarding marking bugs as
	"invalid"
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

On Tue, Sep 15, 2020 at 6:12 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Sep 15, 2020 at 2:03 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Tue, Sep 15, 2020 at 1:52 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > the reproducer doesn't trigger any issue on testing current status? If
> > > not, then what should be done about such bugs?
> > >
> > > Thanks & Regards,
> > > Himadri
> > >
> >
> > Himadri,
> >
> > if possible try to determine which commit fixed the issue the
> > reproducer triggered.
> >
> > You can potentially bisect with the reproducer on the git history or
> > you can simply look in the git log of the affected files if someone
> > mentioned fixing something related to the trigger.
> >
> > That helps to make sure we do not just close reproducers that just
> > need a lot of time, configuration or luck to hit a certain crash.
>
>
> Hi Himadri,
>
> Basically what Lukas said.
> Bulk closing all of them as "invalid" would be bad for several
> reasons. Either do some reasonable amount of degging, or wait for
> syzbot fix bisection, maybe it will shed some light. It should happen
> after 30 days since last crash IIRC. Also all testing requests/results
> are shown on the dashboard, so this bit of information is not lost.

Understood.

I incorrectly assumed(before posting this question) that I should mark
such bugs as invalid and sent the command to syzbot for one such bug.
Now I understand that it was not the right thing. It doesn't show on
the dashboard and I don't know how to undo it :(.

Bug's dashboard link -
https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7

Himadri
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
