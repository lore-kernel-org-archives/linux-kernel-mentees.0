Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16810C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 15:20:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B154560184
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 15:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B154560184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837AA8354D;
	Tue,  3 Aug 2021 15:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJBg0IZCfsbr; Tue,  3 Aug 2021 15:20:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C089A81069;
	Tue,  3 Aug 2021 15:20:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93936C001A;
	Tue,  3 Aug 2021 15:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E809C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 15:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A3E81A6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 15:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WhfB7-ayLuj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 15:20:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D6CE81069
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 15:20:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y34so40345691lfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SpZ9CF39icLpFwelOXSFyn3A5ECepmci0owm6kTBOA=;
 b=YJATwVkt4wF8DAYsa6PYHpOWvISr7XPw+qu54crYP4HObmoLU7XfSehUlekFBCtwn+
 jCwwy7PNPaCEGmeNjBvazyeZpaC6dqCmKUX8APeEJuGSEy68TGfVngidLNzxIAzGSLCm
 lljDQh6tMs/IQQK2Z6vAndy3ObhMSOUJH8i4mwTVjrcsmKHI210ncI+qk4BmeWjX+LPW
 rLPXp9ulp+2waWoevxzRxLZNf77og2HmpYx2Xr1Jq0uCIj/VNdjCCz0DhXxQjwKZCKMf
 oNylNHTpVgvCVbMuuEKiwiyTs0p7B8C6MGOFNGfTP1k4TQR4nSWFpqsJgcOErOKYR37q
 WpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SpZ9CF39icLpFwelOXSFyn3A5ECepmci0owm6kTBOA=;
 b=OhuRhe1qVCnTmdI+hKkcvxM47bzJKGIgvHJhMv2zjtcYClXQgRl/1vwVAyY+ujgDqk
 TUBZfkl5eDTkeVmraTC9IEofmiyUhG14mvd+vHGI+mVgof1eCJlhIFJQ3vnvY3jJ87gF
 A799Z5iiVp7G3Th9UJWk1erSwuJdm9ZNVTlkVOwCp2YopiAOfjvFyZLRa7YcBEkJ4obw
 q+LtSfpu2XNdE+fx74ybqP361nhcea66jsNS8MeOo1dbU6TGFiUsoaCpyfV0rqT1jPPb
 BOmDUcqWgBFh9sOH9fGPN3dwMo0E8SrOeAyFeIi7Q6zRenOMsmHIMj8+KKjHvVOsq9U/
 3wIg==
X-Gm-Message-State: AOAM5339i5IfhWZCYPkoDul1eQaD2OVAhzJGNfYHs+W8HrUhXkwRWTFt
 ovcs5QhBO/KjIGlTxF8K6DESUAcW4WqeHaWOZr0=
X-Google-Smtp-Source: ABdhPJzQH70nD7dkj/Wixyf4w+0pk1pHTxblZ3MVtF0vqYWjdT6OO1+HXM3A86QJcAIheBqs0WPKcxYqrN6AOPEfjoI=
X-Received: by 2002:a05:6512:3f8b:: with SMTP id
 x11mr5952171lfa.652.1628004043913; 
 Tue, 03 Aug 2021 08:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142010.17015-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803142010.17015-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 3 Aug 2021 20:50:32 +0530
Message-ID: <CABJPP5CpoFXgZ0WkCJSd-6oiS5D1zyw4irEP049Wr5ANTUgHCA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Add TRAILING_SEMICOLON message
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

On Tue, Aug 3, 2021 at 7:50 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type TRAILING_SEMICOLON for the macro definitions
> that conclude with a semicolon.
>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea..504edd961 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -845,6 +845,26 @@ Macros, Attributes and Symbols
>      Use the `fallthrough;` pseudo keyword instead of
>      `/* fallthrough */` like comments.
>
> +  **TRAILING_SEMICOLON**
> +    Macro definition should not conclude with a semicolon. The macro
> +    invocation should be consistent with the function call. A function
> +    call concludes with a semicolon, so the macro invocation must also
> +    conclude with a semicolon. Suppose if a macro MAC is defined::

The objective is really to avoid unexpected code paths. The explanation
seems correct but can be shortened a bit?

These two sentences can be combined:
The macro invocation should be consistent with the function call. A function
call concludes with a semicolon (We already know this right?), so the
macro invocation
must also conclude with a semicolon.

Also let's add link to the discussion which introduced it:
https://lore.kernel.org/lkml/alpine.DEB.2.02.1405092345480.6261@ionos.tec.linutronix.de/


> +
> +      #define MAC       \
> +        do_something;

combine it in one line?

> +
> +    If this macro is used within a if else statement, like::
> +
> +      if(some_condition)

space after if

> +              MAC;
> +      else
> +              do_something;
> +
> +    Then there would be a compilation error, because when the macro is
> +    expanded there are two trailing semicolons, so the else branch gets
> +    orphaned.
> +
>    **WEAK_DECLARATION**
>      Using weak declarations like __attribute__((weak)) or __weak
>      can have unintended link defects.  Avoid using them.
> --
> 2.17.1
>

Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
