Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61719C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 09:45:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D4422252
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 09:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5+6VX77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D4422252
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 564DF86D88;
	Sat, 21 Nov 2020 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofLwAg9SPRCI; Sat, 21 Nov 2020 09:45:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4027851C0;
	Sat, 21 Nov 2020 09:45:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F6FC163C;
	Sat, 21 Nov 2020 09:45:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CA89C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 22F3786C78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuhDoEstmyZ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:45:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3A2486004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:45:17 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id h6so10816107ilj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 01:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D8eJL6kJ2AltEvYg4x3dQJwKO4AWWbzilMzVXYGWZo8=;
 b=I5+6VX77lC4daMeOTfXbhskmWjOIQpSywSZ91XeX3PykJtHevyAkdcyOn3MNVeik28
 oOHF3BZyiFKgkRuWafbYO3xfIrUpJJKn+V6Q7cMjRubqit6XgAIionXacO0gK4GyFr4T
 70zyrT4IktMJybOLfN+pY4P5KdrHbsX+oBzyRmkAiT0+vu3xJ2wu7OCxGRFU2z0th9xk
 +yyO4M72kfCG1OBLZbL2aE3J7hlLcM1J0+B/drAaIKWH91PFwBbn2x+xPsFOdGssD53i
 yXnvOuPv26GE6B08N26VnWzvrtDKu0b8sJvibMiLlsj7+81LNTH0OtmciTKW1XW2yubu
 9Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D8eJL6kJ2AltEvYg4x3dQJwKO4AWWbzilMzVXYGWZo8=;
 b=cCdJx+XIAit4jxNovm19cUXDt+X+qkYIRdMOG20egja7yiQiNVvur/rNHTNBtGu4JN
 ErUFArsIAkFIEJS/vg3cXUiAZ9Dj5pHpB12P5bRiYP85nc5H76Djt4vokIanqailbPXX
 uS/RHoFHURMJ4TLHYPdPJvbnyW9sPDTgYppwvhBaH9KG1Q6XGKklTo5EmPYNZboCedRD
 abIeWclgLxIug528YetPdwT1mvf3KZvOHQZ235/uKCB0gDrzUYznWAOoht4ZOVJhcr4B
 qywesFnce8O2UT+eZW1pVaUaXlpOUQA7aPZo7ie+gVJE8yGm01MtkhVZxAkLlpQRSyVh
 x7+Q==
X-Gm-Message-State: AOAM532f4lO0Hc8RZbCfoYzeMVk/4SM0toUIaW7vDtE216YN8RV5GXbk
 k9/EjfOpMKD5bCubu3HOBtzO5M+iyrXwcWUc0z8=
X-Google-Smtp-Source: ABdhPJxHrk0IbEdGxECK/iPmk1Rq/RYaZ/RP2nBSSfAhxlL3KrgDEpphIV+kTwelQmJIyBqi8ag0iZdFCApXjpc60ww=
X-Received: by 2002:a92:35d7:: with SMTP id c84mr22290306ilf.251.1605951917038; 
 Sat, 21 Nov 2020 01:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20201121080900.17297-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201121080900.17297-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 21 Nov 2020 10:45:06 +0100
Message-ID: <CAKXUXMxpfrXX2_xOmf0oePfh3=xcc_wHuc002tWacF98WkgK3Q@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	INCLUDE_LINUX
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

On Sat, Nov 21, 2020 at 9:09 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Provide fix option to INCLUDE_LINUX check to replace asm
> includes.
>
> Macros of type:
>  #include <asm/percpu.h>
>
> are corrected to:
>  #include <linux/percpu.h>
>

The patch itself looks okay; but should this fix option not be limited
to lines where content is added?

Further we need to investigate:
- is this still a valid rule?
- is this rule and the rationale documented somewhere?
- how many rule violations currently exist in the kernel repository?
- are there known exceptions for some files in some directories?

Lukas

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0da6422cd0fd..f852f130e065 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5468,8 +5468,11 @@ sub process {
>                                                 CHK("ARCH_INCLUDE_LINUX",
>                                                     "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
>                                         } else {
> -                                               WARN("INCLUDE_LINUX",
> -                                                    "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
> +                                               if (WARN("INCLUDE_LINUX",
> +                                                        "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
> +                                                   $fix) {
> +                                                       $fixed[$fixlinenr] =~ s/\<asm\/$file\>/\<linux\/$file\>/;
> +                                               }
>                                         }
>                                 }
>                         }
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
