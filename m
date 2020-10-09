Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81868C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 19:02:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC2B206CB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 19:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+lo1wCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC2B206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 609AD2E285;
	Fri,  9 Oct 2020 19:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdO0hPgimcJq; Fri,  9 Oct 2020 19:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 07BED20110;
	Fri,  9 Oct 2020 19:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E355DC016F;
	Fri,  9 Oct 2020 19:02:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6089C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 19:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7956120110
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 19:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PEXA8Tn+pfa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 19:02:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C37F2010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 19:02:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p11so4900121pld.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7MLIa9XL/B4x6ZTPV4+RsZ3FToAuZBj0JPZwnTve490=;
 b=O+lo1wCUKK/G7CLou5vP/HLEthFEpkAycIfMmyaNnlQNU5JyWaXpjuNZSZZwRJwZnp
 mOmxwEQVqyYP+Q1peHbS0IA2ooZpwjv8ttmbBQYuuBO35AZUsAtrZUywDw3rQ/1K6WjZ
 SUerNien1hunKFDF6+QzkHTEZsGjzcYX6IHKnKZE/zCCgWF/IhQ5bhVZkjG2FD4D5w/F
 vUspeknYbdKN89toLM+YyaRs9d/447L2TACH3mY/KMit67FAwXwiGiBMSpUD5YZjvZFo
 5E6BpIjV7kdkdam+jPjr6O9+djZBuk4E04Z7sS8F+siaA3C8DVN4DmxbQfbTS+pCF2WI
 YMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7MLIa9XL/B4x6ZTPV4+RsZ3FToAuZBj0JPZwnTve490=;
 b=hMUGzSVgBC3ZWeqCjw4316sqbywD1aMgE2wMmKV0/Suox0JmX3T3GSVCBTZXa+edGS
 kQBP9mzU7EqNgbK4fY3361IAHydgi6lCAx+KSIHeK9ChkETT+nlA6QdEe93s31nCtMvI
 x2gtnNqC/P2Tob6z3VH5FqrU+rqhB/HdbEUU0ZbkyMJfKCZdTXSiXBd75vu2JUa9rv3U
 Uillz995LZpb7sY7BF9o+NLfo2VlCWu7b3sCCN/GUoDED4T0aEcuTpMQPnRCOZDjei4W
 VrjVR0bUExOnxdjgPAFMlvxRNXq9dWYkVtyTrWiuGwi1mX5O4fskZHc3UufMXiejJsMa
 lexw==
X-Gm-Message-State: AOAM532GkQY1WdNjfQDxTRp0vZ/ZMDtGtoWcoJbvhAH285ujY1atOldb
 7F/QJuyS2vsvMPx6mQF5Fos=
X-Google-Smtp-Source: ABdhPJyKSheSgEuLm6ixok8+tjLbaH7WWQMN+El1UhqiYsyP4PTXeXLFyqijaepV+AERhFsCayX/NA==
X-Received: by 2002:a17:902:b7ca:b029:d3:eca2:d221 with SMTP id
 v10-20020a170902b7cab02900d3eca2d221mr12822192plz.74.1602270151824; 
 Fri, 09 Oct 2020 12:02:31 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id gd14sm12269356pjb.31.2020.10.09.12.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 12:02:31 -0700 (PDT)
To: Brendan Higgins <brendanhiggins@google.com>
References: <20201003144807.13036-1-98.arpi@gmail.com>
 <CAFd5g46Pf9=v6Eq01xPPWoyqMh85jf=gSnG=RifwJG+-Y5N4GA@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <90af2b8a-c19f-4073-df3c-530af11723b6@gmail.com>
Date: Sat, 10 Oct 2020 00:32:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46Pf9=v6Eq01xPPWoyqMh85jf=gSnG=RifwJG+-Y5N4GA@mail.gmail.com>
Content-Language: en-US
Cc: Marco Elver <elver@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC v3 1/2] kunit: Support for
	Parameterized Testing
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

On 09/10/20 11:53 pm, Brendan Higgins wrote:
> On Sat, Oct 3, 2020 at 7:50 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> [...]
>> @@ -254,7 +274,14 @@ static void kunit_run_case_internal(struct kunit *test,
>>                 }
>>         }
>>
>> -       test_case->run_case(test);
>> +       if (!test->parameterized)
>> +               test_case->run_case(test);
>> +       else {
> 
> Sorry, I just caught this. When you put either the if or else block in
> braces; the other should go in braces as well.
> 

Okay, I'll fix this.

>> +               int i;
>> +
>> +               for (i = 0; i < test->max_parameters_count; i++)
>> +                       test_case->run_case(test);
>> +       }
>>  }
>>
> [...]
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
