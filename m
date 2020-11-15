Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1019AC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:12:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F062223AB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8j5YeKp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F062223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E559871F3;
	Sun, 15 Nov 2020 20:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5vtwgD9GNNd; Sun, 15 Nov 2020 20:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5AFC8871F0;
	Sun, 15 Nov 2020 20:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4381EC0891;
	Sun, 15 Nov 2020 20:12:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3C1BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9229886A11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PneyxHfx3ZjX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AF4F86A04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:12:20 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id e17so13237904ili.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 12:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w18Hi8SlwIC1WJ9Ypac1kq3bvWmweXF4GXoo4FRca6Q=;
 b=g8j5YeKpzKBZltpjqcQBp6jnONuZqV7Zc/vIi/FY+krSmWU0rNC8+zkUiRGdRzoUy6
 oBzbp+lmVWs5NEPg/2vk9498Y9U+/N25KvEzlfjXpyQIbIdYerl/6PjNImjR32rFxirS
 njo2UCF1HkFUuui0uEYL3S0XvNV25OnUYe8eLauFN5nuHcnvoJ45rntqH/FBRONABxpp
 N/yH0cNofGckNXkI12onEb9FH++hl/xDtypfJbgjS2q3h7cNna5/Z8cuMSeEhX8tlwNH
 bKUG9kySMXc2TDZ5e0KramU4JI/49Vmnb6yugzSl2pViLz7wjBNVu64KfRqneIIKp6na
 9Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w18Hi8SlwIC1WJ9Ypac1kq3bvWmweXF4GXoo4FRca6Q=;
 b=kNjqhxAJemwg7fYoKmSfMdTq4Qynu4rDy7D04gy6kh8Vi455GSpv601bdpaQjNFotT
 T94Kjgg8qd+C7GhAZrM1cmhQRgE6z5lM27HDm6pVPnV7Z0Ob0f0SZlVBO4TJORpbcxtX
 wdEOHTbQ7+oRzmUk8UWxigZRKbVr1XoETKoXjfqda0HigwucMKnHYEcfCLPnFU28N2GF
 tjKx/NUYKZrh4lWEQSjKuhGzsFqkL/FfYwbfdBBxGicxYHlw1yFwqWgZz/L2gyn2fWNh
 7bEbDueoY5KMfd/E83Lprg8lPi0Es1OX5umk7OyJtJJC7i4utY6C8txB4ZsEsEiMifM9
 kmXQ==
X-Gm-Message-State: AOAM5311+RxZXFGcM2ZChRJSeArqavGDgaMW8YD/rGl9maOQhiDREER4
 gSI4keXe4UrKh10DDIC1oVi4EiIC52xlCpyXIMo=
X-Google-Smtp-Source: ABdhPJxT9F1DKAyw+KpO0I1hmmhKdYEQHOBigaqJK3UA+BQ/H+5OV7dUSN1bfH4rbZ7Q97IrvpTANKb9gV6g0h1gKXw=
X-Received: by 2002:a92:600e:: with SMTP id u14mr5682762ilb.221.1605471139747; 
 Sun, 15 Nov 2020 12:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20201115171853.8153-1-yashsri421@gmail.com>
In-Reply-To: <20201115171853.8153-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 21:12:09 +0100
Message-ID: <CAKXUXMzq1GojaeHed8=8nO6sKkAsf+RNWuL0EDZrKYhqrrkkEQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for MAINTAINERS_STYLE
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

On Sun, Nov 15, 2020 at 6:19 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Checkpatch expects entries in MAINTAINERS file in a specific order and
> warns if the changes made do not follow the specified order.
>
> E.g., running checkpatch on commit 6f736909f0a4 ("MAINTAINERS: Add
> patchwork link for PWM entry") reports this warning:
>
> WARNING: Misordered MAINTAINERS entry - list 'Q:' before 'T:'
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git
> +Q:     https://patchwork.ozlabs.org/project/linux-pwm/list/
>
> Provide a simple fix by swapping the unordered lines
>


Looks good to me.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> modified commit message
>
>  scripts/checkpatch.pl | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2749f32dffe9..c9aaaa443265 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3299,13 +3299,22 @@ sub process {
>                                              "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
>                                 } else {
>                                         if ($previndex >= 0 && $curindex < $previndex) {
> -                                               WARN("MAINTAINERS_STYLE",
> -                                                    "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev);
> +                                               if (WARN("MAINTAINERS_STYLE",
> +                                                        "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev) &&
> +                                                   $fix) {
> +                                                       # swap these lines
> +                                                       $fixed[$fixlinenr - 1] = $rawline;
> +                                                       $fixed[$fixlinenr] = $prevrawline;
> +                                               }
>                                         } elsif ((($prev eq 'F' && $cur eq 'F') ||
>                                                   ($prev eq 'X' && $cur eq 'X')) &&
>                                                  ($prevval cmp $curval) > 0) {
> -                                               WARN("MAINTAINERS_STYLE",
> -                                                    "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev);
> +                                               if (WARN("MAINTAINERS_STYLE",
> +                                                        "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev) &&
> +                                                   $fix) {
> +                                                       $fixed[$fixlinenr - 1] = $rawline;
> +                                                       $fixed[$fixlinenr] = $prevrawline;
> +                                               }
>                                         }
>                                 }
>                         }
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
