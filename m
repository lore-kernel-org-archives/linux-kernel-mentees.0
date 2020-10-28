Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DD4C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 05:33:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B74E22267
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 05:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVgr9cSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B74E22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4325C204C2;
	Wed, 28 Oct 2020 05:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6I3+AlJRvni; Wed, 28 Oct 2020 05:33:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 09C76204BA;
	Wed, 28 Oct 2020 05:33:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3627C0859;
	Wed, 28 Oct 2020 05:33:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F077C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 05:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 19B83204BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 05:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfYRvXm2cjsk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 05:33:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by silver.osuosl.org (Postfix) with ESMTPS id EA278204BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 05:33:32 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id s7so3102827iol.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQL0Pt7TfsQn5pBD8pm//Y6npQs8W1HikIy1FXChZZw=;
 b=PVgr9cSRLQsC/yAqQSdV136ZltTPCP6sCUPw456ir87s5h0aphZrVxFLHK2RvMt1I6
 OZGXctwIZDYxO7ZK7X8cK5xjWMmUtgO6Ct4KuCakgT4kZGOIbL9kc/TrD2LKlYDytnnp
 EdhYu05/Yf2mhxe4cB7ghSYseTcKp/lU2ujKD7bEHpdg1zK5Xjd0Hr6vwLy4IKVPufxb
 HmPxHiiJSJA0ZkkFbXuQxiiVCV5JCG6dTat+SosbMJQYfJL+t8Hg9RUQTlb/noM+X61p
 QKjGwpxhmw3d8CZ120vWf566m8b5ZeK0cCh6kGEkKvlR768goYrdaUwrzs75sAl7NSJ4
 TNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQL0Pt7TfsQn5pBD8pm//Y6npQs8W1HikIy1FXChZZw=;
 b=gb/hfutBclMcCZoiQzjoxx4oC8miAdnyRZcDQcjG8Thm2x2OSAJOnrkO4M8JkWzTwP
 ytWvWqdnerHCRBNc40ojt0DDc/Y6AV8y06H5QlLv2bALNAbjwyL5EQOZQeUpVYmvZG77
 CXNcfwbNI1tDnN+oECJx5pxAFzoUPSJd4LU/2PwrrHj5zAZXKpNS12M/TUgYiqpqVjFV
 8oOwGdCvupMMhgNKzEWS7aTWWtbkzT6DxDdbPPtXrfQ17myerp90WnbIQAPZ11r+7w1q
 CYw5CQOQdRvAw7IKgO548jMGIKjidVjnHRx/lG006bDftVFp3tCZ8DZxjhs5kbNUpZR+
 LSNg==
X-Gm-Message-State: AOAM533aWSeI0QLUcAXw1VW+wLfXbV9Txlhcwg2Vlp9DPPGmGzNrExkv
 FfJZ9MN8AAL8IplYADUMWSCu4JLQnAjPp6tDUFk=
X-Google-Smtp-Source: ABdhPJxzy6gJ0hu/Lz19AoYiep9V9pMPr/FGNegfP/gKkTqCTsUvPAyhbdS5Z2FOlRXmtwgIiOSN43E5rLTFWLOvKZI=
X-Received: by 2002:a5e:c112:: with SMTP id v18mr4987624iol.195.1603863212100; 
 Tue, 27 Oct 2020 22:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
 <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
 <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
 <f9526bbd-edc9-8367-346c-f6b29f2c63a9@gmail.com>
In-Reply-To: <f9526bbd-edc9-8367-346c-f6b29f2c63a9@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 28 Oct 2020 06:33:21 +0100
Message-ID: <CAKXUXMyuLhmCwR8rK-Nw2L3__5gXFcDn86fVMEz--b3Nizqa-g@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Mentee Proposal Feedback
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

On Tue, Oct 27, 2020 at 6:48 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 27/10/20 1:34 am, Aditya wrote:
> > On 26/10/20 11:31 pm, Aditya wrote:
> >> On 26/10/20 10:19 pm, Lukas Bulwahn wrote:
> >>> On Mon, Oct 26, 2020 at 10:11 AM Aditya <yashsri421@gmail.com> wrote:
> >>>>
> >>>> Hi Sir
> >>>> I have made a proposal based on your suggestion for interactive
> >>>> checkpatch.pl. Do I need to add more than one task in it? Actually, it
> >>>> was exceeding the 1.5 page limit as you mentioned so I decided to ask
> >>>> and get a feedback on this.
> >>>>
> >>>> Link of proposal:
> >>>> https://docs.google.com/document/d/1GpyLzJwDkH06azgThZMnaFKvn8bwo6UI10em8weWjcE/edit?usp=sharing
> >>>>
> >>>
> >>> I added comments in the Google Doc.
> >>>
> >>> We further would need to determine if you are applicable or not from
> >>> the terms and conditions of the program.
> >>>
> >>> Also, we would need to identify which work you can realistically
> >>> commit to. If you want we can clarify these points in a quick video
> >>> chat.
> >>>
> >>>
> >>> Best regards,
> >>>
> >>> Lukas
> >>>
> >>
> >> Sure Sir. I'm free right now.
> >>
> >> Thanks
> >> Aditya
> >>
> >
> > Hi Sir
> >
> > Thanks a lot for your feedback. I'll fix my proposal by tomorrow.
> >
> > Kindly provide me some time tomorrow(27th October), for the video
> > call, as per your free time. As it is already past 1AM here, I may not
> > be able to deliver my best currently.
> >
> > Thank You
> > Aditya
> >
>
> Hello Sir
> I have re-created my proposal as per your suggestions and also added a
> rough timeline to it. Kindly let me know if you can access it.
>
> Link:
> https://docs.google.com/document/d/17ojyD17ZvcQZjP77a4eChSPKcm1iP7u_p_xmRWam1ek/edit?usp=sharing
>

I added some comments.
I suggest committing for the first three weeks to create at least five
new fix features in checkpatch.pl and get those patches accepted..

Maybe you can already make a list of suggestions for automatic fix
features that you think are worth being implemented?

What do you think?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
