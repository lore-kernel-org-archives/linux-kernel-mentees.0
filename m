Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F3BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:49:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36F36113C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F36F36113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE25F4037C;
	Thu,  5 Aug 2021 13:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ug6REHX5NP5B; Thu,  5 Aug 2021 13:49:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 881EA402AE;
	Thu,  5 Aug 2021 13:49:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 600FBC001A;
	Thu,  5 Aug 2021 13:49:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1CEEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B40C402F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMhBsoaNqTGB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:49:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28665402AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:49:24 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o10so7252955ljp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+q/OvSwuDGUPepCONsfJ4rgfFb7QLU58/aUK0R6ssEo=;
 b=iRb+XWq3pTbBku3/S9zUchdE39u8XXmPt6u0GWAw8wCpRFy7ymIu/skOfx/UWLnGuY
 8m/6ogJuQ82z+G3p+r4vTYQVX1ifoZFx+5bbxS7I7OD2V+hk+jhjgefFZWjGhgPA3r5y
 RlzcSmCootKVXjoIZyYUjjgQj+aEozSJMgWyFjUdZ5rWh0agfUBPnGD95zrTRwhD1GNX
 IXCcmOUnXI1UrMW7jiQKPom8OXbjBy9rZESn83EqCZCEujTmgSuGrKgR7mwVh7KwsDmh
 dT+IUV0pRMTotfHZputd+G2nYi2p6swZK20IJlsytaSa7qppqreykKk0cYY8ec44Id6+
 mJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+q/OvSwuDGUPepCONsfJ4rgfFb7QLU58/aUK0R6ssEo=;
 b=W58paDu4Wx1Oo3o4gQKvKhUeiAgzDivn/M9KU9eB7SA4Ke2OLc5AZdw1k2E24Tr99P
 accfs89gvN84OPHEIevhk+F9/6wCi9rpkVuRYvBo81I4+2WBwgH0Fl/gmL1Pl4HsOHfJ
 i8Gt8xjs2qR91QokbY9YPI5xr5XU40MnzrXT8orIBtmaoxlHZ2wEkb1VTCvzFVsjrQD0
 pbD/oC9I70E0O0QkcBV0XxburHC9U8xIa7H1DqzW/lBnavYhr3BCOwT3AaJIYY/7x97y
 FVpyCPSX7C5XPZe0YXZkagRSDEmS033GGZIypMS5iDXixAsP0gGNhDh3+00jn60pRXzL
 ss/A==
X-Gm-Message-State: AOAM531JOmPaimw2dZVQhnPJPcTsLjtbjoIDVhHA0CklXboAPZgQrEmZ
 oSGdlVzr358xLP5l8f2v+tLGXEPAySrgSQ3FYwY=
X-Google-Smtp-Source: ABdhPJw1lerQoWpzvF4tkSwPOltlSNsqrjIEwjAmIXyeBJY/n1VWBp897bjX3p9mxt0fu6F4ZngJCVcW6eHrzijn140=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr3246292ljn.89.1628171361990; 
 Thu, 05 Aug 2021 06:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CpoFXgZ0WkCJSd-6oiS5D1zyw4irEP049Wr5ANTUgHCA@mail.gmail.com>
 <20210803211941.3646-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803211941.3646-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 5 Aug 2021 19:19:10 +0530
Message-ID: <CABJPP5CxsHYO8Omdceh0yD6RtRMnt5hW7DWc=aKxpXPXQJVLEQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: Add TRAILING_SEMICOLON
 message
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Aug 4, 2021 at 2:50 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type TRAILING_SEMICOLON for the macro definitions
> that conclude with a semicolon.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea..f2ef998ba 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -845,6 +845,27 @@ Macros, Attributes and Symbols
>      Use the `fallthrough;` pseudo keyword instead of
>      `/* fallthrough */` like comments.
>
> +  **TRAILING_SEMICOLON**
> +    Macro definition should not conclude with a semicolon. The macro
> +    invocation should be consistent with the function call. So the macro
> +    invocation must conclude with a semicolon. Suppose if a macro MAC is
> +    defined::

Maybe:

Macro definition should not end with a semicolon. The macro
invocation style should be consistent with function calls.
This can prevent any unexpected code paths.

> +      #define MAC do_something;
> +
> +    If this macro is used within a if else statement, like::
> +
> +      if (some_condition)
> +              MAC;
> +      else
> +              do_something;
> +
> +    Then there would be a compilation error, because when the macro is
> +    expanded there are two trailing semicolons, so the else branch gets
> +    orphaned.
> +
> +    See: https://lore.kernel.org/lkml/1399671106.2912.21.camel@joe-AO725/
> +
>    **WEAK_DECLARATION**
>      Using weak declarations like __attribute__((weak)) or __weak
>      can have unintended link defects.  Avoid using them.
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
