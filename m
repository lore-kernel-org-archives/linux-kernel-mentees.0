Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BEBC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 08:24:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C253A22267
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 08:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5QBHI5V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C253A22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A36887403;
	Wed, 28 Oct 2020 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8zwgEPDHmob; Wed, 28 Oct 2020 08:24:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B81A687311;
	Wed, 28 Oct 2020 08:24:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF22C088B;
	Wed, 28 Oct 2020 08:24:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9D85C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E27C02041D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQ6EN0Tytlcs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:23:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by silver.osuosl.org (Postfix) with ESMTPS id C33D0203F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:23:58 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id u62so4452856iod.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tiUWnKTTBIE6z2istQHqhkQIOyYkqOj5mAYZFowwR3c=;
 b=U5QBHI5VTDgc1Aweck8EYGOQGKmBh1/Ckh5dowuqPSjjhuhaKYCv915XBSoFeSdqEV
 YvXaHJ87vBzSknlG1RjVMxu4nwZmbLPA9ZGAKNdzYNP6ohC8yozTfqm46iMFxzdW90eO
 mo/P9PMu56sSvKgarc77++tErPbEfqtLY23YxjC94COJi9QjrNC8AKhR/5tkh+D29S4V
 gC5q1OiWztdBUR/9q9VVDyi44G4pO5drjnA/SJ/rXs68NupXeOf1LcdY9dfoGCb5OzKC
 Bux8bK8ihUlQlEnJ5s0VNMo/ZjsrmdgqRI5Aw5M3eTKsbi3shqYphRuRc9oryDCk+2oG
 ZY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiUWnKTTBIE6z2istQHqhkQIOyYkqOj5mAYZFowwR3c=;
 b=O2cfNyvhB+J2l3Dh48k8SF6uWh8KBZ9T+ymGixfArfK7ZovYQ5poGx7leKn6/+D7gw
 2QyWE8hPHTBMZfcTwZEcXPh036aXwmwf/dqyNXr+RtZF9DERBN9bXhJd47CVoESfSAW+
 D2XYwkm0UYXhVSViiyojwXldDVg8vyITG3psK8z6StOYYrlaTVgVirkd49p2FDZqUdJT
 oPtnnY7phJIzhH76HF8kp1r1FEj5XCxwxDIaxmSJlBhtS2wm/2907RLlRGqc2c2JTK/E
 SLfeDNOlMOlGD5y8+qVl+zwk1PfULkCThuX6qyHmeaRLknnb48gx41r5JNPlDSbS6xGe
 HmBw==
X-Gm-Message-State: AOAM532/cI7BcpbmiqFs/JK1xgniyAZmNe63uafSv9ET532iMQ2v5FrR
 ZR/U5MaYE9OE4PG7So7J1WqYwS4JVGoef2NPmlY=
X-Google-Smtp-Source: ABdhPJx5HZ47NQzqSDajeahCNK0ZtL9lPmQu/MIRvZq+/RgUfKiq05iEBj3/tFsgb5wm5WpetjHcBFgjNa7NWmj3o/Y=
X-Received: by 2002:a05:6602:15:: with SMTP id
 b21mr5268883ioa.165.1603873437955; 
 Wed, 28 Oct 2020 01:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
 <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
 <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
 <f9526bbd-edc9-8367-346c-f6b29f2c63a9@gmail.com>
 <CAKXUXMyuLhmCwR8rK-Nw2L3__5gXFcDn86fVMEz--b3Nizqa-g@mail.gmail.com>
 <ae7f0aa5-80e6-1ae7-6763-f62791982e89@gmail.com>
In-Reply-To: <ae7f0aa5-80e6-1ae7-6763-f62791982e89@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 28 Oct 2020 09:23:47 +0100
Message-ID: <CAKXUXMxv5Yw801ag6O-12--pmvoaY0yrqvJCAXvkjWvJ1bCtgg@mail.gmail.com>
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

On Wed, Oct 28, 2020 at 9:18 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 28/10/20 11:03 am, Lukas Bulwahn wrote:
> >
> > I added some comments.
> > I suggest committing for the first three weeks to create at least five
> > new fix features in checkpatch.pl and get those patches accepted..
> >
> > Maybe you can already make a list of suggestions for automatic fix
> > features that you think are worth being implemented?
> >
> > What do you think?
> >
> > Lukas
> >
>
> I agree. I'll try to be more specific on this one.
> As I have not used this feature in past, I'd appreciate if others can
> help me regarding more issues they faced using it. This could also
> help me focus on more relevant issues.
>

Look at your evaluation and think what a suitable fix could be and
then look if that has already been implemented or not.
If not, you have a suitable task.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
