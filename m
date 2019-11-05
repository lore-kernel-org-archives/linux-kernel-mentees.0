Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F43BC1747E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 13:40:12 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351B12190F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 13:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiGPlzmx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351B12190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0DCD0EA3;
	Tue,  5 Nov 2019 13:40:12 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D90CCE9A
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 13:40:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 46297189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 13:40:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e4so14226918pgs.1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Tu80m6wrbMJTPkCK5WWbqaWzOaGUNMurp20do0UvsyM=;
	b=UiGPlzmx7Yt3b4ee2rkhVO5DITIX4KjHSBwsAek5YwQNV9yCiwCXGCFSah2JiVtl1+
	VdQpcaHsyYw7TFn1U/fv8hr2n70FCgzT/OA67jsQtOT9GeisN+Q+NDSWEXYDUjfDmTQ6
	2a/22TualVwYjw+fg2a/cw426HGDZhz9l9XeemzdNXr2N4Dhn3FwAU83ds5Eha2ZI/bo
	JUe9IsO9vS0fmUYC+AhAdEqJYHVpv23i5z9SPz22TVKp6bXLywbNg0ulDfDhx+HZyDlf
	qdSzDvj0U1oZ7WzeqzLGMygd7sek4vRasnyt1AEs379gCJThaErK4TtoNreCIQMMWwBo
	32mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Tu80m6wrbMJTPkCK5WWbqaWzOaGUNMurp20do0UvsyM=;
	b=FiQFmkLQBhB56nY+K+U921309rHK5Ug5XwvbhIf4i6uY41HORQBJDH549VHgzvoEen
	vlNNz7wvNUtXN8LaGOWGocpiJvrpiKIzevDgsTOhY2Hxno1k7azd6teT6gh6fQ0n/t6u
	VeW7JZdEztyvQO6mjzc2TmkWZO+aG9dDmLXaz/0cTvxNkX6aXOgFrqd0/mMSGI63Z30e
	PfLhWt0DSBzP96vmK8XzT3GijoR5ySkYmbmptpE5ym/NS36TU5UUx0TKJuCxh4MYHQ4b
	Iu38qXf6wZ6JqSjj4dSvpRDPD6Aqd1/7aj9FssIPTPN3NrTyddYbQmnvGfhUOIZhQlHG
	ZTKQ==
X-Gm-Message-State: APjAAAVhzRxXhGOKn4ukw8H/qDkAHAvZJroFKVbIgqXtE2nYsowtVLSA
	V7RhVzJld6aj+iy/FmuRXYQ=
X-Google-Smtp-Source: APXvYqxrIypDV6i5iWoNPprsCOJ9//BkJEUrcgZm3Noc05RtN6Fj0YFYw10wP6pl+pNTVo14ynm57A==
X-Received: by 2002:a63:234c:: with SMTP id u12mr35391929pgm.384.1572961209547;
	Tue, 05 Nov 2019 05:40:09 -0800 (PST)
Received: from ?IPv6:2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb?
	([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	c16sm10661399pfo.34.2019.11.05.05.40.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 05:40:08 -0800 (PST)
To: madhuparnabhowmik04@gmail.com
References: <20191028214252.17580-1-madhuparnabhowmik04@gmail.com>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <5bab8828-76e4-c67f-5855-ea4e4f43eaa5@gmail.com>
Date: Tue, 5 Nov 2019 20:40:05 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028214252.17580-1-madhuparnabhowmik04@gmail.com>
Content-Language: en-US
Cc: paulmck@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, joel@joelfernandes.org,
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

On 10/29/19 4:42 AM, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch converts NMI-RCU from txt to rst format.
> Also adds NMI-RCU in the index.rst file.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> -- >   .../RCU/{NMI-RCU.txt => NMI-RCU.rst}          | 53 ++++++++++---------
>   Documentation/RCU/index.rst                   |  1 +
>   2 files changed, 29 insertions(+), 25 deletions(-)
>   rename Documentation/RCU/{NMI-RCU.txt => NMI-RCU.rst} (73%)
> 
> diff --git a/Documentation/RCU/NMI-RCU.txt b/Documentation/RCU/NMI-RCU.rst
> similarity index 73%
> rename from Documentation/RCU/NMI-RCU.txt
> rename to Documentation/RCU/NMI-RCU.rst
> index 881353fd5bff..da5861f6a433 100644
> --- a/Documentation/RCU/NMI-RCU.txt
> +++ b/Documentation/RCU/NMI-RCU.rst
> @@ -1,4 +1,7 @@
> +.. _NMI_rcu_doc:
> +
>   Using RCU to Protect Dynamic NMI Handlers
> +=========================================
>   
>   
>   Although RCU is usually used to protect read-mostly data structures,
> @@ -9,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
>   "arch/x86/kernel/traps.c".
>   
>   The relevant pieces of code are listed below, each followed by a
> -brief explanation.
> +brief explanation.::
>   
there is just a minor ":" redundant in html page.There are some same in 
this patch.
eg:
  brief explanation.:

Other things look good to me.

Tested-by: Phong Tran <tranmanphong@gmail.com>

Regards,
Phong.

>   	static int dummy_nmi_callback(struct pt_regs *regs, int cpu)
>   	{
> @@ -18,12 +21,12 @@ brief explanation.
>   
>   The dummy_nmi_callback() function is a "dummy" NMI handler that does
>   nothing, but returns zero, thus saying that it did nothing, allowing
> -the NMI handler to take the default machine-specific action.
> +the NMI handler to take the default machine-specific action.::
>   
>   	static nmi_callback_t nmi_callback = dummy_nmi_callback;
>   
>   This nmi_callback variable is a global function pointer to the current
> -NMI handler.
> +NMI handler.::
>   
>   	void do_nmi(struct pt_regs * regs, long error_code)
>   	{
> @@ -53,11 +56,12 @@ anyway.  However, in practice it is a good documentation aid, particularly
>   for anyone attempting to do something similar on Alpha or on systems
>   with aggressive optimizing compilers.
>   
> -Quick Quiz:  Why might the rcu_dereference_sched() be necessary on Alpha,
> -	     given that the code referenced by the pointer is read-only?
> +Quick Quiz:
> +		Why might the rcu_dereference_sched() be necessary on Alpha, given that the code referenced by the pointer is read-only?
>   
> +:ref:`Answer to Quick Quiz <answer_quick_quiz_NMI>`
>   
> -Back to the discussion of NMI and RCU...
> +Back to the discussion of NMI and RCU...::
>   
>   	void set_nmi_callback(nmi_callback_t callback)
>   	{
> @@ -68,7 +72,7 @@ The set_nmi_callback() function registers an NMI handler.  Note that any
>   data that is to be used by the callback must be initialized up -before-
>   the call to set_nmi_callback().  On architectures that do not order
>   writes, the rcu_assign_pointer() ensures that the NMI handler sees the
> -initialized values.
> +initialized values::
>   
>   	void unset_nmi_callback(void)
>   	{
> @@ -82,7 +86,7 @@ up any data structures used by the old NMI handler until execution
>   of it completes on all other CPUs.
>   
>   One way to accomplish this is via synchronize_rcu(), perhaps as
> -follows:
> +follows::
>   
>   	unset_nmi_callback();
>   	synchronize_rcu();
> @@ -98,24 +102,23 @@ to free up the handler's data as soon as synchronize_rcu() returns.
>   Important note: for this to work, the architecture in question must
>   invoke nmi_enter() and nmi_exit() on NMI entry and exit, respectively.
>   
> +.. _answer_quick_quiz_NMI:
>   
> -Answer to Quick Quiz
> -
> -	Why might the rcu_dereference_sched() be necessary on Alpha, given
> -	that the code referenced by the pointer is read-only?
> +Answer to Quick Quiz:
> +	Why might the rcu_dereference_sched() be necessary on Alpha, given that the code referenced by the pointer is read-only?
>   
> -	Answer: The caller to set_nmi_callback() might well have
> -		initialized some data that is to be used by the new NMI
> -		handler.  In this case, the rcu_dereference_sched() would
> -		be needed, because otherwise a CPU that received an NMI
> -		just after the new handler was set might see the pointer
> -		to the new NMI handler, but the old pre-initialized
> -		version of the handler's data.
> +	The caller to set_nmi_callback() might well have
> +	initialized some data that is to be used by the new NMI
> +	handler.  In this case, the rcu_dereference_sched() would
> +	be needed, because otherwise a CPU that received an NMI
> +	just after the new handler was set might see the pointer
> +	to the new NMI handler, but the old pre-initialized
> +	version of the handler's data.
>   
> -		This same sad story can happen on other CPUs when using
> -		a compiler with aggressive pointer-value speculation
> -		optimizations.
> +	This same sad story can happen on other CPUs when using
> +	a compiler with aggressive pointer-value speculation
> +	optimizations.
>   
> -		More important, the rcu_dereference_sched() makes it
> -		clear to someone reading the code that the pointer is
> -		being protected by RCU-sched.
> +	More important, the rcu_dereference_sched() makes it
> +	clear to someone reading the code that the pointer is
> +	being protected by RCU-sched.
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index 8d20d44f8fd4..627128c230dc 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -10,6 +10,7 @@ RCU concepts
>      arrayRCU
>      rcu
>      listRCU
> +   NMI-RCU
>      UP
>   
>      Design/Memory-Ordering/Tree-RCU-Memory-Ordering
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
