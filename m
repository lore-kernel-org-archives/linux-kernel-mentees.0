Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BD9C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 15:18:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71622223C7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 15:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T232a3Mi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71622223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16EB886203;
	Sun, 15 Nov 2020 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMLEWguORVN0; Sun, 15 Nov 2020 15:18:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6253185FDB;
	Sun, 15 Nov 2020 15:18:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49126C0800;
	Sun, 15 Nov 2020 15:18:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A128CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 94DD3203E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLCuLhLBDUyz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:18:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B7D87203CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 15:18:19 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id e17so12835513ili.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 07:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qrSLHYa2obDZhFEI8kBdtOtSP4RkOPnQk8Oq8CzP1zU=;
 b=T232a3MiyIrurqvF+AZlqWh4SmH4gH2O4RHxnPjbQUvsdm37TwJOvKGj54Davq3nQG
 olkNQhgYkb/6AI8cYbYGKKZ430uYYAH0r0yUDF8gMOVKyGzJ98X8OItbedlkCwudx7cK
 8vii1mARlnk7dB7JNyCaDKb2/Q83rxplwxGdZy5SlNxVIWcXhA/689ICwHHcOug2cs0k
 tIi03QWZhEW78g87MXmwllJ8vDiUuryNOHYFAVRNron5Phlw0n2wJ01ChDbzEwcmPJSy
 C/WXrUxZ4uNkiNFAypuTAKmvx6E76jdOmERXNj7yVINV/l0Dx1xRUs74hOh6AIVr3Qa2
 /PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qrSLHYa2obDZhFEI8kBdtOtSP4RkOPnQk8Oq8CzP1zU=;
 b=O78haiNYfzxbHMiKEXAfCzQSsY5tszCkTlMv2NXxaLkIb76eWDk+pizgYvg5hv69Bx
 uUcWcAJ1zMNf1ixBYVA+WgblpKBNcFWbk4nTrGM7Xrv+KbXgMk/pzNz67IVT1V/HbFOP
 QXBtkLhMZu9bG8I38YCElE4rGIYZMwj/nOlaaXwle5xo1W/hkxdb2cKXwyDepfUjjxiM
 MAFMG9EvFF0Ph6XGsujRP0BhNuYq7qlSwnhD4+NN0ny7J6HVF7LF5L2Nl1xjv8g9aqAM
 xKeJPwo8DdMd4Ne5zVfC/Z52gIiSOiAjmsB+qs/aCCllz5TrEwVjMeo/G0vJTkW0EqUO
 DH3w==
X-Gm-Message-State: AOAM533x6TqFhahq9hEdMTW7f2wri3btaWDrT3u3nUzokt1seqGvfjYf
 Npl3iV/idpUMk09k06Fm6eqN74F0es5bykYOA1M=
X-Google-Smtp-Source: ABdhPJwH50cfnm5xz82/gry3gANuMkSo1q3kGM82NuSLmqLBh/6eEkRsRYkTM3Z5Z7FQuEZm11kxHIHR6NOG3/mS1Sw=
X-Received: by 2002:a92:600e:: with SMTP id u14mr5257819ilb.221.1605453498877; 
 Sun, 15 Nov 2020 07:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20201115115409.14511-1-yashsri421@gmail.com>
In-Reply-To: <20201115115409.14511-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 16:18:08 +0100
Message-ID: <CAKXUXMwMG0J6sPMbf1vx+e-g5x_NWSehnae7uik32Woug2JLDg@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ASSIGNMENT_CONTINUATIONS
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

On Sun, Nov 15, 2020 at 12:54 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch warns us if an assignment operator is placed
> at the start of a line and not at the end of previous line.
>
> E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
> deadlock on hotplug") reports:
>
> CHECK: Assignment operator '=' should be on the previous line
> +       struct netvsc_device *nvdev
> +               = container_of(w, struct netvsc_device, subchan_work);
>
> Provide a simple fix by appending assignment operator to the previous
> line and removing from the current line
>

Looks reasonable to me.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c9aaaa443265..5b1a5a65e69a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3542,8 +3542,13 @@ sub process {
>
>  # check for assignments on the start of a line
>                 if ($sline =~ /^\+\s+($Assignment)[^=]/) {
> -                       CHK("ASSIGNMENT_CONTINUATIONS",
> -                           "Assignment operator '$1' should be on the previous line\n" . $hereprev);
> +                       if (CHK("ASSIGNMENT_CONTINUATIONS",
> +                               "Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
> +                           $fix) {
> +                               # add assignment operator to the previous line, remove from current line
> +                               $fixed[$fixlinenr - 1] .= " $1";
> +                               $fixed[$fixlinenr] =~ s/$1\s*//;
> +                       }
>                 }
>
>  # check for && or || at the start of a line
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
