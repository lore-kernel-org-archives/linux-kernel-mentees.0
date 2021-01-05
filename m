Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BA7C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:02:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362732222A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362732222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0DF4867CF;
	Tue,  5 Jan 2021 08:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYoYAjMlrrdU; Tue,  5 Jan 2021 08:02:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 432CA867D2;
	Tue,  5 Jan 2021 08:02:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D724C0891;
	Tue,  5 Jan 2021 08:02:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99255C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 84777867D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hTl6Wdi7+ts
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:02:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C9491867CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:02:43 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q137so27385034iod.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 00:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zu36LuAL9YLu9kbsc+tkeeW+oxWytZ2XHr+LgpiAT8=;
 b=aAdoMFLBicCrLzlsmqI5L80tKz5vI+XM+0nLGkGnSudg+90+CLVIQKWix/oDHUU7Fy
 zMHulbeaQnirylg/uZWJmHiYih8dltpIa9TUw84muY7M83eDrfPSA/o9MEHV4hEWc3kz
 0nll5iNWfjju08t4fHoLFVdY2dVqfLUjEdJDRd77DYhUFk/tJKWbw0g/n8wNBi9+ywt5
 uX1KsRBdcJGirS7M0yoDAQsD+EWoJ0Y27KLTo1Ki1fiLpFzrHNnKEvvoBMNVuzt+LeMa
 Yr2xtgoZ2On3NYJW0WROslRqmvNxxxzHFMjp1ADnWIZdVyU+zQMH6/GKjMWPwZRA6Ckz
 K5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zu36LuAL9YLu9kbsc+tkeeW+oxWytZ2XHr+LgpiAT8=;
 b=QzR2GcP6rSNaBI/qZFLEac7SLNHrnC/kSabTSBE5iBgnPXAGwu6GjIHlcddCNLfsKK
 jNMziFlaQlTooNgZK+3YnvHBE+AA8yadyYovZxkQWY4jZwG3YLL6RdNNkbJGsM3RrpSf
 Q5WAHeohQxt9IDGpe5fdg1qrgsuYHwMOxwMcpCR4+hXeaP+ul1AHkjAPs6u+ht55wq3M
 dJoneI5/hVX47Yy0Uw+LdWitt1/wgQg88PtDtnG8r1aYS5LGRxurX5PMZLcZu9hWSgCQ
 JeQsqpM4mzaAa2it4kF0SHgj3WCa3XXCn+iBnOKLtWJ/jiXjtV/K1J88wSf2OY5k5ze/
 i3Yg==
X-Gm-Message-State: AOAM532urdFLMNPWuUP3krLEj7sEtNAxUkLnmUoHpugFsp1F4rVejJV4
 RpMKPG3RP8Jtcg6g7FJb6wEhPM+ykHhLIrldU9o=
X-Google-Smtp-Source: ABdhPJyOyeE7XtQMXeJ3g5OKadw8azpAy6WFPY3jIRy2kZiazCkNZ/oNwHyb1lOCZQle4jC0cEWovKCOEAx0UnBcWAU=
X-Received: by 2002:a5e:9906:: with SMTP id t6mr61716933ioj.183.1609833763027; 
 Tue, 05 Jan 2021 00:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
 <20210104132536.38016-2-dwaipayanray1@gmail.com>
In-Reply-To: <20210104132536.38016-2-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 5 Jan 2021 09:02:32 +0100
Message-ID: <CAKXUXMy3XPsfUW80PyQR7KhYL=SOhncgdDzxmgZrOHQnZrfwVw@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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

On Mon, Jan 4, 2021 at 2:25 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer.
> This could result in linear overflows beyond the end of the buffer.
>
> strlcpy() reads the entire source buffer first. This read
> may exceed the destination size limit. This can be both inefficient
> and lead to linear read overflows.
>
> The safe replacement to both of these is to use strscpy() instead.
> Add a new checkpatch warning which alerts the user on finding usage of
> strcpy() or strlcpy().
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---

I remember Joe has already created a patch for that over Christmas
break; check lkml before sending this.

Other than that, looks good.

Lukas
>  scripts/checkpatch.pl | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d6a4d25b0972..0003fd9de62c 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6604,6 +6604,13 @@ sub process {
>                         }
>                 }
>
> +# Check for strcpy/strlcpy uses
> +               if (defined($stat) &&
> +                   $stat =~ /^\+(?:.*?)\b(str[l]?cpy)\s*\(/) {
> +                       WARN("PREFER_STRSCPY",
> +                            "Prefer strscpy() over $1()\n" . "$here\n$stat\n");
> +               }
> +
>  # Check for memcpy(foo, bar, ETH_ALEN) that could be ether_addr_copy(foo, bar)
>  #              if ($perl_version_ok &&
>  #                  defined $stat &&
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
