Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF44C64E7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 04:21:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F3F221FB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 04:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F3F221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C74787FB6;
	Wed,  2 Dec 2020 04:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBlsCshFOl9i; Wed,  2 Dec 2020 04:21:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94CB187FAA;
	Wed,  2 Dec 2020 04:21:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AC6CC0859;
	Wed,  2 Dec 2020 04:21:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C9A7C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 04:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 267B82E1BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 04:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8H0yhTVkgrm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 04:21:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C22AC2E1AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 04:21:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k5so404286plt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 20:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p54tA3Lh3qw5So+dcm5tNyopOVZr/DLkJyUNEV6tO9o=;
 b=LMnJyfctexJAuMIUke4jgBIAem+9sVrKh+vo3s3684SWnoMoJO2xeS8G3jzxXl39AV
 D6jAwkwAHRZe/jdIjYFhhOAxUG5Nwlyg6g3MH2gLI0cnWY5GuZ/wGx3fA8iAuYe7PXpj
 WVXZHMSgCxQvTNtyP/pPYN80cBcWKbL3GoVUjWQMop979Vr1oRkeokmgqX6TkuVcRgn0
 0uVjyOs/4eqhQeynHqFZECN7D7oNONyXt/eSKJ7if5C4SJiyeH99VmucQKYwewcEaW1i
 qkui7AgwcAj3g5sHaBof5tMCc25z3AjtadbNWip94A/kQvPNDNd4pIbjzq9NEh3m38Se
 hsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p54tA3Lh3qw5So+dcm5tNyopOVZr/DLkJyUNEV6tO9o=;
 b=MCEDHxEAkDdrtgERHgpC6FrxCfnpvs/jlmLKozeFNh//6GsyCFGTWoLNSSUMGahKNu
 upNuwDRhvQPxZEg1zXHbI5RZhc70HlT0PdgO8S54fD7Sw0pshoz2g7Na1QyPIc+92AvO
 Xx1dxOvHFzmmotTCNq4wqfTHTJAcXTOgQGG02X8cVkRIv7iwPfnvgCxKx6gRZ9VfLuTk
 SgayeET5Il8j8Sb2lV06KoIiAyXzenOHVnk561BDNBMyRpHzY+XjgmEhwbfE7EPCzzz7
 rjiSWQsmYzgsHg30jT2ji6rPXC+khTidxs6rfsnbTgA+JDC8HfXpVYsnZFK5HZg/J47l
 G/QA==
X-Gm-Message-State: AOAM530Uu7M8dHD72vBWJdSj6HE3GoPvi9G+bPCmkM3YHEeJ2oQSpvs2
 o3eeUTmXt4wNf0NoZwD7Fv4V57NkHNTyDw==
X-Google-Smtp-Source: ABdhPJxn31eckifthLwsRg2hL2izLl2wR2myRosOg/r3h/C4dih/qs9kA/Qi23NyS/9sdC+arQHGAQ==
X-Received: by 2002:a17:902:a415:b029:d9:ef8:afa1 with SMTP id
 p21-20020a170902a415b02900d90ef8afa1mr830554plq.66.1606882887032; 
 Tue, 01 Dec 2020 20:21:27 -0800 (PST)
Received: from [192.168.86.81] ([106.51.140.48])
 by smtp.gmail.com with ESMTPSA id x28sm461455pfr.186.2020.12.01.20.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 20:21:26 -0800 (PST)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201201071632.68471-1-98.arpi@gmail.com>
 <CAHp75VfV60sRAKkzvbEKW7UEZSiDmNVfd_kB-OOKZRk5MNMeDQ@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <e10ef8d3-f22b-db10-3784-c94ee425af46@gmail.com>
Date: Wed, 2 Dec 2020 09:51:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfV60sRAKkzvbEKW7UEZSiDmNVfd_kB-OOKZRk5MNMeDQ@mail.gmail.com>
Content-Language: en-US
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_hexdump.c
	to KUnit
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

On 01/12/20 4:36 pm, Andy Shevchenko wrote:
> On Tue, Dec 1, 2020 at 9:21 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>> Convert test lib/test_hexdump.c to KUnit. More information about
>> KUnit can be found at:
>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>> KUnit provides a common framework for unit tests in the kernel.
>> KUnit and kselftest are standardizing around KTAP, converting this
>> test to KUnit makes this test output in KTAP which we are trying to
>> make the standard test result format for the kernel.
> 
> Below doesn't suit commit message, perhaps adding it after '---' line
> would be good. In the commit message you can choose one failed case
> followed by all OK and show the difference.
> 

Okay, I will make this change.

>> I ran both the original and converted tests as is to produce the
>> output for success of the test in the two cases. I also ran these
>> tests with a small modification to show the difference in the output
>> for failure of the test in both cases. The modification I made is:
>>  static const char * const test_data_4_le[] __initconst = {
>> -       "7bdb32be", "b293180a", "24c4ba70", "9b34837d",
>> +       "7bdb32be", "b293180a", "24c4ba70", "9b3483d",
>>
>> The difference in outputs can be seen here:
>> https://gist.github.com/arpi-r/38f53a3c65692bf684a6bf3453884b6e
> 
> Looks pretty much good, what I'm sad to see is the absence of the test
> statistics. Any ideas if we can get it back?
> 

I could again include variable total_tests as was in the original test.
Would that be fine?

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
