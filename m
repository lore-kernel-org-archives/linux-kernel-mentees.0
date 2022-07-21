Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3767C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Jul 2022 16:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D08660E9F;
	Thu, 21 Jul 2022 16:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D08660E9F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixbeGzrV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMEqAodAFzRK; Thu, 21 Jul 2022 16:24:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4AA6260E25;
	Thu, 21 Jul 2022 16:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AA6260E25
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19652C0035;
	Thu, 21 Jul 2022 16:24:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 741E8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 473FB847B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 473FB847B6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.a=rsa-sha256 header.s=google header.b=ixbeGzrV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGf3ApykKkKw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:24:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 706BF847AB
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 706BF847AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:24:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mf4so4073706ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdzyaaSS9wVD/EeKAhIRDfgg/YpGZ+e1ODi82IyhDFc=;
 b=ixbeGzrVmvVURAdO5sU9OOcCnx0pffmC11dEXfqHTPv7aPiBEc70P0ZZGoaIHU3BTQ
 A9M6pSaNj9xmUq15oOdfCneHQ0oBU1DIhG+Mkm71JN+8EIG3QsRnX+RGJnlZQQZk2ZPm
 Om2nQfvVC8EjD+aZQMkscw2RC8rR7VediHcGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdzyaaSS9wVD/EeKAhIRDfgg/YpGZ+e1ODi82IyhDFc=;
 b=EF5bwXqMU0xu+PW4ueq7X9BwpUhv3BShs8sv2Kz5HM7XzgvYfK8Mu1f6sxPVLmeZXN
 jPzoOab1fNn833uJL11b/Kqu/9v1ef28GqMUGjNNN83286vf8qw66n9fxidCBwRH9Htl
 mDmYFjhQam5TKGW5NPDGL7GjYf7f8qOdR+BJYZ0NFq59Ue7Hk6reJgM4tRo27mN8SfIG
 /yWmHSFxUcnNRGjdU3YQ6FSYcIUfnGonM19soFuHewICGP6hrzqSKMOsqWbgvmVeCNdI
 bdU+djmqm06ha3LiNpOcOFfGAeEwNFq/X9XB7CTUSflLfidjGcDnmvdyJ3l3vJGoR+sX
 htfA==
X-Gm-Message-State: AJIora/fhytSdhq5LHJQgTZWn4JhqtwLMlp+pGVAzxEhJCPGGEGCxwzH
 7VtcaLwnXdPZjj1ktcRRvY8X2NtumFxUNqpFZ/o=
X-Google-Smtp-Source: AGRyM1sL4OTptJz4WEtd9JRtKbxBeCU4mZ1VIkMFg8CCXAiwUbzI9zqtw5Y/xGMLaR4afE0ZQbclAw==
X-Received: by 2002:a17:906:cc5a:b0:72b:1459:6faa with SMTP id
 mm26-20020a170906cc5a00b0072b14596faamr41936483ejb.221.1658420687480; 
 Thu, 21 Jul 2022 09:24:47 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 rn9-20020a170906d92900b0072abb95eaa4sm975798ejb.215.2022.07.21.09.24.46
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 09:24:46 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso3506244wmq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 09:24:46 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr4239876wmq.85.1658420686023; Thu, 21 Jul
 2022 09:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093042.9840-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220721093042.9840-1-khalid.masum.92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 09:24:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
Message-ID: <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
Subject: Re: [PATCH RESEND] scripts/gdb: Fix gdb 'lx-symbols' command
To: Khalid Masum <khalid.masum.92@gmail.com>
Cc: Aaron Tomlin <atomlin@redhat.com>, Pavel Skripkin <paskripkin@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

On Thu, Jul 21, 2022 at 2:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> Currently the command 'lx-symbols' in gdb exits with the error`Function
> "do_init_module" not defined in "kernel/module.c"`. This occurs because
> the file kernel/module.c was moved to kernel/module/main.c.
>
> Fix this breakage by changing the path to "kernel/module/main.c" in
> LoadModuleBreakpoint.
>
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>  scripts/gdb/linux/symbols.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> index 46f7542db08c..dc07b6d12e30 100644
> --- a/scripts/gdb/linux/symbols.py
> +++ b/scripts/gdb/linux/symbols.py
> @@ -180,7 +180,7 @@ lx-symbols command."""
>                  self.breakpoint.delete()
>                  self.breakpoint = None
>              self.breakpoint = LoadModuleBreakpoint(
> -                "kernel/module.c:do_init_module", self)
> +                "kernel/module/main.c:do_init_module", self)

Fixes: cfc1d277891e ("module: Move all into module/")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
