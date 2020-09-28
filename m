Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DBCC47420
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 16:14:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B3C214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 16:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJzSpeWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B3C214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B74C3203E0;
	Mon, 28 Sep 2020 16:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37GPGGJVRSIM; Mon, 28 Sep 2020 16:14:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A8AAB20009;
	Mon, 28 Sep 2020 16:14:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90F8AC016F;
	Mon, 28 Sep 2020 16:14:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 267D1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 16:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1592D87036
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 16:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb5T3HMoV4p6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 16:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C05786FB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 16:14:35 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id r7so9311138ejs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 09:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rPG25eKMYKrOTIORcQsFga3x3Kzn8+EhLNhD3EdsI94=;
 b=hJzSpeWTO23TzfUQHe3kzpCilym9yH4t+dOZk7Cwp+DdylWg8fmCJNujrL5Nnt0bI0
 lAzF5sw5cPIxb6Fu+2x8pH3o3Ez4cGWZ4rSnFj/5Nqz2iDRuIgHEgWCnMHftoQx4MflE
 Pm9/I1Z8mRDj8sV4SnKKSSdFfInIDEVqLTTbxAff8KhpCSHksawwM8zObmpq9yyyx8Wk
 oVsaZATJVvtrFAOOkREKGDvubxVlkLVhIjN2hEsbW1TuRtZYn2NbmXWU3j2/t63TdJ/Y
 t7ew2kvLPD15toYRmq2VPMhxqy5D/QxZm24tRICxHRREUYTRioSPvIU3VvL4deZhuyp9
 A1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rPG25eKMYKrOTIORcQsFga3x3Kzn8+EhLNhD3EdsI94=;
 b=p2Q3axsknQn2t+VGKM3L/2JFzkoVCcwAXrtpkz8JhloBeNtZ8pUpxR3Sp9fUJJZu1e
 rfP279FKdk3JsMvrCdZrCj9UwIEoudCTz9MZ7SGhTz5jQIpW19qqV8TUcPIhgIVrNrl+
 aUF0412KRTQ9AoQzSa8pUEt5h55c53e+bwm8aMMfZT5dArdu7oHMaRvJzkg5V+Uk6Fb8
 /+upr2yFFaZ+UR5O847xIFhy4JTZktmNBLtAYnj2utq1JioKW4W8vsDCuN7FbojjZUC6
 e8VomE9prVMl3EaPvjDUg117a6VJu8EhLyFR0GJwnCPy4ZytJoxQFSUYTL4wrzExqt1N
 1DTw==
X-Gm-Message-State: AOAM530zlIMRVWZ/qw0PEkReWl2cKvQ2v5nzMDIY/VTxSYOTUONRwZ8W
 sJwP1o33u+dM6xeknNt8eVA=
X-Google-Smtp-Source: ABdhPJwLGGdOQSl/Td+DcX2rRJbI3cUAaWCS6bW4W0/bGKi206LPrSQmYAK/C/Lqt1EuWEcb77+9HQ==
X-Received: by 2002:a17:906:cf9d:: with SMTP id
 um29mr2396759ejb.74.1601309673540; 
 Mon, 28 Sep 2020 09:14:33 -0700 (PDT)
Received: from felia ([2001:16b8:2d9d:5000:7872:7299:adfa:b749])
 by smtp.gmail.com with ESMTPSA id i7sm1997048ejo.22.2020.09.28.09.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 09:14:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 28 Sep 2020 18:14:31 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5D=q865sMYM768=qyY-gavG3VEyT4X1qGLsPT9umkTE8Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009281805030.4154@felia>
References: <CABJPP5D=q865sMYM768=qyY-gavG3VEyT4X1qGLsPT9umkTE8Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
 MULTISTATEMENT_MACRO_USE_DO_WHILE issues
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



On Mon, 28 Sep 2020, Dwaipayan Ray wrote:

> Hi,
> Checkpatch seems to generate some false positives on
> certain macros.
> 
> For example running checkpatch on (kernel/trace/trace_export.c),
> 
> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> #49: FILE: kernel/trace/trace_export.c:49:
> +#define __field_packed(type, container, item) type item;
> 
> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> #52: FILE: kernel/trace/trace_export.c:52:
> +#define __array(type, item, size) type item[size];
>

I guess checkpatch.pl detects the semicolon and thinks it must be two 
statements. How about checking if the semicolon is actually followed by 
anything or not?

> and several other same errors.
>

Are they all in one file or spread around in the kernel everywhere?
 
> Wrapping this in a do - while certainly doesn't make sense.
> Removing the semicolon at the end of macro and appending semicolon
> in the call changes the error to:
> 
> ERROR: Macros with complex values should be enclosed in parentheses
> #49: FILE: kernel/trace/trace_export.c:49:
> +#define __array_desc(type, container, item, size) type item[size]
> 
> This seems more reasonable. But the error isn't necessary in the first
> place.
>

Considering format or semantic checks, I would always check if 
the better check can be implemented with clang-format, clang-analyzer or 
coccinelle.

checkpatch.pl is always just a quick heuristics; if other checking tools 
become part of standard check, then we could actually just refer to those 
checking tools instead.


Lukas

> Thanks,
> Dwaipayan.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
