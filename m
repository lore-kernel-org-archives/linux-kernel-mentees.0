Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DE6C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 15:25:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68E4223C7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 15:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxSyQ6uz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68E4223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D98285DC7;
	Sun, 15 Nov 2020 15:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDvSMZ53osft; Sun, 15 Nov 2020 15:25:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6545685D7D;
	Sun, 15 Nov 2020 15:25:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42556C0800;
	Sun, 15 Nov 2020 15:25:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3A2DC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87D46203E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WU2Onh17+C7s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:25:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 578A1203CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:25:41 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id y9so12870330ilb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 07:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SoVcblrYolzjdvKO19Xmx/QazQO+v7V36xhZ+I7cpMo=;
 b=OxSyQ6uzCoBNWtr01XeBM+AfzSNTuQn1aPNTWPc31Q4z5DEtB3tLoLlcuLZcESQOHa
 icbkF8NvLtMfHDsVj/mc+vx0vJBIPoc82XTESNEQ0h6ITPmD4uIZgE0q2Xtoq53Nni2i
 WaMytSVxjmkWniIIJRP+H1okAB8u0xDLSLxAFuXey1mCkd58lzzAzZ+kamQt4RExqgfO
 Xyao7ngemgchZAd0PKVN4G9IrWpnaLREPWaqr6uf2FJv0zV37jfSiwGYIUGfp3D8Und7
 Zu8dMcmYxCKcSG7fl/Lh2/60SrH/l4oZA8ElEBuEgnpdP7cvss2ycDsen5O4YMQJzZlp
 EV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SoVcblrYolzjdvKO19Xmx/QazQO+v7V36xhZ+I7cpMo=;
 b=g81OXt5MTWa9ja4+fQyH/Cl3eMn0aitkePst9KGShoivwYVS2kBk3HvpwWDrkmwX/N
 lq10y2A9I/lOzH7F3viPWHv5FCKDDyOi4Ok/pUPPY2iOWD/8+iwHBT+XkTefoVbIZEWR
 yvrt5IgvyV4jLNVXuNSz3su1W6882ZWhVP0fLDeGZ0tfiJGyqVJuS89JNldE6zXfcJ3k
 RrvoPOvLe/qwM8Yve9fn5TF8DDgNrVaquPMcxW41ripfqk6i++qe8H7vGnMQzKxlFd2A
 tSiC0JmCNS1rI/4HqOsYOgPrnxFgt+voz8dIm68zQ8Vw9q+C3SWNj0wBR+ibwwI+hX1Y
 b0dg==
X-Gm-Message-State: AOAM531VTRvNk02BW8IuWeqXD4ntbyK9352x7clDwaAXkFKtUI9zNGyk
 oxCNJZPrZVKoIIpXbNVNS+yj+raR0begbDPU3Ck=
X-Google-Smtp-Source: ABdhPJwYLLkYPptHZOqlYnwrDC2MfL3GWlfKdVF8eANhQyjV8lJX8vfJFtrwLMHjoRCFBrqQ/qDnG0Luf6mU5cwpKeo=
X-Received: by 2002:a92:2c06:: with SMTP id t6mr5619690ile.125.1605453940654; 
 Sun, 15 Nov 2020 07:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20201112195840.5094-1-yashsri421@gmail.com>
In-Reply-To: <20201112195840.5094-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 16:25:29 +0100
Message-ID: <CAKXUXMwREFprvpSnz++U18-HCQ8k9rw8z0swUvEsTDfu2EAN6g@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On Thu, Nov 12, 2020 at 8:58 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns us for long lines in commits even for
> signature tag lines.
>
> Generally these lines exceed 75 characters limit because of:

... exceed the 75-character limit because of:

[yes, English is strange ;)]

> 1) long names and long email address
> 2) some comments on scoped review and acknowledgement, i.e., for a
> dedicated pointer on what was reported by the identity in 'Reported-by'
> 3) some additional comments on CC: stable@vger.org tags
>
> Exclude signature tag lines from this class of warning.
>
> A quick evaluation on v5.6..v5.8 showed that this fix reduces this
> warning by a frequency of 17.
>

frequency is the wrong word here. It is simply "count" here.

Also how many warnings were there before and how many after?

The count of 17 does not tell you much on the relative impact of the change.


> A quick manual check found all the dropped warnings related to signature
> tags.
>

What did the quick manual check found?
Do you mean the quick manual check found all ... to be false positive
that should not have been warned about?

Other than that, it looks good.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ac7e5ac80b58..f2369ac29d50 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2961,8 +2961,8 @@ sub process {
>                                         # file delta changes
>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
>                                         # filename then :
> -                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
> -                                       # A Fixes: or Link: line
> +                     $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> +                                       # A Fixes: or Link: line or signature tag line
>                       $commit_log_possible_stack_dump)) {
>                         WARN("COMMIT_LOG_LONG_LINE",
>                              "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
