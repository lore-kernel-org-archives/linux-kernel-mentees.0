Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4662EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:31:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE862074D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+/U9hSK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE862074D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB0B887F5D;
	Sun, 23 Aug 2020 10:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tt+XV1dxD74Y; Sun, 23 Aug 2020 10:31:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24D4D87F5C;
	Sun, 23 Aug 2020 10:31:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F421CC07FF;
	Sun, 23 Aug 2020 10:31:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06BF9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E237020133
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6akjOsDzAzi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:31:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 2CA9420023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:31:16 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 144so5046573qkl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDbzfkeud0OpyxTtNDmAiCvSP/IkbswKy3+jHMZQsls=;
 b=Y+/U9hSKUvS2WpEan9PVWDrRANBzdo0Djb24wBDy39y5tyJZmGk7QPYUrCvgR1Gl2J
 SV4aDWFWauW72KmRY70NgHgtM5NEL37dvyzEFBEGaY1dInDWPSz4FmMv3woD0Wjhzlsu
 vtgl8Y9AFabNjQdLeXymU4ajH8jODvKSsFL+AM63yBM1MhS17e+tB594EwYQ0NnCtTLp
 yJOQX62xIW6gG4za5Ex4DuOHCQaAcKNYIa3SvnR826wk1HxORjdo5yjaYBcFW37W+M2O
 vCXo2SaYgNUc9gOwSuDlCzT8vSF36+RY0KTNfDBLn18LDM00swMVIdT9RWd7mOlmrNLO
 CL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDbzfkeud0OpyxTtNDmAiCvSP/IkbswKy3+jHMZQsls=;
 b=UhNsoPrgt6PgcoHBjWNKvp0tVOwba72eRTd14+u+//ORTqiGoUigGzSFc+4bRFEHhH
 qrRYJbJao/mKjKW5u40KJIC2pC3Sj1XDbdC5dZ0lGr+Z/emrEgjEg29Vcd8Gyzm9Qp1P
 uC5/aMiOOzDybmpOax5C08wCzY0S6nOfnZeSLp23liR9Iecj5un2odHrADW7eQDXPTtm
 C/eYx5OHOTQqqb5VJ5/crCzZucpZORYFHsy0zs98mhL5kDkKvRsj9ETxcyApC5XQHEm+
 c7SRI1q50efstK+78Vf2SEZy2xLNx6oFqUqee5lnLo9z73PTy6UH+IQkD/ogzfDWAw2h
 a73w==
X-Gm-Message-State: AOAM530JJTpPRnhvD2W60L60Dtxd2DmlT4Opthz8jvA06TBomcuU49Fn
 YCMxTmnmhtUHaT5amjrWZ6WsqDmp0QevEn7v3ms9tQ==
X-Google-Smtp-Source: ABdhPJzh/hGWcxdCNkfqtxg/vH7u+sVKQRyHnDarPigm5zHC/LE+3/2JsiO3In+EQ/pf4TkihzwUABZC6mK5psJoSrc=
X-Received: by 2002:a05:620a:21d2:: with SMTP id
 h18mr495431qka.407.1598178674463; 
 Sun, 23 Aug 2020 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
 <20200823101924.GA3078429@kroah.com>
In-Reply-To: <20200823101924.GA3078429@kroah.com>
Date: Sun, 23 Aug 2020 12:31:03 +0200
Message-ID: <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_cmd()
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

On Sun, Aug 23, 2020 at 12:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:
> > On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
> > <himadrispandya@gmail.com> wrote:
> > >
> > > Initialize the buffer before passing it to usb_read_cmd() function(s) to
> > > fix the uninit-was-stored issue in asix_read_cmd().
> > >
> > > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> > > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > >
> > > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > > ---
> > >  drivers/net/usb/asix_common.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> > > index e39f41efda3e..a67ea1971b78 100644
> > > --- a/drivers/net/usb/asix_common.c
> > > +++ b/drivers/net/usb/asix_common.c
> > > @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
> > >
> > >         BUG_ON(!dev);
> > >
> > > +       memset(data, 0, size);
> >
> > Hi Himadri,
> >
> > I think the proper fix is to check
> > usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
> > Memsetting data helps to fix the warning at hand, but the device did
> > not send these 0's and we use them as if the device did send them.
>
> But, for broken/abusive devices, that really is the safest thing to do
> here.  They are returning something that is obviously not correct, so
> either all callers need to check the size received really is the size
> they asked for, or we just plod onward with a 0 value like this.  Or we
> could pick some other value, but that could cause other problems if it
> is treated as an actual value.

Do we want callers to do at least some error check (e.g. device did
not return anything at all, broke, hang)?
If yes, then with a separate helper function that fails on short
reads, we can get both benefits at no additional cost. User code will
say "I want 4 bytes, anything that is not 4 bytes is an error" and
then 1 error check will do. In fact, it seems that that was the
intention of whoever wrote this code (they assumed no short reads),
it's just they did not actually implement that "anything that is not 4
bytes is an error" part.


> > Perhaps we need a separate helper function (of a bool flag) that will
> > fail on incomplete reads. Maybe even in the common USB layer because I
> > think we've seen this type of bug lots of times and I guess there are
> > dozens more.
>
> It's not always a failure, some devices have protocols that are "I could
> return up to a max X bytes but could be shorter" types of messages, so
> it's up to the caller to check that they got what they really asked for.

Yes, that's why I said _separate_ helper function. There seems to be
lots of callers that want exactly this -- "I want 4 bytes, anything
else is an error". With the current API it's harder to do - you need
additional checks, additional code, maybe even additional variables to
store the required size. APIs should make correct code easy to write.


> Yes, it's more work to do this checking.  However converting the world
> over to a "give me an error value if you don't read X number of bytes"
> function would also be the same amount of work, right?

Should this go into the common USB layer then?
It's weird to have such a special convention on the level of a single
driver. Why are rules for this single driver so special?...

> So personally, I think this patch is right for when you are trying to
> abuse the USB driver stack :)
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
