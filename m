Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F84C2BD09
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 16:35:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1CEA2081B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 16:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="GlXe6Q9r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1CEA2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC41A86EB3;
	Wed,  4 Dec 2019 16:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QD3nN1WPxIu0; Wed,  4 Dec 2019 16:35:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67D0086E35;
	Wed,  4 Dec 2019 16:35:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FA49C1DD6;
	Wed,  4 Dec 2019 16:35:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E75F6C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DDE71230A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvAA-J0qX2Ss
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:35:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 4384722E20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:35:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id h13so3387161plr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 08:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bO5izEfxsUPUv8T5otbux6mtDyOWMJqdJNoSjjVgl/c=;
 b=GlXe6Q9rSNMREEg0PMbYTSdbPIDnjfkSDLbQ3Wa7YGN7pXctZlof9E/0gZyGbNTNWR
 n6Jstsi0ucPZoPRP3fosvInk887zFN+hVI3LHi321kOPXg9QwRyuyHgPaBEDXexEimDq
 SPAyk4+8cW7fGFj648/w5ZunZiP8v+dteapA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bO5izEfxsUPUv8T5otbux6mtDyOWMJqdJNoSjjVgl/c=;
 b=CWZ0V736YEGjl5wPmdz7kSjsjrX0OZrN8co6esONrG/Q/DrWRyOHp0mZygcY0F5ilL
 6Jfl88egYEvLLfKIw64wPPn68td9LSLQYUITG/xb6c/p9kB1IFxnKG+0uIw7n619bWnz
 PbGpAPW+RcQs3OSYpzwyRrKWHqm2HVWX2C9utdSsgYE3QrkERHhUY6IRD3gjpnMQB42/
 WJwZgJtSpQ2iFLgAnqZ8PcJfOEoYZ28GWsEZUeGg9nYqKa6ICkx8bLKe0ek16GEPjNJG
 Cv71OcIS5DAYNstndP3L0TaMK9dwyuCSy8MUK4xdizuxpdw7dHbuW00R/rHIkF/YEAEk
 yjig==
X-Gm-Message-State: APjAAAUmVOZgZ28yycPdinH+YtTTSdOeoY1L9ehRrqhTBs9dMnm8qcV9
 bSG7dpcKbl3Qw4oZgPIQ9gcttg==
X-Google-Smtp-Source: APXvYqxSGyLyUYiiS/+SHbLwAVTmQQ5XcWoLnPWBhsJAaT8jcO37+IiZ/iqNkU51/LPEF2rPVUPiBw==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr4057799plo.119.1575477354677; 
 Wed, 04 Dec 2019 08:35:54 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id k4sm1427100pfk.11.2019.12.04.08.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 08:35:53 -0800 (PST)
Date: Wed, 4 Dec 2019 11:35:52 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20191204163552.GE17404@google.com>
References: <20191203063941.6981-1-frextrite@gmail.com>
 <20191203064132.38d75348@lwn.net>
 <20191204082412.GA6959@workstation-kernel-dev>
 <20191204074833.44bcc079@lwn.net>
 <20191204153958.GA17404@google.com>
 <20191204084729.184480f3@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204084729.184480f3@lwn.net>
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

On Wed, Dec 04, 2019 at 08:47:29AM -0700, Jonathan Corbet wrote:
> On Wed, 4 Dec 2019 10:39:58 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > Actually I had asked Amol privately to add the backticks. It appeared
> > super weird in my browser when some function calls were rendered
> > monospace while others weren't. Not all functions were successfully
> > cross referenced for me. May be it is my kernel version?
> 
> If you have an example of a failure to cross-reference a function that
> has kerneldoc comments *that are included in the toctree*, I'd like to see
> it; that's a bug.
> 
> Changing the font on functions without anything to cross-reference to is
> easy enough and should probably be done; I'll look into it when I get a
> chance.

I tried on a different machine (my work machine) and the cross-referencing is
working fine. So I am not sure if this could be something related to Sphinx
version or I had used an older kernel tree before. This kernel tree is
Linus's master.

thanks,

 - Joel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
