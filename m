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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAD7C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 15:20:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2365A223C7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 15:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihes42ic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2365A223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B934C203E5;
	Sun, 15 Nov 2020 15:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dk90rM5MtdJJ; Sun, 15 Nov 2020 15:20:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABF45203CC;
	Sun, 15 Nov 2020 15:20:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CC54C0800;
	Sun, 15 Nov 2020 15:20:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD9DFC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC72186733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YT91QJYOacir
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:20:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F04BF86681
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:20:37 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i18so13229583ioa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 07:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Ro5pUm3lczX3DNtBYKU/2GRRpehlBl4eTHwyXiSTkw=;
 b=ihes42icZr/aiBDjKa6JfXRtfQK3MefiPoB0Fq8m3WKcC2hOeK4q1g0Z4MVKTXbXFm
 Gd2QJ4Wjp6wueKWgcPTFRzxsO4ijqZzlaL+E9Bc5m+s/Z14nEeHBtBoMKVYj5Tq8r8zj
 7djVY4rX459L5V17Jykx/7RqknuIBY7jxpRk2eYGfKlXkA8wwJfTenwfKHjCBKKF/QUS
 PmODd4fQ9P14NsCirWAX5WYnikY6Rrvksm1wqBJAzKJxkBcFED0XngIMcTV49cIAqHGm
 ugFJomnfFaQE6aIEN6kmRAa5npwEsSY2GO/AzQCZ3JAK4lBLjXk6gBZ2XFse8KTmyFDX
 tQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Ro5pUm3lczX3DNtBYKU/2GRRpehlBl4eTHwyXiSTkw=;
 b=Lh0UB8R3hHMDKSJQlw/pG/bee6Nxpjcd5zvxdPgS4Kfm5LemMzgtX4FKbGu19sS+xL
 v/OeO7sziraSyiJk/SADriXbC5zSiZf23lX0sKZj7fcow8y5VnsuP6YKQ9yq3DOfnIZb
 sWGi9m1P3o/wghj+BDC0hgkXjLjYaJg5FQYEofhphQ3c/KscbJ/DWcyeFxBajHJ87hOl
 nUvrNoMYBS/c3mtIUVFDexxNg5U5+N710spsjem/ivYftEytooEa+qaj0voMpJIMsp4G
 wciC2qWmsbVgRsMJkerz0qXzkK2iEH93RzaUHe3hfhwhrFcfQaY2j+ggqrEG0wMv0KAt
 2JOg==
X-Gm-Message-State: AOAM53059+sx0Av3Pl/s/iY3giwWuKaY3yN8qaPzbT/05TddOKCsvvDt
 4OI5Sa5E52jKQ+xDR4GjR5qm8nFlbctAHQPu6Fk=
X-Google-Smtp-Source: ABdhPJzyP93zH+yr9Pyl9yg8FhqhZ8Dbwhhf4Q6Cwc31nmRlK41y7432mXg4RP7yIu4fqJvEuknJXDM4109dJBbhXXI=
X-Received: by 2002:a6b:d80c:: with SMTP id y12mr5259448iob.183.1605453637323; 
 Sun, 15 Nov 2020 07:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20201115110527.12433-1-yashsri421@gmail.com>
In-Reply-To: <20201115110527.12433-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 16:20:26 +0100
Message-ID: <CAKXUXMxJDGZ9u=1ioVe=sZQi1JB5DGnTvgQ-+9x2a4CwVNz_HQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MAINTAINERS_STYLE
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

On Sun, Nov 15, 2020 at 12:05 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Checkpatch expects entry in maintainers file in a specific order and

s/entry/entries/
s/maintainers/MAINTAINERS/

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

Generally, looks good to me.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
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
