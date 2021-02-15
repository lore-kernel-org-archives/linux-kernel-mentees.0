Return-Path: <SRS0=q8LZ=HR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D73C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 17:26:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1BEF64DEC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 17:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1BEF64DEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85AD98692F;
	Mon, 15 Feb 2021 17:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIdx-yOiCXDm; Mon, 15 Feb 2021 17:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E28A8690F;
	Mon, 15 Feb 2021 17:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95037C0174;
	Mon, 15 Feb 2021 17:26:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36E1FC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 17:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2BB1F86E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 17:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98oADtIcqfBH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 17:26:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8917786DD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 17:26:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id f8so2493560plg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=u+yHhIeIahuXa0KrdCcyELg7Tr1BsbhdoZD531X3K7w=;
 b=Z9svKyxLrRcQmrIEdctjeKBcO4Q9FGN+3auDRK+SQdqSYRyZ99VO+fhmJo8fjkB0nm
 NhQiB/+aaJHvV1cA/BywhCGy+wIewDGYeOQ276tlPlq4TMNvZx8lkh3tgvYM+vGgvpUJ
 l3K+LnuA/Fxpbft3s4+erqvhcO6ir8gzicJRPdN3KeEYWxqqRuAlUzZlaEnFUqjX3FRW
 HUYxOspyOOfxNe6fAet7PX5nBhJCRMR2YSjBUoVcDx4/BTBFb8WfjZEvTFHk20r9Ri3g
 Ba2a42Ljbt2W1/m4e3Qs0xT43ClkQax5wVTusNdtCS4smZZFQpzfWltqko6o/oZXaDRB
 6F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=u+yHhIeIahuXa0KrdCcyELg7Tr1BsbhdoZD531X3K7w=;
 b=l0uC9vfDbaw1oA7nq488kY3SGtFZV56u28Mu+buL/IRMipri2fWaVYxGHJ+9cIays9
 QaqNmzDfbjUsY0iHWBwoRsmiQqnrQ99BNYevmSVD3g2VuBqsc1W77Y6ERDXj3mLcfQii
 XZ+2o0AijdBITSwZP8C+rvN7XvDgBmUH6294qu5me6AkTLeJkpS+wwekSgnaWxJeARgm
 GWP3TEGoQzv6C3/wujCbeeA4T7XZ3W+E7di244Fv2ytrHAekLOf3zaZgoZy3PaGB9MCq
 TWQpVp1GzdUQDxskQCNNP23tgySl26wLXbmUCQTKTO+u6Uyh1kUu3cR8Pl9hlGV8f9bU
 OB4Q==
X-Gm-Message-State: AOAM5334T1NngZL6shN9y1IgC3htve1TCEVVwpcYLlugVyckcyU5sAM7
 Do+YFMv8ml8wx3QG/W4ZKps=
X-Google-Smtp-Source: ABdhPJxMu//xCfx+BWXi5wjqi4hd0ZKOBVteyMp74mQkRpLIUAaDhyOetqKHJbIX1NG6yuzMpxTa8A==
X-Received: by 2002:a17:90a:5d16:: with SMTP id
 s22mr16979443pji.219.1613409969896; 
 Mon, 15 Feb 2021 09:26:09 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:ec90:74f5:7e8e:5589?
 ([2405:201:600d:a089:ec90:74f5:7e8e:5589])
 by smtp.gmail.com with ESMTPSA id w145sm5744498pfc.187.2021.02.15.09.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 09:26:09 -0800 (PST)
To: corbet@lwn.net
From: Aditya <yashsri421@gmail.com>
Message-ID: <5d519211-987e-3367-2ce9-9d1300445bc4@gmail.com>
Date: Mon, 15 Feb 2021 22:56:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: yashsri421@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] Issues with kernel-doc
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

Hi Jonathan

I and Lukas have been using scripts/kernel-doc lately, and we have
noticed a few issues with the script.

Also, I have generated a detailed report of warnings and errors caused
by running kernel-doc -none on entire kernel tree. It can be found at:

Complete report:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/report.txt

Since this report is very large, I shortened it in less-common warning
and no warning versions of the report as well.

No warning:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/error_report.txt

Less common warnings:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/reduced_report.txt

These are the few issues that we noticed with the script:

Running kernel-doc on gcov/gcc_4_7.c,
"scripts/kernel-doc -none kernel/gcov/gcc_4_7.c", caused this error:

Use of uninitialized value $param in regexp compilation at
./scripts/kernel-doc line 1559, <IN_FILE> line 95.
Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 95.
Use of uninitialized value $actual in substitution (s///) at
./scripts/kernel-doc line 1523, <IN_FILE> line 95.
Use of uninitialized value $param in substitution (s///) at
./scripts/kernel-doc line 1617, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1651, <IN_FILE> line 95.
Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1651, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1652, <IN_FILE> line 95.
Use of uninitialized value $param in pattern match (m//) at
./scripts/kernel-doc line 1654, <IN_FILE> line 95.
Use of uninitialized value $param in concatenation (.) or string at
./scripts/kernel-doc line 1655, <IN_FILE> line 95.
Use of uninitialized value $param in hash element at
./scripts/kernel-doc line 1672, <IN_FILE> line 95.

In my investigation, I found that this occurs because of this
parameter in struct gcov_info:
"void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)"

Here, regex match at Line 1556 in kernel-doc ($arg =~
m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) was supposed to capture
"*merge[GCOV_COUNTERS]" as $param, but the regex does not take into
account the presence of square brackets, thus causing the error.

Similarly, running kernel-doc on include/linux/zstd.h, caused this error:
include/linux/zstd.h:153: error: Cannot parse struct or union!
include/linux/zstd.h:170: error: Cannot parse struct or union!
include/linux/zstd.h:180: error: Cannot parse struct or union!
include/linux/zstd.h:230: error: Cannot parse struct or union!
include/linux/zstd.h:273: error: Cannot parse struct or union!
include/linux/zstd.h:365: error: Cannot parse struct or union!
include/linux/zstd.h:421: error: Cannot parse struct or union!
include/linux/zstd.h:537: error: Cannot parse struct or union!
include/linux/zstd.h:682: error: Cannot parse struct or union!
include/linux/zstd.h:935: error: Cannot parse struct or union!

Certain struct definitions present in the file do not follow
the expected format for parsing. (struct struct_name)
For eg. for "struct ZSTD_compressionParameters", it is defined with
the help of typedef syntax, ie
typedef struct {
        unsigned int windowLog;
        unsigned int chainLog;
        unsigned int hashLog;
        unsigned int searchLog;
        unsigned int searchLength;
        unsigned int targetLength;
        ZSTD_strategy strategy;
} ZSTD_compressionParameters;

Here, although the compiler may not cause any error, kernel-doc emits
the error as it probably expects "struct struct_name" to occur together.

What do you think about these issues?
I want to fix these issues, if you agree that they need to be fixed.

There are a few more issues as well, apart from these two. But for the
start, I want to begin with Uninitialized $param errors.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
