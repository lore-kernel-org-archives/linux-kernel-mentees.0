Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9F4C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:21:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A75C20BED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VEIIt3Va"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A75C20BED
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9CB072E261;
	Wed, 14 Oct 2020 09:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pz79pLt3iJig; Wed, 14 Oct 2020 09:21:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 767912040F;
	Wed, 14 Oct 2020 09:21:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A3B2C07FF;
	Wed, 14 Oct 2020 09:21:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1920FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 04BC987635
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9+hF1uG9lf7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C777087674
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:21:25 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 13so1188819qvc.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 02:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L265hO+6LTFxz9syvmCNLCufZap9fPFZQ2DL2SZ02Mk=;
 b=VEIIt3Vamkns9tops9IS6lOqny2BPlLYgQxjW9xUJtOJ3oYgF9c47obSShNu0bgCmD
 9oU0oTsC63NovnBnjXFpkYCF4CQIP/GnAhdW5NLPbskRN2dSXWUj3zTm0rini1AQo31C
 Vi9zRv2NFNSWMH8tOUW01OwzM09NsSVGC7WRuhsDm0pc2tjqsi8F3/4KVoXD6mBNiJZ4
 03ZsLiCrDf8FDl8Y00Snlq9j19Z/FqpmISbQ0Hs+5+LuzxKwz74xmePC71Gk355+ML7G
 hE4pc93u6KBy6T022XHRTsgDB06RHGtCYitVNckWOr6nppNX0rf/6CjEbFLvLEHaAaMj
 rLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L265hO+6LTFxz9syvmCNLCufZap9fPFZQ2DL2SZ02Mk=;
 b=cscibfBJ1f9v/3hK7yjBawpxSsBAdCqvsjNpcrQViDRsbSO3PAIrCSDxBsKgj+kCIV
 hd/VWGbFpjlE+lbgxLOcvXdr5AT6O5+yk6kqzvn0n/mgdWP1wg/PGM6Mi3q1mf4iXnBQ
 dS6XtMMv2qSPsiYWka6Brvc0+CoXEPvlw8yxFN2/g+MqmEgEIIDrF5WdxVKHMMYZxIwc
 dk9CFYKHdlRgbTGM4uphD690Q+5h+oV064mvRP0XTUdu5VGpo2sEIHb9LS1tS7VqkV30
 S0y58Fmg/kzkeX50gb2aB+eJ9Fqq5Ests+Tr+jlRmcMxhRN7eD0iB2InPpYltaJDPZ0U
 l4pg==
X-Gm-Message-State: AOAM530c1TajAv3Fg97CKW848I+IfX4O9WThE1kYbhyhL7BZLWNthn23
 /354U5xYy4g5t1YpDX+C2+WhhfkIu3++ttSOms+U+g==
X-Google-Smtp-Source: ABdhPJxMw6F0JWycPVFUSX0ecDAOun+jBIbAZOP2t0i+smWNsDb+stmC+wL7MCa5sjddk+H68xOp1cnAsBOj6pdRl60=
X-Received: by 2002:a05:6214:a0f:: with SMTP id
 dw15mr3808318qvb.44.1602667284569; 
 Wed, 14 Oct 2020 02:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
 <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
 <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
 <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
In-Reply-To: <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
Date: Wed, 14 Oct 2020 11:21:12 +0200
Message-ID: <CACT4Y+Z867EecgQZYd49nWr75f-JcPA7pYAJvu1tOZi9JwaQvA@mail.gmail.com>
To: Fox Chen <foxhlchen@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] KASAN: slab-out-of-bounds Read in
	squashfs_get_id
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Oct 14, 2020 at 11:13 AM Fox Chen <foxhlchen@gmail.com> wrote:
> > Oh, from groups. Yes, that won't work for the kernel. That also
> > generated an HTML email, which is generally not welcome on kernel
> > mailing lists.
> >
>
> Got it! thank you!
>
> If I miss the original email, without using "groups", how can I reply
> to the thread??
> Apart from manually copying/pasting the content, recipients, and
> setting in-reply-to, Is there any convenient way??

No, unfortunately, no convenient way. Nature of email-based
development workflow.

I think I've seen some web archives in the past that allowed you to
forward an email to yourself, and then you can reply to it normally.
But I don't remember where it was. Maybe you can find it.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
