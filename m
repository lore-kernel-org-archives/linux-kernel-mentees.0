Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F83BC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 23:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DF65405E5;
	Wed, 13 Jul 2022 23:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DF65405E5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=GmdSul5V
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSmnCt3TMy6j; Wed, 13 Jul 2022 23:52:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 04FBC400CE;
	Wed, 13 Jul 2022 23:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04FBC400CE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE97BC0033;
	Wed, 13 Jul 2022 23:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCB04C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 23:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A15BA40374
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 23:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15BA40374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6DMM3xuHw1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 23:52:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B6A400CE
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4B6A400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 23:52:48 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bb16so500840oib.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xlTQqbw7uDh4SuPsuMIuNWyY8gGG3CCpf0R5mOWG5uo=;
 b=GmdSul5V0h0l9vx6e6MKTO5tR7iI4VBAnIruDdHRvVtsL+ZN9U0erJYaKhBmX31wxN
 YJXKxJHDNRUvUZlxQaEVQ5WBdXsRH2CPxsnKx1NG1u/890cWUrlWSrBht9zPQIPh63kS
 QZSuoffMnAwsyl0W4LDEnhfBH4Ajgxk51V3Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xlTQqbw7uDh4SuPsuMIuNWyY8gGG3CCpf0R5mOWG5uo=;
 b=irAKOJsPDg9NHrcgDbkkru20uCTKZ7Z8KtTeSvmHLkE5hYKN0hpFN3OtIHZfz4zYTe
 P+s7V8Svdb4ibhvNxw0ojM4+r5vcDvxIfx3FhrsbuTQ6P0DiZfPq/5bc2V9rxZgkWcMo
 IL2jHxIW8KfR/7mt7WPAkcAUL8mgwfr0aOH23aa9gUxySiYasJ2nSze/aje4dNp/iMr0
 gkFesgsqh+7GAK9U1E+IzxK7OjFho3NH1Wo1mayt/JYNyWjwRhPYufv3sNAK176tJQY5
 mtWCswuh8rqT3zVKhpjV6Klk+TSJUsW02VhPvU9DLIWcJhLkpaToss0c4Rr1R46Ta9sN
 Bymg==
X-Gm-Message-State: AJIora8nlcE+AUKRa835K7IuhkpOTqRYttgXtb0kJBb6KPJkgZ6M4pNX
 4dvwDNShJSUZR61Zk3Y8W6LEYHfP
X-Google-Smtp-Source: AGRyM1t8Oyx9JiN9pS02uZRL8cVCdFOv/rC2q7vL2hNTcSFUdc52uoNQSfKVpumlzFL3QKzMw1yZTg==
X-Received: by 2002:a05:6808:1183:b0:2d4:5eeb:1ca3 with SMTP id
 j3-20020a056808118300b002d45eeb1ca3mr3002185oil.8.1657756367781; 
 Wed, 13 Jul 2022 16:52:47 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 o10-20020a056808124a00b0032f51af1999sm56286oiv.42.2022.07.13.16.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 16:52:47 -0700 (PDT)
Subject: Re: [PATCH] selftests/kcmp: Make the test output consistent and clear
To: Gautam Menghani <gautammenghani201@gmail.com>, shuah@kernel.org
References: <20220629192822.47577-1-gautammenghani201@gmail.com>
 <YsuljDee9KGDPfsH@fedora>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bdcac68c-e227-6376-9d71-aa667596c4e6@linuxfoundation.org>
Date: Wed, 13 Jul 2022 17:52:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YsuljDee9KGDPfsH@fedora>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 7/10/22 10:22 PM, Gautam Menghani wrote:
> Hi Shuah,
> Please review this patch and let me know if any changes are required.

Remember to bottom post.

> On Thu, Jun 30, 2022 at 12:58:22AM +0530, Gautam Menghani wrote:
>> Make the output format of this test consistent. Currently the output is
>> as follows:
>>

Now what is inconsistent. It is not very clean from the output. Please
add more information on how the current information is inconsistent and
how you patch makes it consistent.

>> +TAP version 13
>> +1..1
>> +# selftests: kcmp: kcmp_test
>> +# pid1:  45814 pid2:  45815 FD:  1 FILES:  1 VM:  2 FS:  1 SIGHAND:  2
>> +  IO:  0 SYSVSEM:  0 INV: -1
>> +# PASS: 0 returned as expected
>> +# PASS: 0 returned as expected
>> +# PASS: 0 returned as expected
>> +# # Planned tests != run tests (0 != 3)
>> +# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
>> +# # Planned tests != run tests (0 != 3)
>> +# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
>> +# # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>> +ok 1 selftests: kcmp: kcmp_test
>>
>> With this patch applied the output is as follows:
>>
>> +TAP version 13
>> +1..1
>> +# selftests: kcmp: kcmp_test
>> +# TAP version 13
>> +# 1..3
>> +# pid1:  46330 pid2:  46331 FD:  1 FILES:  2 VM:  2 FS:  2 SIGHAND:  1
>> +  IO:  0 SYSVSEM:  0 INV: -1
>> +# PASS: 0 returned as expected
>> +# PASS: 0 returned as expected
>> +# PASS: 0 returned as expected
>> +# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
>> +ok 1 selftests: kcmp: kcmp_test
>>
>>
>> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
>> ---

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
