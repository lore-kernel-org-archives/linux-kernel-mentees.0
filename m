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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D11DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E237860EB7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E237860EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACD3404D4;
	Tue,  3 Aug 2021 14:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hY9kffrHNeFD; Tue,  3 Aug 2021 14:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D435540374;
	Tue,  3 Aug 2021 14:52:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC375C0010;
	Tue,  3 Aug 2021 14:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1480C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE929404D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGm7wE3huIiS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B0D40374
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:52:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f42so952767lfv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyWSkaIj7Rn5W7kIRlk0xZ6o8EAVUwvqm9AJiWBSRRI=;
 b=U0BFHPRaraLSjJLPBSMwdpFsuQPX9s05D0RtYpOZTznsNHyudLwubLCXZ8ooXsjkEG
 55PYZHCPjobCK98lrH07/I6tGiSIaZ8JksgK3/k3K3FzXF1QSuSFO7mX4/VLXFyrKGRf
 rqZtHORrIjJJcf2+0Pdsnh1LlLxFrwdWaoJbj8T8ix/J+qnZJfjiMVIHUe4BjFMZecV6
 AbDVf8CW/D1g/IpEXJDjjDZ8ila6F3PMcc6P3wBuTeLoZHQxfcrbIdBLBNeW83tpkS3e
 FQiuYkdsvtzf+06+lKYtJiUVR5vM5G/S5NxiVb1kb6ZEGu9fTmA4iv/yhsMmUEs6iSeC
 dxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyWSkaIj7Rn5W7kIRlk0xZ6o8EAVUwvqm9AJiWBSRRI=;
 b=am1bWOkSVap9UQEYSMmloDIK1K4+9KTzRwwVfZBstZpX2K2/Ah4gRiLu6EoiomRzES
 xA7MDaLAUqK5FB+jElQ4P2E4XVaLSjwTf3VJSTO7xL3NVhh40Qgs1MMTSU7K1ElDfQaB
 IUBgN7f0wJMDXp5/Zd7j028x3dchWu6ON5N9PAJj5OAheuYAsYwB0oZMxLAi/R9VGWqJ
 nb9gCZ3tB1hNSlpWhD/+h14cKsAVfm+ZBmaXSJK9hXkQnVHVoQjPK7KE8AJKp7/Au4qy
 OVt0RaP4Sy/L9NaiqFQ37eWJGHoAhFtVzkwj8UbqXJjwZgExfs2jj1szMBgybUk1mxLP
 dOnw==
X-Gm-Message-State: AOAM532WOoIKUEo6nktygcDvss50VjhV1Q8uirS6jbcrLVpTDkur+LLJ
 Nnugm7mYLEjXLKVArX/PETXpA/OUm/tO1Yr+07c=
X-Google-Smtp-Source: ABdhPJx2vf0BMtefYejRbIIa91Fx0h0cxDSICKOdFkFibQSehr7XtgQ9B89Q0O2qnzMlalEM1CTaf42ZaqzbePofOpU=
X-Received: by 2002:a05:6512:3f8b:: with SMTP id
 x11mr5845662lfa.652.1628002371172; 
 Tue, 03 Aug 2021 07:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803141751.16893-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803141751.16893-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 3 Aug 2021 20:22:39 +0530
Message-ID: <CABJPP5B90d_wsEjcG=agKO8KAHaB11Bjh-mgtZtdmrkfooWcYg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Add SPLIT_STRING message
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

On Tue, Aug 3, 2021 at 7:49 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type SPLIT_STRING under the 'Indentation and Line
> Breaks' subsection. Checkpatch documentation for the splitting of
> quoted strings that appear in userspace, across multiple lines.
>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea..32a26a800 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -710,6 +710,10 @@ Indentation and Line Breaks
>
>      See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
>
> +  **SPLIT_STRING**
> +    Quoted strings that appear as messages in userspace and can be
> +    grepped, should not be split across multiple lines.
> +

Is there any reference you can point to for this?
Usually LKML links are okay. So you can try adding some discussion
link which helps know more about why this message is important.

>    **TRAILING_STATEMENTS**
>      Trailing statements (for example after any conditional) should be
>      on the next line.
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
