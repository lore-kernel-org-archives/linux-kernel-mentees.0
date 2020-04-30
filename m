Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E9EC47247
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:08:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09155205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="q6Caj39q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09155205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E123688897;
	Thu, 30 Apr 2020 20:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCFYHFbLg+dC; Thu, 30 Apr 2020 20:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83B8D8818B;
	Thu, 30 Apr 2020 20:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C846C0889;
	Thu, 30 Apr 2020 20:08:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78265C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6066C85065
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAw3qYVci6VH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:08:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5B0984EA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:08:06 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id t3so7159130qkg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Ok16EsO/ISAsEJIxQSbChy5pO1QqgpEPtp1JMK5qicY=;
 b=q6Caj39qklQ+cMsmLSSD8BCgquSyU51XfuP2wwrqiVW6b36fQcsg0ufYNBYoggqogy
 YwZ+GVhOioys/L4NHy20h7Dr1yqFyImrq0+d5ifynClSfFHra+UosMjEMZ6C1nNcVbEb
 nyAMYCbrZv2nEjrYhZzYCuPmAW2kNMvpQXZp2UmKoJRWRdmWwsCdAplNQS3reKCocxz8
 q8jknBR33fIvnEqQRSOPlTAF7t18vMbHMRsgBfKOcz8AViAsn7YJlVk2EGX3Ouurzezd
 mwr7QLY5OHN1MmTIs4pSRDlozgTyBbt1BL2J4W4Mbo8COXC5TT1R5fjSX3FNsgaSayMz
 w2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Ok16EsO/ISAsEJIxQSbChy5pO1QqgpEPtp1JMK5qicY=;
 b=NQ5M4IZFk/DKMTVPGnT5KxhK/Faj0cPeu2GHwMD6uRTZLCwvJkxvlE/RMbal2Lglfp
 d6hfYoBzOIZYGzHtRUjbHdcuvH9Rsc14PE+Yba6ASWM6YViYqgU+xE0Q6TffgPRJoKsi
 cApNNXEqTPMU/3wlAdzXqyez7b2QsgS61fDZ5a/IkwOB6Okm0D65aDVeadS2qOtn14U4
 A9kUVIxFT9PU457d8Zdx2Vj6iHiSPdpsO/6qE3lB9YkE3G302+oU8ho9YTc9dPmmBAeI
 BVkfybMzFD4H/gV43Ik55Ssp/+iD/98wgy9PJoh1dV5xtXq0tqBV9zZ3fE7X3HJCHDOI
 4YGw==
X-Gm-Message-State: AGi0PuZ4LacAICuohoD7pf4SjKEcsJbl4n8LS0/RZ2q1Su/FY7u5EB28
 i3Oh1p8VZRD3/buYAWdDqUwELw==
X-Google-Smtp-Source: APiQypIYsFkIRlq5IN9jj4U8w9Kol8rc9/N9rWY/GS/z5sFI9as51Gma038GxqW1OegRDrgR4FfTFw==
X-Received: by 2002:a05:620a:16cf:: with SMTP id
 a15mr241173qkn.156.1588277285654; 
 Thu, 30 Apr 2020 13:08:05 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id b11sm638844qti.50.2020.04.30.13.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 13:08:04 -0700 (PDT)
Message-ID: <8e52829575f430721113c646f07f9dca280a025b.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 30 Apr 2020 17:08:01 -0300
In-Reply-To: <20200430140412.7d4c692d@lwn.net>
References: <20200430190737.80950-1-vitor@massaru.org>
 <20200430134704.236c612b@lwn.net>
 <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
 <20200430140412.7d4c692d@lwn.net>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: martin@omnibond.com, linux-doc@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 devel@lists.orangefs.org, hubcap@omnibond.com
Subject: Re: [Linux-kernel-mentees] [PATCH] docs: filesystems: fix `make
	htmldocs` warning
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

On Thu, 2020-04-30 at 14:04 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 16:57:24 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Sorry about that. I searched but I didn't find the documentation
> > tree.
> > Could you point me to the git url?
> 
> The MAINTAINERS file is always the place to look for such things:
> 
> > T:	git git://git.lwn.net/linux.git docs-next
> 
> jon

Thanks Jon!

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
