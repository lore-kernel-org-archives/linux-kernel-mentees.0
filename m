Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EFFC17498
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:53:04 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D1D21A4A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DBW1WPJx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D1D21A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1E3AFE43;
	Tue,  5 Nov 2019 14:53:04 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B209CC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:53:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 04A70189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:53:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r144so22908446iod.8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+KOXusQ0gMsjPIECI8aJtEVaJzR/S8atj/RIpKomKHE=;
	b=DBW1WPJxUMXrfv7VGwMYcFnk0qqQqtdg00M0Uec/ovJOKDOAhr0OFfig9xaYTtvdTA
	fao7BC6uzWRQfSL8Gp1wX/pGlJGTbcnPTT/fOK7bVzH1ZXkPBjkzULXtIn7Lzj8Rqh3o
	+Ve7M2LvNirX/loRVDz2W6eYTr2OGZBpm8NwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+KOXusQ0gMsjPIECI8aJtEVaJzR/S8atj/RIpKomKHE=;
	b=aeRl5TEqy95gRJSfZ5hsoRnQXRiB9pRCfBVjKcszcsBv0WbCwPcAkIqIt3rm/C6h7H
	SpOAdhMpnkHP0t/KyM/3ZkZT+M76Zx7zquFMv6R9BIgR84LxVIYyyugdWE9PhsQUrp9G
	bMC9F7h+SPMjS0A+nduRMOpnowgzh//FU4m+oQwXyld8CXSsVNCECnGRtgAiMof7cPwF
	SUDd4xZ1bwtoJLcFAWFKIRx8FGLRJfE2g8DQwnA6D/iYbX3IOLqemUpeIOSN/LguHuYH
	JzlZjXZlV935nXaGwbtQXQmm4zjA/1CrGrdhRo/YicM0uO1ivzp+by5ErMlYfukt8Kge
	vz+A==
X-Gm-Message-State: APjAAAXXq5gN9PZ/9BQY6Bw2LaQqOzhp+YTVNVmEbChJvA0vndK4d3NU
	COoMaLB8Zc3/LZn3lYAq/cIpxPAJ
X-Google-Smtp-Source: APXvYqz5HA2yCc0jWmXskaxybqR69b3WXB8Liclq5ymEdXWCL+pK+LjplQc9EZ95TvV3xrmGZYm64A==
X-Received: by 2002:a5d:8987:: with SMTP id m7mr29268311iol.104.1572965581116; 
	Tue, 05 Nov 2019 06:53:01 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
	[24.9.64.241])
	by smtp.gmail.com with ESMTPSA id f8sm2796434ilg.58.2019.11.05.06.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2019 06:53:00 -0800 (PST)
To: paulmck@kernel.org, Amol Grover <frextrite@gmail.com>
References: <20191104133315.GA14499@workstation-kernel-dev>
	<20191104150328.GZ20975@paulmck-ThinkPad-P72>
	<20191104171641.GA15217@workstation-kernel-dev>
	<20191104194528.GJ20975@paulmck-ThinkPad-P72>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dc5570d4-26bf-59ab-76bb-79490dde2369@linuxfoundation.org>
Date: Tue, 5 Nov 2019 07:52:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104194528.GJ20975@paulmck-ThinkPad-P72>
Content-Language: en-US
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: whatisRCU:
 Fix formatting for section 2
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

Hi Amol,

On 11/4/19 12:45 PM, Paul E. McKenney wrote:
> On Mon, Nov 04, 2019 at 10:46:41PM +0530, Amol Grover wrote:
>> On Mon, Nov 04, 2019 at 07:03:28AM -0800, Paul E. McKenney wrote:
>>> On Mon, Nov 04, 2019 at 07:03:15PM +0530, Amol Grover wrote:
>>>> Convert RCU API method text to sub-headings and
>>>> add hyperlink and superscript to 2 literary notes
>>>> under rcu_dereference() section
>>>>
>>>> Signed-off-by: Amol Grover <frextrite@gmail.com>
>>>
>>> Good stuff, but Phong Tran beat you to it.  If you are suggesting
>>> changes to that patch, please send a reply to her email, which
>>> may be found here:
>>>

Please do a review and send comments and suggestions in an email
instead of a patch.

>>> https://lore.kernel.org/lkml/20191030233128.14997-1-tranmanphong@gmail.com/
>>>
>>> There are several options for replying to this email listed at the
>>> bottom of that web page.
>>
>> Thank you Paul! And that is correct, I was suggesting changes to
>> that patch. However, since that patch was already integrated into
>> the `dev` branch, I mistakenly believed this patch could be sent
>> independently. Sorry for the trouble, I'll re-send the patch the
>> correct way.
> 

Please drop your patch and do a review for the patch as suggested by
Paul. This should have been a review and not a patch on top.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
