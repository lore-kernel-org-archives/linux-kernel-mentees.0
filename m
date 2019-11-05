Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2E8C1747C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:02:51 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC73221882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPYSp2Nb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC73221882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9573B1093;
	Tue,  5 Nov 2019 14:02:51 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59C5FDA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:02:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DD0B427B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:02:50 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q16so9470231pll.11
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 06:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YQL6SU2a3KKoxlnyLuTfZyxJaKZQZOJt+fGwiLwFJ9U=;
	b=pPYSp2NbeXLKWAE9KkeK2vm7vB0gKz42Hn9YwazC1o3qnOC94f4orQrSZIShFbN7sK
	68v1nDDjgBVBgqTAG0A1KG+y0ZI0d82qmwb/n538ktvyL5qs58ckPeAPJF8pOi3wm0pf
	Pvv9RgbyMbDr5+/+xX5QTcblS2FfzYtnDB95acI88zTExYefcIeiBsOzMpbP3qU6GSf2
	GuosVwY307GC7Owz/fwcJV9ybRADP6HN19es9Re8uljIhTacybA2nSXmoKAQ7FyqxuWs
	fa8F2uy2dAJDp3xAUY/FL3VI9KT/qpWg9uHfDJhWGmQUis8iNI/ArhXTI2368BG6U7Mz
	4b9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YQL6SU2a3KKoxlnyLuTfZyxJaKZQZOJt+fGwiLwFJ9U=;
	b=KCGVHjuIreOIzDpZfl4b6EVaNJs0Nt/qMi1cVvpyfEB+iu66tIoWdglhMD4BkCEv9O
	PqkOvJ1R4TC2mWrLnP5Duw95ONFwfMMCN/KvWY+PlmFH5LfFBQ7y/ZLqV4k8FoKN+JnO
	60yPbSbILOu07AQl+3TmIe2Hr+R4elq9MQhB94G9Q/1B+h4kZmBQE4iisth0wNEeEGjr
	nqA7ZYDIuY6MbR8B+3Ge4Ak058KTjgjZoSOPEdcFUSpgAErWV30z+fUoiJ99bM2eQ9JR
	c1Qnf2GR5Cz7kRH80fRWh4l4Vdr5DYBgosp5t8JIYQItix6lfo4nl9VPrnZBKfz3bCrR
	q/Fw==
X-Gm-Message-State: APjAAAXolzUmzR0QK1g3g3LZjQr1pBg/s56Z8mjOOj6rUV4AoYVX/OUc
	ksDN4xYLnaE7fQu3xG82wiA=
X-Google-Smtp-Source: APXvYqzWvTeN5jzIYdnusiSIYJblVUpaFWxzfXQyB0OKxJ/r//EY/3c+H7crSzSveOLdOGuPma9KQA==
X-Received: by 2002:a17:902:9343:: with SMTP id
	g3mr13093886plp.278.1572962570199; 
	Tue, 05 Nov 2019 06:02:50 -0800 (PST)
Received: from ?IPv6:2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb?
	([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	v17sm25646727pfc.41.2019.11.05.06.02.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 06:02:49 -0800 (PST)
To: paulmck@kernel.org
References: <20191028214252.17580-1-madhuparnabhowmik04@gmail.com>
	<5bab8828-76e4-c67f-5855-ea4e4f43eaa5@gmail.com>
	<20191105135524.GN20975@paulmck-ThinkPad-P72>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <7b9f5499-bd03-8405-52f5-1fb94e9d85dc@gmail.com>
Date: Tue, 5 Nov 2019 21:02:46 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105135524.GN20975@paulmck-ThinkPad-P72>
Content-Language: en-US
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: NMI-RCU:
 Converted NMI-RCU.txt to NMI-RCU.rst.
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On 11/5/19 8:55 PM, Paul E. McKenney wrote:
> On Tue, Nov 05, 2019 at 08:40:05PM +0700, Phong Tran wrote:
>> On 10/29/19 4:42 AM, madhuparnabhowmik04@gmail.com wrote:
>>> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>>>
>>> This patch converts NMI-RCU from txt to rst format.
>>> Also adds NMI-RCU in the index.rst file.
>>>
>>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>>> -- >   .../RCU/{NMI-RCU.txt => NMI-RCU.rst}          | 53 ++++++++++---------
>>>    Documentation/RCU/index.rst                   |  1 +
>>>    2 files changed, 29 insertions(+), 25 deletions(-)
>>>    rename Documentation/RCU/{NMI-RCU.txt => NMI-RCU.rst} (73%)
>>>
>>> diff --git a/Documentation/RCU/NMI-RCU.txt b/Documentation/RCU/NMI-RCU.rst
>>> similarity index 73%
>>> rename from Documentation/RCU/NMI-RCU.txt
>>> rename to Documentation/RCU/NMI-RCU.rst
>>> index 881353fd5bff..da5861f6a433 100644
>>> --- a/Documentation/RCU/NMI-RCU.txt
>>> +++ b/Documentation/RCU/NMI-RCU.rst
>>> @@ -1,4 +1,7 @@
>>> +.. _NMI_rcu_doc:
>>> +
>>>    Using RCU to Protect Dynamic NMI Handlers
>>> +=========================================
>>>    Although RCU is usually used to protect read-mostly data structures,
>>> @@ -9,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
>>>    "arch/x86/kernel/traps.c".
>>>    The relevant pieces of code are listed below, each followed by a
>>> -brief explanation.
>>> +brief explanation.::
>> there is just a minor ":" redundant in html page.There are some same in this
>> patch.
>> eg:
>>   brief explanation.:
>>
>> Other things look good to me.
>>
>> Tested-by: Phong Tran <tranmanphong@gmail.com>
> 
> Thank you, Phong!
> 
> I queued a commit to be squashed into Madhuparna's original as shown below
> which adds your Tested-by and attempts a fix.  Does this work for you?
> 

Yes, Paul.

Regards,
Phong.

> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 2c29f1c481f74f5e5aaaab195042f4df6a0b8119
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Tue Nov 5 05:51:12 2019 -0800
> 
>      squash! Documentation: RCU: NMI-RCU: Converted NMI-RCU.txt to NMI-RCU.rst.
>      
>      [ paulmck: Apply feedback from Phong Tran. ]
>      Tested-by: Phong Tran <tranmanphong@gmail.com>
>      Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/Documentation/RCU/NMI-RCU.rst b/Documentation/RCU/NMI-RCU.rst
> index da5861f..1809583 100644
> --- a/Documentation/RCU/NMI-RCU.rst
> +++ b/Documentation/RCU/NMI-RCU.rst
> @@ -12,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
>   "arch/x86/kernel/traps.c".
>   
>   The relevant pieces of code are listed below, each followed by a
> -brief explanation.::
> +brief explanation::
>   
>   	static int dummy_nmi_callback(struct pt_regs *regs, int cpu)
>   	{
> @@ -21,12 +21,12 @@ brief explanation.::
>   
>   The dummy_nmi_callback() function is a "dummy" NMI handler that does
>   nothing, but returns zero, thus saying that it did nothing, allowing
> -the NMI handler to take the default machine-specific action.::
> +the NMI handler to take the default machine-specific action::
>   
>   	static nmi_callback_t nmi_callback = dummy_nmi_callback;
>   
>   This nmi_callback variable is a global function pointer to the current
> -NMI handler.::
> +NMI handler::
>   
>   	void do_nmi(struct pt_regs * regs, long error_code)
>   	{
> @@ -61,7 +61,7 @@ Quick Quiz:
>   
>   :ref:`Answer to Quick Quiz <answer_quick_quiz_NMI>`
>   
> -Back to the discussion of NMI and RCU...::
> +Back to the discussion of NMI and RCU::
>   
>   	void set_nmi_callback(nmi_callback_t callback)
>   	{
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
