Return-Path: <SRS0=MBlu=BX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D19C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Aug 2020 18:01:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5CB420774
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Aug 2020 18:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbqoJidj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5CB420774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F80E88568;
	Thu, 13 Aug 2020 18:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7TyRlYdGoOk; Thu, 13 Aug 2020 18:01:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1263C88561;
	Thu, 13 Aug 2020 18:01:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B988C013C;
	Thu, 13 Aug 2020 18:01:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9A22C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CF3A288568
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQ4ZGheG+yRO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 18:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6433E88561
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 18:01:17 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id k23so8186890iom.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqddixExcqxXg35kSDFa1zhiGYKNPA0drKWc7j2/Ik8=;
 b=ZbqoJidjUcZQYtmgmM3BwzncSYNnvzHtgss9WOeClusfEYDdO++dZ7b7qBfy4D5wFo
 kFqhCXYGzKaDuX2kwl515qEEgLi9nzNCbS4nSC/xXLoLE1P3UZ9bI+jU85QTwJpzm/gk
 kT48ZJwGLiu1YnC2e08BvqR8mJzGRoDFY0Y1KwQz8ZM9qjeuodjowHeHgal8GW/PYGnO
 Fcp+39bRgQIBy8/itNSKpYnqwrm2ywcJRegcP+33tDLI3XxC+rEIkjm/7HB7I42Y/RPb
 X5zFTv4N2nyiQ8zGVkXyoO7o8+UThEcVAg3xjz8z5GxKQtdyLWAxmGHa4d5sXV6314jN
 BVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqddixExcqxXg35kSDFa1zhiGYKNPA0drKWc7j2/Ik8=;
 b=oaGwQjo/ecCVmJ1FXzlTdxYRlOLyvefxXSptWGz+36OBf7BLPZvhcZeimqrARfhMhP
 Uoa6IL+Z6KsSY0iNX4H6zk64xgMh7UGDnZNGu+CLYuGIadgrfNkvkTzulw6a0aT3Qr8X
 77kblWu9ju5akJy/DN5paLPMi6PZGObHzple7yiSPH8wVBSkZtDmjSBCb5Am9mJVvEYn
 fwInoH4itd2IUNDGw/ufrCKdDMP6E8/h8gPipwOHdRIk7JwDWIWLkwX61os2T7tD7ToB
 T5t3WYCmlaGnVZtyYq9K67Z2z3lzU8Hy53ZtMZ9/deQuEZO71IXHbVD+nqMjLQPVlAnK
 DB3Q==
X-Gm-Message-State: AOAM532i3wQ+tjzu90s3/RFprR4n64DpqQF8CTdS8flXqan96n1r9dQh
 LJZ3teMm/72iM/Najb4Hq7evyge+kqedrvr6/28=
X-Google-Smtp-Source: ABdhPJzLkmvynCvHtY2PDfJ9+YpurnZ1eeJSwDpCQM6QDdyV4O4jnNFCLIpv1Ygyg22DXPkiBxG2bv7B2Qd+Ki4e7o4=
X-Received: by 2002:a5d:9d11:: with SMTP id j17mr6174561ioj.140.1597341676627; 
 Thu, 13 Aug 2020 11:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACFir3g8CPiN=63am0aLfEU3n9Ft5+ZQ_qJUHQGqqzj96ePHBA@mail.gmail.com>
 <CACFir3jGNRKgcmdAHYDFeLJeO2mXokG5p6yc0WPS0qwCEKNJ6Q@mail.gmail.com>
 <CAKXUXMx81VxEGEzOX1zhh7ZdGsFGASVMn2Xn9e_MMXyNKjHtRQ@mail.gmail.com>
 <CACFir3giaV-hyAJ4EoQakznJ271WM9GhXv+tS3S1BvFUoLbz_g@mail.gmail.com>
 <CAKXUXMzpeUyv8b-KbcR7AAiudi_rU1W+2NyBRtZKHzk15TgrPA@mail.gmail.com>
 <CACFir3j9PvqJG8Akaa5+3CStwNhfR9JZKvXLuk-GPP9y5DXW0w@mail.gmail.com>
 <CACFir3ihTHVJjGuEuQ6DZp=QFG+-O8HVzQOK=0nOWsJ-v6C+fw@mail.gmail.com>
 <CAKXUXMyXmoeFnm2nxLUWYHL=sLCqJAdSZBaCsVPCPLscKztAPA@mail.gmail.com>
 <CACFir3jCY6kNyzr_7F+r1aRwt9nr78iiPw5b1BtnHfEu_Cxi5w@mail.gmail.com>
In-Reply-To: <CACFir3jCY6kNyzr_7F+r1aRwt9nr78iiPw5b1BtnHfEu_Cxi5w@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 13 Aug 2020 20:01:05 +0200
Message-ID: <CAKXUXMxL-jF80vhfgv7Pwy3_AGU42a7PtM_m10HMaQdHuNBW6Q@mail.gmail.com>
To: Jay Rajput <jay24rajput@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Community Bridge Klever Project
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

On Thu, Aug 13, 2020 at 7:15 PM Jay Rajput <jay24rajput@gmail.com> wrote:
>
> Hello Lukas,
>
> I was trying to compile the Linux kernel on my Ubuntu 18.04 machine.
>
> I executed the steps in the attached screenshot but I am running into the following error. I tried searching for the fix on this error but wasn't able to figure it out. I was hoping perhaps you could help me fix it.
>
> Please let me know if you can help me with this.
>

First, please do not send screenshots; my mailbox and others you might
communicate with have limited space and your png file is huge. Just
copy the relevant text and output from the terminal.

Second, please do not top-post.

    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm replying?

Third, please always CC: linux-kernel-mentees@linux-foundation.org.

Fourth, please use google first and summarize what you found when
reading the relevant articles.

Now to your issue:

You need to install the latest version of clang, which provides
asm-goto support. Check the release notes of the compiler to see if
asm-goto support is provided by the version you downloaded.

Follow the rules above and the selection for a potential mentorship
can continue.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
