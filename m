Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB348C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 14:15:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5719120855
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 14:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vWrvFkyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5719120855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02F0886E56;
	Sat, 12 Sep 2020 14:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tdj5L3-qDTZG; Sat, 12 Sep 2020 14:15:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E83DD86E53;
	Sat, 12 Sep 2020 14:15:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CED54C0859;
	Sat, 12 Sep 2020 14:15:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38D0FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2BE0A87575
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7QvZN6iySnZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7D90D87574
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:15:24 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id nw23so17208984ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=WtP/uNvdquey/L+Y96O9PtOnZJM/aELWB1GinBN0tYE=;
 b=vWrvFkyMFA+8XAXRxtNfHD7tXF3sUHebblUfqTvs9Szts6lsUyyxCWE+Ed9OaTVVwZ
 iC3u2h3VIlynXMTVdUtNk1khT+7hgCa/fGc+brc3vOknFAvxnnT1M5eFaidg+M3qJmrW
 jjwj5+AoUVj5hjaQeNdH6EcGbN/5R7vZ1ZObE4ItKIHHX81GLNgKuvQsHZbQJVS3lZVD
 5FEa7E4OCNTCVZjGOVwxiDOXPrTLqgm3uSCb+h2N0YXJtW2J+bvHNBJSSf9CaGs0WRHj
 Wr6XN8l7EYhU1IAyAtlR+wnrwB7PorWBlwGKvX7CvN5VGH9LNWNNh4Ay9ErKSOgJE6MM
 spbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=WtP/uNvdquey/L+Y96O9PtOnZJM/aELWB1GinBN0tYE=;
 b=gr6DyHMUYaPrmW1UplcW/Je2djNGufptoBW4wXiltux4da7sQJjQ+SGthM0ErduwCD
 2G3C/92dRxDNqJICeeWwsy5pT7FTyc0kvGKlrpV0EqKM3UK3femRGmn5MZuN5u9jEstB
 DNIe6II8fH+z1L5EY8cqwN2cVOtnAdFBk2RunM7dYVQNQ/nProSVnaeneN4lB7PgWKtE
 caiSX7rcGlKR10PXe5Fc5DM6Fq3slCaw+1dnTYO6Ab6PGyt5VmmOPTfq2dhLczOXQXFb
 juOrRMmYN9LJm7ZhOSrizioiksoR60Bsk/MXd9a1t7ZNYjy8P7YH5hjfRjzQipXsxVgl
 QC9w==
X-Gm-Message-State: AOAM531DRat2ikhvfISlmsMeAJ9cssVwmbDDFe6GeblwchB2DZfgbjpb
 zoQs1TZTD3PalPUoKKGyZkY=
X-Google-Smtp-Source: ABdhPJywDfdKt2etlMQWl1cYQgBQOx0IXkq/1VGut3+xCIKwtFHX1za7f7BW5PJyIdr7jijZEk09sw==
X-Received: by 2002:a17:906:7fcc:: with SMTP id
 r12mr6374706ejs.360.1599920123055; 
 Sat, 12 Sep 2020 07:15:23 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id j15sm4975802eds.33.2020.09.12.07.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 07:15:22 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 16:15:15 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <20200912094826.150170-1-ayush@disroot.org>
Message-ID: <alpine.DEB.2.21.2009121608490.22523@felia>
References: <20200912094826.150170-1-ayush@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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



On Sat, 12 Sep 2020, Ayush wrote:

> 
> Before applying this patch, checkpatch.pl reported 342 errors of type
> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
>

I could not reproduce those numbers.

Can you share exactly what you are running? And can you share the list of 
differences in your report?

I have seen that the line number now has also changed in some cases.

We can check if the script really improves the detection or not.

>  my ${CONFIG_} = "CONFIG_";
> -
> +my $c_count = 0;

Why do you think this variable definition is supposed to be placed here?

Where are other variables with similar use defined in the checkpatch.pl 
script?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
