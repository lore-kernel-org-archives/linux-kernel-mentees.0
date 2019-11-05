Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908E5C5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 16:20:43 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634752087E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 16:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2Z8MtYG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634752087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A9E9CB6;
	Tue,  5 Nov 2019 16:20:43 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F966CAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 16:20:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1130189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 16:20:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x28so12670780pfo.6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZPVzr1zF8FoSavwzywDNDMaLZfpRZ21grLGFJWRaQIU=;
	b=Z2Z8MtYGi373NNAWDZz42HeMuGe7BEJkMfI30Qyj50jQnSlcVYc85z4f4nH35KIcru
	pFYdzrPtkPxWJaIeXkHw3mhsE/OLQSxoZglyhJDnmpZn7/e0OeIqCItP1vDMu5LY02hD
	O8Ip8VY7PnkU9Ng0mb/VQl/+vzlPrAsaEMCrvVEf7YQ2k8rs0XYkEfBd2g9frV8GrmWR
	gHC0yGQ0H58nS/5AB5+QnzwWZst5eY5+8whiffDUVTASowbRXKWalL11eiUUNojm+XCe
	85qU152zCeNNi/J/AIaBFW7vL9ZEoMkJ1uBEgNu+j4mZEoLZLZxVev0j/Jlb9/7We7MK
	Ckuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZPVzr1zF8FoSavwzywDNDMaLZfpRZ21grLGFJWRaQIU=;
	b=Ff1jF2UNGsU4Zff+ttvZ+AgoMGMEo7F0ARb6c71sJdDN/yUAvxBffDqqbBCxRXBuc6
	1bnJCMaxKN5FynpnSu/YYqQGItRR+A2bhe9zdlBCisSpQ1OJLYBhV3i46KglnmsIhyOy
	M4FMq5cVfSsmhaMN8+OFCQM1RL97Ty/j3E73k2DiWMjaeeF2Haw+VHGupZMPcP4+gdtH
	RBHB7hovzscfLF8zg/tKwEbbT/WnI2O4cTCWS2gMVPBn9fVrDH/sui5PC2TQW3kxvkFX
	3h3PnOzJ7gDXlkjk4BnA/OLqU8fS14cjvIy7S9rhhUrNhdYKJwl7sJLNbj6ib8tBGeuY
	iQMw==
X-Gm-Message-State: APjAAAUjDGyX1q/Qo30W8mjeq/dcYI6kzz74dTHHSyn/sUvTexUPICju
	jS6952LvenkqbfjwLlvEpgo=
X-Google-Smtp-Source: APXvYqyFwAsiCDt6AGENcB7yeqqnr/v5aOegQz2usIGj2+tHe7XeVZpvQBweyYpsJ6cneMn6zCf/zw==
X-Received: by 2002:a63:f94f:: with SMTP id q15mr17430362pgk.412.1572970841275;
	Tue, 05 Nov 2019 08:20:41 -0800 (PST)
Received: from workstation ([139.5.253.184]) by smtp.gmail.com with ESMTPSA id
	f2sm17765272pfg.48.2019.11.05.08.20.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 08:20:39 -0800 (PST)
Date: Tue, 5 Nov 2019 21:50:32 +0530
From: Amol Grover <frextrite@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <20191105162032.GA10619@workstation>
References: <20191104133315.GA14499@workstation-kernel-dev>
	<20191104150328.GZ20975@paulmck-ThinkPad-P72>
	<20191104171641.GA15217@workstation-kernel-dev>
	<20191104194528.GJ20975@paulmck-ThinkPad-P72>
	<dc5570d4-26bf-59ab-76bb-79490dde2369@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc5570d4-26bf-59ab-76bb-79490dde2369@linuxfoundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: paulmck@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Tue, Nov 05, 2019 at 07:52:59AM -0700, Shuah Khan wrote:
> Hi Amol,
> 
> On 11/4/19 12:45 PM, Paul E. McKenney wrote:
> > On Mon, Nov 04, 2019 at 10:46:41PM +0530, Amol Grover wrote:
> > > On Mon, Nov 04, 2019 at 07:03:28AM -0800, Paul E. McKenney wrote:
> > > > On Mon, Nov 04, 2019 at 07:03:15PM +0530, Amol Grover wrote:
> > > > > Convert RCU API method text to sub-headings and
> > > > > add hyperlink and superscript to 2 literary notes
> > > > > under rcu_dereference() section
> > > > > 
> > > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > 
> > > > Good stuff, but Phong Tran beat you to it.  If you are suggesting
> > > > changes to that patch, please send a reply to her email, which
> > > > may be found here:
> > > > 
> 
> Please do a review and send comments and suggestions in an email
> instead of a patch.

Hi Shuah,

Sure thing! I'll do a review and send in the suggestions.

> 
> > > > https://lore.kernel.org/lkml/20191030233128.14997-1-tranmanphong@gmail.com/
> > > > 
> > > > There are several options for replying to this email listed at the
> > > > bottom of that web page.
> > > 
> > > Thank you Paul! And that is correct, I was suggesting changes to
> > > that patch. However, since that patch was already integrated into
> > > the `dev` branch, I mistakenly believed this patch could be sent
> > > independently. Sorry for the trouble, I'll re-send the patch the
> > > correct way.
> > 
> 
> Please drop your patch and do a review for the patch as suggested by
> Paul. This should have been a review and not a patch on top.

Noted. Will definitely keep this in mind the next time.

Thank you
Amol

> 
> thanks,
> -- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
