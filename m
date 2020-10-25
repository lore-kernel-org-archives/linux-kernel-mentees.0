Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76FEC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 08:43:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A4D208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 08:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRwLy3nL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A4D208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A36E86D50;
	Sun, 25 Oct 2020 08:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bdu1yUMKsydj; Sun, 25 Oct 2020 08:43:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95AF086907;
	Sun, 25 Oct 2020 08:43:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63DCBC0859;
	Sun, 25 Oct 2020 08:43:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57501C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3918F874E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1DxXXDx+b4O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:43:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9CA94874E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:43:08 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k65so6828025oih.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLzorS3TcgRe0ZBnPGj0ERMoN5Ek0iJXkA9guMm2xqQ=;
 b=DRwLy3nL46RKVhP5wEmCcsJSQuZSSCU+HrydmZ0fQsT/cnaX8ID8TDU9DAkU+stR2O
 vd3qkqY29FIULYVK4QJCzyYv8XmXBSZflhWqs/c45rT6dKG8DvVmY3vutsIxOF5Jdjbe
 jP7CSHPY4DQkqYfi5LPbFPb8wb4eQOGmEFbWjyxcnBMZuYTlU6DZKjfSui0OJQRFZYCu
 ECNicMF5h78dFW6dMlejakvN8meWU/Hgtd+VzqYwrsHP3DUcdF6i6rRK3gyVFAiFp+t6
 qI4aWKIIBUfeXzvOgpe4jffrGuyrGgYizTlwYyRQ+RGbH3PFHYMVQBRzaRVswZJHpcLc
 YVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLzorS3TcgRe0ZBnPGj0ERMoN5Ek0iJXkA9guMm2xqQ=;
 b=oY1l6up0Ld6lClJxth64x1keFVBVNWbEUWl45esxC9CMHc+xbsKM5FwtIBqgQl9IlJ
 Uw3/UeWOUzL2a8lc41W4y47yhnhUhb2fr1bB9CmV7a7kN2s/XIEXQDfMuHFBxuL9VQFb
 q9pmjohJXUfDwk/oflt8km4Y8viTBKSSfuMXOe0RQjCcoMojIN1I/9sImoD4X4FpfBLy
 ZrHSoCAxlex2sBp/cD5+agEIfDTfnx0aQBAzPp9m30ifhSCnnyJscmft9zVvpB0o5rf9
 LcpUdOpX4uBmUwf4vZFPN+HiCQXh40IjuZ+cRaopTly3PR8beac8YW4ELOMnXHEohFAI
 AvQg==
X-Gm-Message-State: AOAM532oMtijRgghTSrLaPim2+++aYUkjd8KZLxjr6dDnrC++KCh1S2a
 I8Ny1MLIhyB2qdvlKHQL74PMTxTNkJMI1I+wuUU=
X-Google-Smtp-Source: ABdhPJzXIU8lyPwuASWHr3WR6PJ41ohdF+Jw64aaSvj5VBv1HjvHVgs8gqGFa8T4AyBiPxapLNu3b2pVaOBpNo2Rr2I=
X-Received: by 2002:aca:d5d2:: with SMTP id m201mr8356150oig.74.1603615387747; 
 Sun, 25 Oct 2020 01:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201025065134.21737-1-dwaipayanray1@gmail.com>
 <e96f8306d57e9a2ce7118b545db197e819e97b19.camel@perches.com>
 <CABJPP5D9ziuyPpPPyPM+n101vT1LGEjHj+JQjOhdN533t8Ud7w@mail.gmail.com>
 <80280a389782858c72fcd56a54da1a1f4153216c.camel@perches.com>
In-Reply-To: <80280a389782858c72fcd56a54da1a1f4153216c.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 14:12:38 +0530
Message-ID: <CABJPP5AY7Vm4CBhhnqYo_LWFYY6PB2fgtk6CLR3tUEV1ZJNQpg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: extend attributes
	check to handle more patterns
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

On Sun, Oct 25, 2020 at 2:08 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2020-10-25 at 14:02 +0530, Dwaipayan Ray wrote:
> > And also do you think there should be a separate check
> > for __alias__(#symbol)? I think it expects a string and that should
> > be trimmed in the fix.
>
> For now, I think you should avoid both alias and section.
>
> There are patches to convert both of these macros to remove
> the stringify.
>
>
Okay I will do that.

And another quick question please.
Suppose we have non handled attributes in one such
multi attribute macro. (not present in our hash)

Like __attribute__((__packed, __something_not_handled))

For this case, do I skip the warning totally? Or something else?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
