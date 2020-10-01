Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D527C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 08:14:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C7621707
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 08:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm2L+QC+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C7621707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0EC2F22DE3;
	Thu,  1 Oct 2020 08:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7Vq2wfrFzgX; Thu,  1 Oct 2020 08:14:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 15ED42044C;
	Thu,  1 Oct 2020 08:14:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2C0EC0889;
	Thu,  1 Oct 2020 08:14:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF620C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D48F48730E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlVMr3CDi-Ry
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:14:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCDDA8730C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:14:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m6so4570668wrn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=/5sLVmlxILZE/Z9rJTLkyneN7cZ0LA7DGwqcHPCyRwk=;
 b=Qm2L+QC+6XO8f+Q5QpASJSWSQtPBAtKz/jPu/nCTxQdRHSARatxRatFgUuJDCeJxzG
 UX7p4KJYv9wJ55918G1oUa/D5aVsWeQe+isidS1301N0ngF9swDOohpwFpAJ8VnXjKyJ
 4EOz4ERuZFoGn39eCiXBRYoP6/zRPNdncpcyBO47OKtXzIbLYSb0YvjSDzJP9+j1dBaM
 NEDikWKOSO3wBJ1L5AtCndBBQylwCQjd7T8XEFH/7du7y4oXq3akO9CXkHMjkMVoxmi/
 UrXUt6NKEOn+aIeBWbjqLkCeJ+x54f0ZRzCpdArJwfQTxRgeEf4yqTG3ywILnf5Jfprb
 j/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=/5sLVmlxILZE/Z9rJTLkyneN7cZ0LA7DGwqcHPCyRwk=;
 b=JeOBrJ8RxSwIx0QFSPxJX43ULmY6hBDNHnBsn3bQ2pZ/Ffvyw5AeIgjmvLuoR1pGiG
 me8g3wRDaz7dSp0Cr8a5NN6PXo5fgSMJ3QtYSCDacf5ZIRp6UhaY4kx8qU/AzFEFZ9NR
 u8Hhj+cGLINPS6aq+1tfj+vl8P+ylFHLK5rMsIEEJhLVkohHbsQJD0bbSGjpuwCnofY6
 CSqbPMEUjTAHWRFSUqFftRiEO0M+Lft1mL5WTW0Pi7MemHvlF2usmEjx5TRbKk5eMo3/
 d+FTrgMEmpOKRvu1vajm5gMSp49XvUij1JFpoyzvGRpDdsvEmaM71ZPEs5F4ApYxCQd2
 xdxQ==
X-Gm-Message-State: AOAM531Ez7YSIIpctOlEP+gvY5J9JPH6VbnPeEegdGbPfIhKYJq971jS
 JY+8vjd4BTkNJt/Ef0+fl+A=
X-Google-Smtp-Source: ABdhPJyZLP/ODL9DgAb/llZpaALcc+VuJfrZxBIQNA7Z7w16fMnTb3X1P+PFvDfmAVItvk98/rwcVg==
X-Received: by 2002:adf:c3cc:: with SMTP id d12mr7542976wrg.399.1601540076344; 
 Thu, 01 Oct 2020 01:14:36 -0700 (PDT)
Received: from felia ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
 by smtp.gmail.com with ESMTPSA id b8sm7131696wmb.4.2020.10.01.01.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 01:14:35 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 1 Oct 2020 10:14:29 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Theodoros Chatziioannidis <sdi1600197@di.uoa.gr>
In-Reply-To: <20200930210333.166006-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010011001340.24571@felia>
References: <20200930210333.166006-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 1/2] checkpatch: fix
	multi-statement macro checks
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



On Thu, 1 Oct 2020, Dwaipayan Ray wrote:

> Checkpatch.pl generates errors which are false positive for
> certain multi-statemenent macros.
> 
> The specific case investigated was whitespace separated statement
> terminated by a semicolon. Checkpatch wrongly classifies such
> as a multi-statement macro.
> 
> For example, commit 4649079b9de1 ("tracing: Make ftrace packed
> events have align of 1") when analyzed with checkpatch generates:
> 
> ERROR: Macros with multiple statements should be enclosed in a do -
> while loop
> +#define __field_packed(type, container, item)    type item;
> 
> The error is misleading in this case and should not be produced.
> The solution undertaken is to exclude any macro which doesn't
> have any non-WSP character after the first and only semicolon(;)

We all know what a semicolon is; so, you do not need to put that in 
braces.

> present in it. This shall allow macros of the form "type item;",
> "type item[size];", etc. to not generate the multi-statement macro
> error.
>

I think the core reason this might work is that it is a string without any 
semicolon and then semicolon is at the very end of this expression.

Okay, we need an evaluation if this makes the whole situation better or 
worse...

Theodoros, can you help us and run checkpatch.pl for this one rule on the 
current kernel source code before and after the patch is applied, and let 
us know which differences you observe?

Dwaipayan, can you try to do a similar evaluation on git commits?

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9e65d21456f1..72c4072307ea 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5346,6 +5346,7 @@ sub process {
>  			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
>  			    $dstat !~ /^do\s*{/ &&					# do {...
>  			    $dstat !~ /^\(\{/ &&						# ({...
> +			    $dstat !~ /^[^;]*;\s*$/ &&				# space separated statement;

I do not understand this comment "space separated statement". The example 
above was a macro for a type definition. Isn't that what you have in mind?


Give it another iteration, but I think the patch is pretty clear and so 
let us send it out to Joe and lkml with the next patch version.

Lukas

>  			    $ctx !~ /^.\s*#\s*define\s+TRACE_(?:SYSTEM|INCLUDE_FILE|INCLUDE_PATH)\b/)
>  			{
>  				if ($dstat =~ /^\s*if\b/) {
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
