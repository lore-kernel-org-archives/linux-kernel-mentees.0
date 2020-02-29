Return-Path: <SRS0=WAM0=4R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EF0C3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 16:36:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B17C20828
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 16:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUlTlrkw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B17C20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23C64865C4;
	Sat, 29 Feb 2020 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lttz4Xq5HLCA; Sat, 29 Feb 2020 16:36:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6CF8880077;
	Sat, 29 Feb 2020 16:36:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60822C1D84;
	Sat, 29 Feb 2020 16:36:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2390C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 16:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E006B20006
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 16:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLNlXrrt7HIg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 16:36:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 4CFC720003
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 16:36:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q9so442118pfs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 08:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=chLyyboKxljeNbWjn+Ihw3+ifU4bM69LKhYN2hSreuI=;
 b=IUlTlrkwPmIJlTDZCm8NooTvS1aj0bTIUqbrB1RFkSewUowZNN555WF3p6X3dXPWmI
 Qjt85wVnca3sfgx/WaqoAv5FkqdxDOrQ27co6aPBY8CXvBa4AL4p4JkrBEZhRPYALgof
 nflEEB93Un3JA1LIzCDWbPRdNvaO3XQgbEHH83UW2EGXCSmsBeOOZxNGP6vXpIPo1YBP
 yYPLfnu/pEs64oqJ9gLFp5aUcQiULW03rH/L3cXkvlgUUWUgbdnMV0hbJOmxaztkVFcG
 HBRYxeAz2YUbULH0TFMyxMb/oSIIsH8OZln+gaW1qwPo6iHi2GEii3Xfm1x0Hxz/0HTh
 C2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=chLyyboKxljeNbWjn+Ihw3+ifU4bM69LKhYN2hSreuI=;
 b=r82aC4+Epa38O7FiiCt5JFA4KNGO1Hm3GbHD7VNY1oaSyA3WO0ICcpThp5OFobwd8H
 smLsdzuxo/cgmN1yZ15k5qcqdrexiU6gdmR55lSL3sfdsRjQvTGA75a7oai5ep8YJYVx
 5nA7NMxItd/lI9Xz3PCl6k6hbezsSjg4DDrlhAyIFWa/fnqOed3aP5kzNKWLFcxh7R2y
 7dKR6kMVFiP6J6hG1rYdrXiCY7t8My1PDzCpy0nlUHW/+nMVJ5F/zTjawzzQ/GYqpVEL
 z29dO2BswUeFqoG4YS2bpRmcVXVgO2v3N5Qub6ZWyRUu05jgcVBJP7VpQQ2+Dt5pwred
 JOkQ==
X-Gm-Message-State: APjAAAWUjSXKkLyg6y/yTFvB/Xs9LClyt599IbM0YadEa5IGUCqya/zt
 H43dNs/dQXwzeUw+kbJ4Lu8=
X-Google-Smtp-Source: APXvYqx0LOEKyONlMpZ8BncOiwY/mdIa4tKsVKADHgnTl42PeMJx4fVUhd+rlPEBwy9g3Bek+jaSjw==
X-Received: by 2002:a62:1c95:: with SMTP id c143mr9585082pfc.219.1582994214624; 
 Sat, 29 Feb 2020 08:36:54 -0800 (PST)
Received: from [192.168.0.108] ([103.46.200.19])
 by smtp.gmail.com with ESMTPSA id d23sm15450153pfo.176.2020.02.29.08.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Feb 2020 08:36:54 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <20200227180656.15187-1-amanharitsh123@gmail.com>
 <20200229075653.2fd7ae3e@lwn.net>
From: Aman <amanharitsh123@gmail.com>
Message-ID: <7d28ad4d-6b7a-74a6-699e-b8b614844ff3@gmail.com>
Date: Sat, 29 Feb 2020 22:06:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200229075653.2fd7ae3e@lwn.net>
Content-Language: en-US
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] doc: Convert
 rculist_nulls.txt to rculist_nulls.rst
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

On 29/02/20 8:26 pm, Jonathan Corbet wrote:
> On Thu, 27 Feb 2020 23:36:53 +0530
> Aman Sharma <amanharitsh123@gmail.com> wrote:
>
>> This patch converts rculist_nulls from .txt to .rst format, and also adds
>> it to the index.rst file.
>>
>> Major changes includes:
>> 1) Addition of section headers and subsection headers.
>> 2) Addition of literal blocks which contains all the codes.
>> 3) Making enumerated list item by changing X) to X. where X is number
>>     like 1,2,3 etc.
>>
>> Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
>> ---
>>   Documentation/RCU/index.rst         |   1 +
>>   Documentation/RCU/rculist_nulls.rst | 179 ++++++++++++++++++++++++++++
>>   Documentation/RCU/rculist_nulls.txt | 172 --------------------------
>>   3 files changed, 180 insertions(+), 172 deletions(-)
>>   create mode 100644 Documentation/RCU/rculist_nulls.rst
>>   delete mode 100644 Documentation/RCU/rculist_nulls.txt
> When you put out multiple versions of a patch, it's always good to say
> what has changed; you can put that information right after the "---" line
> above.  That's even more true if you send two versions within minutes of
> each other; recipients will want to know what is going on.
>
> Thanks,
>
> jon

Alright, I will make sure to always mention the changes between the 
subsequent version of patches.

Here, the reason for a v3 patch is to fix the typing error in the commit 
message, there was a duplicate line in commit message of patch v2.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
