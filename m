Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC38C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 13:05:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6479020702
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 13:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6479020702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01171882EE;
	Fri,  4 Dec 2020 13:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlEahDzsAUFR; Fri,  4 Dec 2020 13:05:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A40A882EA;
	Fri,  4 Dec 2020 13:05:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA66BC0FA8;
	Fri,  4 Dec 2020 13:05:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9D0EC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 13:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C2D8F87C62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 13:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azQCVtfzabww
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 13:05:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 376B887C5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 13:05:15 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id h7so3752611pjk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 05:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1bHLHpXfkfiBLvJZSOaELVEP3gvdM/d66JUkiKteo+o=;
 b=X1GwNBpwo9Zap7pWr3LPlfbdoAn6peO50h2vHlZMqCxxlaTKhS3E8DeoGwYNOJ8MYk
 wG6VlXLDCG9dOVjVaYPkF6pmzs3wpk9TL5lLWc2WzMZfTDk4P32uSW6gHym1RKuPXZfl
 A6pH8eats+fr5sen/8ZzRRVooUkzv5iwCkfLydu6NR28iW5bboygEWxbpyn+C+zWNX3k
 687sRjDL57Aeti7rwvErL2OLTqYysLj+QANvzgnwX50Kml+0GG1r8ZjOqEWBoJFTBEkg
 Ua6n3pT/u1tnCXnAEzuizuxz93IEdjX5TfC6nXg5KelCBv9T2XeLKWmPCCtHAaACruLN
 zE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1bHLHpXfkfiBLvJZSOaELVEP3gvdM/d66JUkiKteo+o=;
 b=OZ5PGi3hIjYP6qFR4OBo1BeA1g60A30pEK5zEwdQyacmPZmAWWg4tnfRIPtierzfm3
 bBvOj0q5BuFyp1oCBic39ZXmDYxnqqDEX5oQk9w52xvfvehQJLtDUANlh7sqHw5wqZkm
 zhkdi7W69XY/mdIh9VWAXw2BPb2gCzP3L689a9vU681hv82PzmazdOEEB18MPXu0a77N
 wWUfyZpmL031QRAlJTx9QCh/tbjRPW2Xbr6WHOsfPHVP6GldpZC/zPfgIdth/hANe562
 W9sKX6yAvIR4Gjq2PjFh+Wp/EMWr6fxKFzCVX7DeIEk3zTCEXq/ddzmOhYlpIU86UqmP
 jvjw==
X-Gm-Message-State: AOAM531BqOUjQicykUsWWiK2Dk57iLaBNwhl/8sJ3e+zYFaSnq9QNM9a
 sk3R/kWXvSaeL7eFTbRj+zl7g2vgqcKutg==
X-Google-Smtp-Source: ABdhPJxXEocRSq1pjuG3oal/Z2ZiTW5CdiuzHXznBQMpyeObWpL82mR5JQ520SK7eP8vEH7yOpDRNQ==
X-Received: by 2002:a17:902:b783:b029:da:6567:f244 with SMTP id
 e3-20020a170902b783b02900da6567f244mr3634694pls.45.1607087114109; 
 Fri, 04 Dec 2020 05:05:14 -0800 (PST)
Received: from ?IPv6:2402:3a80:43f:b9bb:d059:d26:c75b:b30a?
 ([2402:3a80:43f:b9bb:d059:d26:c75b:b30a])
 by smtp.gmail.com with ESMTPSA id c20sm4043207pgc.25.2020.12.04.05.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 05:05:13 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMzMq5OemsznzQqVB6wHWMqBFrejDnSU3iznnnF_Jesgrg@mail.gmail.com>
 <20201204125045.16740-1-yashsri421@gmail.com>
 <CAKXUXMxHHBFBTxKGcCZkipJb6HdjxvPcvH1Ci2bXdNUGR8SMbQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <22870bc3-eff9-d642-a6a1-e9e91944b233@gmail.com>
Date: Fri, 4 Dec 2020 18:35:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxHHBFBTxKGcCZkipJb6HdjxvPcvH1Ci2bXdNUGR8SMbQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] MAINTAINERS: temporary patch for
 testing/fixing MAINTAINERS_STYLE
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

On 4/12/20 6:23 pm, Lukas Bulwahn wrote:
> On Fri, Dec 4, 2020 at 1:50 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> This patch is a testing patch for testing checkpatch.pl with
>> MAINTAINERS_STYLE warning.
>>
>> In this patch, a random F entry for 6LOWPAN GENERIC (BTLE/IEEE
>> 802.15.4) is added. Also an M entry is added after F
>>
> 
> Okay, what do I need to do next?
> 
Now, we can run the command: ./scripts/parse-maintainers.pl --order

This will produce a MAINTAINERS.new file in the root directory, with
ordered entries.
Then, we can lookup our corresponding section in MAINTAINERS.new and
order it correspondingly manually and create the patch again with
corrected changes.

[The new ordered file we get currently has a lot of changes when
compared with MAINTAINERS. This is so because there are other sections
and entries which need ordering as well. This is the reason, we cannot
directly replace MAINTAINERS with MAINTAINERS.new (as this might
produce more changes than desired for that patch); rather just fix our
modified lines]

> 
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6aac0f845f34..7937e76f9871 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -178,6 +178,8 @@ S:  Maintained
>>  F:     Documentation/networking/6lowpan.rst
>>  F:     include/net/6lowpan.h
>>  F:     net/6lowpan/
>> +F:     random/directory
>> +M:     wrongly/ordered
>>
>>  6PACK NETWORK DRIVER FOR AX.25
>>  M:     Andreas Koensgen <ajk@comnets.uni-bremen.de>
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
