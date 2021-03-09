Return-Path: <SRS0=qsl3=IH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0815C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Mar 2021 21:24:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E7565227
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Mar 2021 21:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E7565227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D354313F;
	Tue,  9 Mar 2021 21:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNcQNQambpNm; Tue,  9 Mar 2021 21:24:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A77743135;
	Tue,  9 Mar 2021 21:24:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BD33C000B;
	Tue,  9 Mar 2021 21:24:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F693C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B7B86F645
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 21:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Yh8sJqi6myJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 21:24:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D06476F64E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Mar 2021 21:24:49 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so5721087pjq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Mar 2021 13:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BR5Ek/R5Dd/XRMzwcsXowOty2MUW4TUsL+d29eNBB58=;
 b=piG/uxx71QaIxlCrSq38FBWqirNb5Zp67e9dl2kZKWbqtCeSyjaWf9tjLGIev0DPp9
 oC+i2I6M1CjUQd8l0F53Ut//1e5YiVF1QAIPLT8uf7bi+YhNqt3CfX4ZOVZGzsB7iZ7k
 MhMN8xO0UepyTKt1NOUTi2FzyqhP2IlTQLlCbviQge6SMYL2lNSFfNkMqMgx97gHFGho
 K0yOMyEXZSIl35adqWzmYMVTRcYZXE6pn1Fj2k3T4FdKzMwnvjwV1uMHGQC4WEMA3HGC
 pRiSLde5g2bLSa8M2rmMaU0HG4msloAZjK4/zCJnN+Bhw4DZmilzvGtQifNM3ldJbJ0V
 ghgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BR5Ek/R5Dd/XRMzwcsXowOty2MUW4TUsL+d29eNBB58=;
 b=MKPBWYgtgWZMgM+mDYW/pYoj7/D/ysuFOmpPwnLTD2AjsHZ85N1txDX1szNYVWT8TF
 6LP5kftJxjIytyo7wQDCOnFLw255pPqGglvPwo3w8WopqxQFm61UNVwTK63mHjNGgcZQ
 I08srqZGicck+YcldWJy4oPmLG2TdKYa+Lj0mIF6tSbcDCfljXyqYq012UYBj/jbGSVA
 k+1N4yfRtJ0xt0OXOazpEICKzW390PWIX9pVyRHQ+l20/eD/q/2iYDzUd4E+wNMVuM5X
 qhGE8rOj0wv/pGn2W6HZpgmu8KPH1bFgdYutRJD/m9d+B0R7p6hw0cj7jfDa1mjIEny8
 GQgQ==
X-Gm-Message-State: AOAM530KNPX8cINq7F3M5qVFRRGklyaY3lOHduduZdPZpdXzDnDfttcJ
 GGE3NpKW1A3d1Q6w4bj1THniNWTkGgz3rw==
X-Google-Smtp-Source: ABdhPJx4L3iEXsc72kQEmwtAuXe3qhkT3zUqZpNp4Va7CnvlTB8xtt6baJoruhAiFUAe6dHFmFVxBQ==
X-Received: by 2002:a17:90a:bf15:: with SMTP id
 c21mr6675007pjs.160.1615325089097; 
 Tue, 09 Mar 2021 13:24:49 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:89e4:587b:cd60:65bd?
 ([2405:201:600d:a089:89e4:587b:cd60:65bd])
 by smtp.gmail.com with ESMTPSA id r16sm7628103pfq.211.2021.03.09.13.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 13:24:48 -0800 (PST)
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Markus Heiser <markus.heiser@darmarit.de>, corbet@lwn.net
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
Date: Wed, 10 Mar 2021 02:54:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On 9/3/21 7:00 pm, Markus Heiser wrote:
> 
> Am 09.03.21 um 13:53 schrieb Aditya Srivastava:
>> Starting commented lines in a file mostly contains comments describing
>> license, copyright or general information about the file.
>>
>> E.g., in sound/pci/ctxfi/ctresource.c, initial comment lines describe
>> its copyright and other related file informations.
> 
> The opening comment mark /** is used for kernel-doc comments [1]
> 
> [1]
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments
> 

Hi Markus!
That's true. But the content inside the comment does not follow
kernel-doc format.
For e.g., try running kernel-doc -none/man/rst on the above file in
the example("sound/pci/ctxfi/ctresource.c").
The starting 2-3 lines in files generally do not contain any
struct/enum/function, etc. declaration.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
