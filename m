Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B96C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 17:41:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D25124656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 17:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D25124656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CCFE3204CC;
	Wed, 15 Jan 2020 17:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBRZHQyFJyhh; Wed, 15 Jan 2020 17:41:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1433A2052B;
	Wed, 15 Jan 2020 17:41:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1084AC1D83;
	Wed, 15 Jan 2020 17:41:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAD38C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 17:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CD5D6865E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 17:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8u02qkZBrYv2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 17:41:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1C4C4865D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 17:41:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so16643356wrq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 09:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/3QiPe/1GTUh4wvN6iqGkoCNxlqFn5o7CgcBx+S+Yxk=;
 b=r5qnk1VwStVqJhKscMhBLiZujyyVaMZHuUwRK59ra6VJbcvgUd60knBde1FcJB9pPh
 Zgi7u9F8LmE7w5pQMuQzOVv1ZZ+jKzT75UypcnmSXflwu4QvL3B7Dydz4Ol/G2viqhQT
 Nef48pIYxOZfWhAzr/evrvCm5TkOIj0k7G9kQjbrlVpcXIqn/KKN9LztMBicRnN5a+S0
 is6lXycOapbeMaegnqE0aASh9RbodJ82DGJwxqK/jF8s95IOBs7Ni00oZkC/qOa9MGEz
 FNzRXP4SVdOz7Y+NQ/MvJpFi+JUTqUWuay3sDAmMylSxoJywyGuX47EOWHHzh/y6+PKc
 VMuQ==
X-Gm-Message-State: APjAAAW25KH7gpXsjVIqsY5FEaRYWc5ONHaid9NDemVsF1ZZLRtptUqK
 sYbGhqRtxSBSpuu5U00At24=
X-Google-Smtp-Source: APXvYqxTYlzZo5YP/kkwcJuy6q+2a5/NGOs+rhKjCJpOF46IvaQDw/+OQGyFX5tcR/JRocaQUcyDDQ==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr32438058wro.202.1579110063663; 
 Wed, 15 Jan 2020 09:41:03 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id i10sm25964672wru.16.2020.01.15.09.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 09:41:03 -0800 (PST)
Date: Wed, 15 Jan 2020 17:41:01 +0000
From: Wei Liu <wei.liu@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200115174101.vqtsil6akmmyv3o4@debian>
References: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
User-Agent: NeoMutt/20180716
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netback: hash.c: Use
	built-in RCU list checking
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

On Wed, Jan 15, 2020 at 09:25:53PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Pass cond argument to list_for_each_entry_rcu.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

Acked-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
