Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E032C17481
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 13:49:55 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598C921928
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 13:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv1PzgVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598C921928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2BF36F3C;
	Tue,  5 Nov 2019 13:49:55 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6B989F3B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 13:49:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 49C78189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 13:49:52 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id e3so7335630plt.7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G9rssNOaono36gRg5NAIBeRasLl8BPM5p4jbq9dvddU=;
	b=Gv1PzgVjSrnaJzXRpe3MqOP0r7bT/E0EVIcMVM39LxQ3p548fllIwQMVZqmqTPvVcq
	pdGkwB4OLfW9i09JFx8MWUvLWQiAkB548+DEdVi1l8SnZ1huoF4OaGUrRz+z8aQ/O2Ce
	Ay/Em5Ahb+H/16h11WfCVgnEAtMF4vTHkhFbix3G59AC9lqFGcOv19Y3EUBM59x2x6bT
	XoKjOFjykDA2P3/p1wFt8TQs9EfhXlN8LnhJdKSybqkqYh8wyPwUEEWkJDrnqx2uEUMZ
	8slr9rRYwhzMiElFQBhb2oeF+mw80ackFj8lAJybrnEth+WIuYJtCyePVpNT+SlIRxmO
	Yy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G9rssNOaono36gRg5NAIBeRasLl8BPM5p4jbq9dvddU=;
	b=b1BrqvPfqpid455Fom71nFGvoIFWIxzMmLjkI0kNmM6yaH/7bZ2KPt4en3kKclNSUn
	odEcWzGVN4iai9Thk8earivRVWMpMdDDu7kUOrs8sg1ORUfI1rvyy/95fh/EJwTqY2la
	czEJXsxzb3M4F5F+VeChUemnF1GiD+0+2x4gIfMouFl07jN86g7K/jswnL3jYLQdy6+4
	mitb2KVFRRxGi+SSM5aiASZA8qU+8/ulinPwO2UxDXQID7JCsnCCgAWQzGhEls4ZuImL
	exW5/9R5KwN6pK/Af0jb69sFdUAkhUcFr10qFfXtqoD5vcWdm2glCcYZtqAAMMNNxmLZ
	+98w==
X-Gm-Message-State: APjAAAX3kybRormm38gczw4LEqCKWh9omsGIhYuU2qMlJyZwjZTLC2WF
	THIe5Tlaz/pot2BuSNugFZM=
X-Google-Smtp-Source: APXvYqzdj8IJGR+Nx5X7epq1joXUf3thCiGJri9n74bpzCqrSGzpqvAFUafY88t1iP5PdN1HG6hluw==
X-Received: by 2002:a17:902:b40f:: with SMTP id
	x15mr6490438plr.118.1572961791634; 
	Tue, 05 Nov 2019 05:49:51 -0800 (PST)
Received: from ?IPv6:2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb?
	([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	s202sm22001772pfs.24.2019.11.05.05.49.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 05:49:51 -0800 (PST)
To: madhuparnabhowmik04@gmail.com
References: <20191028202417.13095-1-madhuparnabhowmik04@gmail.com>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <ac8da2f5-4cda-8985-ff90-061478a4e2c9@gmail.com>
Date: Tue, 5 Nov 2019 20:49:47 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028202417.13095-1-madhuparnabhowmik04@gmail.com>
Content-Language: en-US
Cc: paulmck@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: arrayRCU:
 Converted arrayRCU.txt to arrayRCU.rst
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

On 10/29/19 3:24 AM, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch converts arrayRCU from txt to rst format.
> arrayRCU.rst is also added in the index.rst file.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>   .../RCU/{arrayRCU.txt => arrayRCU.rst}         | 18 +++++++++++++-----
>   Documentation/RCU/index.rst                    |  1 +
>   2 files changed, 14 insertions(+), 5 deletions(-)
>   rename Documentation/RCU/{arrayRCU.txt => arrayRCU.rst} (91%)
> 
> diff --git a/Documentation/RCU/arrayRCU.txt b/Documentation/RCU/arrayRCU.rst
> similarity index 91%
> rename from Documentation/RCU/arrayRCU.txt
> rename to Documentation/RCU/arrayRCU.rst
> index f05a9afb2c39..ed5ae24b196e 100644
> --- a/Documentation/RCU/arrayRCU.txt
> +++ b/Documentation/RCU/arrayRCU.rst
> @@ -1,5 +1,7 @@
> -Using RCU to Protect Read-Mostly Arrays
> +.. _array_rcu_doc:
>   
> +Using RCU to Protect Read-Mostly Arrays
> +=======================================
>   
>   Although RCU is more commonly used to protect linked lists, it can
>   also be used to protect arrays.  Three situations are as follows:
> @@ -26,6 +28,7 @@ described in the following sections.
>   
>   

It will be better to have the cross reference for each situation.

Hash Tables
Static Arrays
Resizeable Arrays

>   Situation 1: Hash Tables
> +------------------------
>   
>   Hash tables are often implemented as an array, where each array entry
>   has a linked-list hash chain.  Each hash chain can be protected by RCU
> @@ -34,6 +37,7 @@ to other array-of-list situations, such as radix trees.
>   
>   
>   Situation 2: Static Arrays
> +--------------------------
>   
>   Static arrays, where the data (rather than a pointer to the data) is
>   located in each array element, and where the array is never resized,
> @@ -41,11 +45,13 @@ have not been used with RCU.  Rik van Riel recommends using seqlock in
>   this situation, which would also have minimal read-side overhead as long
>   as updates are rare.
>   
> -Quick Quiz:  Why is it so important that updates be rare when
> -	     using seqlock?
> +Quick Quiz:
> +		Why is it so important that updates be rare when using seqlock?
>   
> +:ref:`Answer to Quick Quiz <answer_quick_quiz_seqlock>`
>   
>   Situation 3: Resizeable Arrays
> +------------------------------
>   
>   Use of RCU for resizeable arrays is demonstrated by the grow_ary()
>   function formerly used by the System V IPC code.  The array is used
> @@ -60,7 +66,7 @@ the remainder of the new, updates the ids->entries pointer to point to
>   the new array, and invokes ipc_rcu_putref() to free up the old array.
>   Note that rcu_assign_pointer() is used to update the ids->entries pointer,
>   which includes any memory barriers required on whatever architecture
> -you are running on.
> +you are running on.::
>   

a redundant ":" in here with html page.




>   	static int grow_ary(struct ipc_ids* ids, int newsize)
>   	{
> @@ -112,7 +118,7 @@ a simple check suffices.  The pointer to the structure corresponding
>   to the desired IPC object is placed in "out", with NULL indicating
>   a non-existent entry.  After acquiring "out->lock", the "out->deleted"
>   flag indicates whether the IPC object is in the process of being
> -deleted, and, if not, the pointer is returned.
> +deleted, and, if not, the pointer is returned.::
>   

same as above


Tested-by: Phong Tran <tranmanphong@gmail.com>

Regards,
Phong.

>   	struct kern_ipc_perm* ipc_lock(struct ipc_ids* ids, int id)
>   	{
> @@ -144,8 +150,10 @@ deleted, and, if not, the pointer is returned.
>   		return out;
>   	}
>   
> +.. _answer_quick_quiz_seqlock:
>   
>   Answer to Quick Quiz:
> +	Why is it so important that updates be rare when using seqlock?
>   
>   	The reason that it is important that updates be rare when
>   	using seqlock is that frequent updates can livelock readers.
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index 5c99185710fa..8d20d44f8fd4 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -7,6 +7,7 @@ RCU concepts
>   .. toctree::
>      :maxdepth: 3
>   
> +   arrayRCU
>      rcu
>      listRCU
>      UP
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
