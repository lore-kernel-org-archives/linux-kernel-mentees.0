Return-Path: <SRS0=8/bg=KJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E44C43600
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 May 2021 16:17:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F16613F1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 May 2021 16:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F16613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA2884652;
	Fri, 14 May 2021 16:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9xrbo343BLf; Fri, 14 May 2021 16:17:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCAC83C66;
	Fri, 14 May 2021 16:17:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1D20C0001;
	Fri, 14 May 2021 16:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBFE2C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 16:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE24940111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 16:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urofhcp5W9Rt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 16:17:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C19654010A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 16:17:33 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so44940pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hhqZIG2WSjMZChaCteViTaKoqe3TyX4xP+LLXRxZ7BM=;
 b=q84C9WBnn6b/Sa+AQj1Sss4oqNU+YlBHxirU2Q7/00b+6OxkZCfLKi8CPoz2e+zE5e
 LME7Gvn27LD0GW2RIxVD3mEABYOzL/t2jVrjkRjv+oCeNIkm3nVznkG9d6jTjC1cW8sl
 QXkyvrkBzqy5Jyfxobp7kaBBSA21fWMQpbeWlaakiRt8VeJ8j1GSpGponPWm8qpdWLGT
 fsQ3tYTbzkpPJCxqO2YfT4i7wxbl8U9JTy2WySkMtKgJ3ISeDIcLhcRljDiUyAXhH6Ob
 UcxbpnymTOhq3orv8T46JdpfNWe1OM/26k8Dynz/wUA1iBtrv3oeX8g4umAg0VEU5P/V
 jjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hhqZIG2WSjMZChaCteViTaKoqe3TyX4xP+LLXRxZ7BM=;
 b=ewNDQ4Pm1q3HgHiJ3jc9Ws4CXbO8m3O+GmREDp52qBAMy3TGpGEL9fn21U80llX8iJ
 GBg/YQY45wYNY3U/YDrtJg/FBzq6k1SxkT53yvzQ13bna9AeEI9seVL4Wqqsn5BT9HNy
 5PUeirpUdBBALVKCrcaRMQHyz/3t486EgM8OVHEjLkvh9FLrHnQEFghbiEGehoWhU4NT
 FFAUac+ttHnk1Jq8qK3he3PTPSgpoal4UGAknDDSGLLkpoc+GeTIpccw6U9cVMqyyOUv
 YDOMRuMLSX8CJg6w45MWsdaSnv1rYTplW1YK3yhrNiNJrbkMhlaHVEGZTcELpAVVu2JN
 f67w==
X-Gm-Message-State: AOAM531Ews/gIIVk8gqis9gZc8JzZLFnaBJ0TcJT5bH/PF1pvnde8vLH
 idQ+yu5JUb9+oqH2uFNoVg0=
X-Google-Smtp-Source: ABdhPJxdmZrGd2QCLLhUZObOuDHWo6bMr8tvvLbnlKWOCNkxVBPvtT6WDrO7ca7p/7qnzIUjprf2zA==
X-Received: by 2002:a17:902:e752:b029:ed:8636:c525 with SMTP id
 p18-20020a170902e752b02900ed8636c525mr46302950plf.60.1621009053027; 
 Fri, 14 May 2021 09:17:33 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a93f:3d36:ea03:6cce:19ef?
 ([2405:201:600d:a93f:3d36:ea03:6cce:19ef])
 by smtp.gmail.com with ESMTPSA id x11sm4783986pjr.21.2021.05.14.09.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 09:17:32 -0700 (PDT)
Subject: Re: [RFC v3] scripts: kernel-doc: reduce repeated regex expressions
 into variables
To: Matthew Wilcox <willy@infradead.org>
References: <20210427165633.GA235567@casper.infradead.org>
 <20210429063729.8144-1-yashsri421@gmail.com>
 <20210501154336.GS1847222@casper.infradead.org>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <490cdb39-74a1-951a-0688-0f72f58ae7f8@gmail.com>
Date: Fri, 14 May 2021 21:47:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210501154336.GS1847222@casper.infradead.org>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
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

On 1/5/21 9:13 pm, Matthew Wilcox wrote:
> On Thu, Apr 29, 2021 at 12:07:29PM +0530, Aditya Srivastava wrote:
>> +    my $name = qr{[a-zA-Z0-9_~:]+};
>> +    my $prototype_end1 = qr{[^\(]*};
>> +    my $prototype_end2 = qr{[^\{]*};
>> +    my $prototype_end = qr{\(($prototype_end1|$prototype_end2)\)};
> 
> Would this be better written as:
> 
> 	my $prototype_end = qr{\([^\(\{]*\)}
> 

Hi Matthew
I have actually tried this earlier, but it does not work as expected,
probably because of greedy matching. I have produced the list of
warning differences before and after over the files, when using this
regex:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/diff_on_alt_protend


> And now that I look at the whole thing, doesn't this fail to parse
> a function declared as:
> 
> int f(void (*g)(long));
> 
> (that is, f takes a single argument, which is a pointer to a function
> which takes a long argument and returns void)
> 

I think this will match against:
$prototype =~ m/^($type1)\s+($name)\s*$prototype_end/

Thanks
Aditya


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
