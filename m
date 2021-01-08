Return-Path: <SRS0=oxYf=GL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27098C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 19:48:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890EE23A7B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 19:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 890EE23A7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 175F687621;
	Fri,  8 Jan 2021 19:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIledWYVV8uY; Fri,  8 Jan 2021 19:48:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E7438761F;
	Fri,  8 Jan 2021 19:48:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67709C088B;
	Fri,  8 Jan 2021 19:48:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B19B2C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9FF7F87460
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrojGOo8N4-8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:48:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 82A6B8745F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:48:47 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id h186so6924098pfe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 08 Jan 2021 11:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0uoA1oF1fF3QZ4WU6vcspUHgnSjM2q/ZwNJX7S6IiCU=;
 b=mA/ok4JjGugI+11xXEd/MfhrJ5Fr/ZVdHI+6yu9bh5+/W8KleQ0QT+HKYI2Zev6S8t
 iKFzAQ3t1cDF29l1ZgHp+9G8J9miMAoQFDY6dJIdjiFDCO1kfgZrGJl3z+2HtXZSqsGY
 t1R5RKeN0WHG6QMqlW25CZhIGOpp7y/OXF+FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0uoA1oF1fF3QZ4WU6vcspUHgnSjM2q/ZwNJX7S6IiCU=;
 b=i688NQt5N6mMME7ek83inbKVeglI7ZTYuJZXM+HoaJ2Awx1ZVRftk1TKiVEdn27wDi
 CCMRCIZT6qSl4ZS1xfViMcPxhd6cwkfwRk3e79rMQ0mUvjgKTupXyrQkQXZ1EjGkDlOK
 E/4LsA21vJ+OagQs2gczOU9hrCGyI7G4mohXN9Vq782nuo/3CrsjCdJmlW6iFfka0ZQ/
 kRSqARXvYavTIav5tuwYVh/A7vO8aRIl0VB1chgJpDTA7bjaFfHwqwD01Pt8UWHCUoAN
 PFBy178LagH7l8G3j6ct5CnsjSEADPQKejCqB9WIR5+XycKVBFzo7cmk0J8+03aPC98i
 1lQQ==
X-Gm-Message-State: AOAM530Aqz0uhhfc55+FrDDPGGOCRAW6ypB/H5oA9NMFgnKGwz0O3hmX
 ttDr0Ucp1//Zg04GSY2cdiDbAA==
X-Google-Smtp-Source: ABdhPJx3glw3VPWk4oLRiE3Pb9mtNrtALcYoC3Z9lvJDpbg3c9QV1O9hhpFFgd+VF5Djjn/S08IF1w==
X-Received: by 2002:a63:c207:: with SMTP id b7mr8525350pgd.184.1610135327048; 
 Fri, 08 Jan 2021 11:48:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a23sm5697965pju.31.2021.01.08.11.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 11:48:45 -0800 (PST)
Date: Fri, 8 Jan 2021 11:48:44 -0800
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Message-ID: <202101081147.E1D29E4C8F@keescook>
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
 <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
 <3ffe616d8c3fb54833bfc4d86cb73427cf6c7add.camel@perches.com>
 <202101071310.3AC5F0C4@keescook>
 <9e111f0f673ae6ced12efc01d32eefe8402c7f72.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e111f0f673ae6ced12efc01d32eefe8402c7f72.camel@perches.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] deprecated.rst: deprecated strcpy ?
 (was: [PATCH] checkpatch: add a new check for strcpy/strlcpy uses)
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

On Thu, Jan 07, 2021 at 04:51:31PM -0800, Joe Perches wrote:
> I still like the stracpy variant I proposed:
> 
> https://lore.kernel.org/lkml/24bb53c57767c1c2a8f266c305a670f7@sk2.org/T/#m0627aa770a076af1937cb5c610ed71dab3f1da72
> https://lore.kernel.org/lkml/CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com/
> 
> Linus liked a variant he called copy_string:
> 
> https://lore.kernel.org/lkml/CAHk-=wg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9Uwbjj8kw@mail.gmail.com/
> 
> I think the cocci scripts that convert:
> 
> 	strlcpy -> strscpy (only when return value unused)
> 	str<sln>cpy(array, "string") -> stracpy(foo, "string")
> 	s[cn]printf -> sysfs_emit
> 
> would leave relatively few uses of strcpy and sprintf variants and would
> make it much easier to analyze the remainder uses for potential overflows.

I think that would be lovely; yes. :)

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
