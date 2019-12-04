Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A996C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 16:08:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3F32077B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 16:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="u6pokYYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3F32077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D99185EEF;
	Wed,  4 Dec 2019 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-GtGSzjx4Di; Wed,  4 Dec 2019 16:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E43485EAC;
	Wed,  4 Dec 2019 16:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86C6CC1DD6;
	Wed,  4 Dec 2019 16:08:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D2DBC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0501087D48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9scSwe8rgCqp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:08:06 +0000 (UTC)
X-Greylist: delayed 00:20:47 by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7C48987BF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:08:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s10so3356400plp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 08:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Yf0/AyAbsCQScuwSh0FkTQfwVgWv8tTjAbyxzK0zN18=;
 b=u6pokYYSDBN0Rp74jlq4km9163s/bxCbqqwQgKLvwLLq7hphPCk1dgf878+h0qVVmM
 oV7Vue9ENHkWIJGRL7X1hXiu7FUUrbQYBpuBn1nz9Kjrd62+TdmBaVDPebDuggsEami0
 S0WXUL9OT1MT+WRt/jL2wKJFluZcb3sg62uSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yf0/AyAbsCQScuwSh0FkTQfwVgWv8tTjAbyxzK0zN18=;
 b=iF6jLjv4yYEBzWxAFzjtXWLg1EGds48G2cM6fa6qFc8IznfpQytsjCtO+EA1bMfD6c
 FIUhszbnd7pYhxoAlxGWNK0SAOAuMGNTHRPU3NS87W2JG9oLsvP45AJYNSPjpdOCm+BF
 Y2YOM2M3rs0v2f4ZhlVnpV1MvCSRJln36ut/Ap1IlnVWGnQWGS69DANsNpv2UaVH1Psd
 A7m9lm/FcAgcv4S+551cwewAv/kCrfZjniktwRMd1hEQRxxoDANKuGxkakVz6KV/oJnS
 4pf16nz6MNAjfJHBxkpRo8jeAqVi9lbRy+ryNDUlNTSyX9aHNYM3xKHQEXauO5gid8Bc
 hN7Q==
X-Gm-Message-State: APjAAAViXhnz4L4RZJ7W47jeJ8RMg37mNhGmiS6lb3V2H9UblKQwq6Q4
 ZmuY7eJL2f2LoZmCui8LLSCXVqabbGc=
X-Google-Smtp-Source: APXvYqydWvp2jT88+hxu6Hv9v4Gi45t2Z6QCPGmLhAy/GxOqbXhW3/mndI4tvMOl+WYPILBjfEd8DQ==
X-Received: by 2002:a17:90a:9bc6:: with SMTP id
 b6mr3975479pjw.77.1575474000054; 
 Wed, 04 Dec 2019 07:40:00 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id u3sm7370858pjn.0.2019.12.04.07.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 07:39:59 -0800 (PST)
Date: Wed, 4 Dec 2019 10:39:58 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20191204153958.GA17404@google.com>
References: <20191203063941.6981-1-frextrite@gmail.com>
 <20191203064132.38d75348@lwn.net>
 <20191204082412.GA6959@workstation-kernel-dev>
 <20191204074833.44bcc079@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204074833.44bcc079@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: listRCU: Add some more
 listRCU patterns in the kernel
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

On Wed, Dec 04, 2019 at 07:48:33AM -0700, Jonathan Corbet wrote:
> On Wed, 4 Dec 2019 13:54:12 +0530
> Amol Grover <frextrite@gmail.com> wrote:
> 
> > The cross-reference of the functions should be done automatically by sphinx
> > while generating HTML, right? But when compiled none of the functions were
> > cross-referenced hence "``" was added around the methods (and other symbols)
> > to distinguish them from normal text.

Amol, when I tried your patch -- some functions were cross-referenced. Some
were not. I don't think all were not cross referenced.

> 
> If there's nothing to cross-reference to (i.e. no kerneldoc comments)
> then the reference obviously won't be generated.  I would still ask that
> you leave out the literal markers; they will block linking to any docs
> added in the future, and they clutter up the text - the plain-text reading
> experience is important too.

Actually I had asked Amol privately to add the backticks. It appeared super
weird in my browser when some function calls were rendered monospace while
others weren't. Not all functions were successfully cross referenced for me.
May be it is my kernel version?

Amol, do as Jon said and send a v2. Then I will test your patch again.

thanks,

 - Joel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
