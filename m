Return-Path: <SRS0=MteQ=24=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198ACC282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 18:51:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB43720656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 18:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="it07uPHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB43720656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85A2384B01;
	Tue,  7 Jan 2020 18:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KT9OkGMl0HA; Tue,  7 Jan 2020 18:51:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA2B384ADC;
	Tue,  7 Jan 2020 18:51:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9080C1D82;
	Tue,  7 Jan 2020 18:51:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34941C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 20B0884B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSZXitpeB6AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:50:58 +0000 (UTC)
X-Greylist: delayed 00:23:32 by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6402884ADC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:50:14 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id j9so370200qkk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 10:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7T+Uz+ziIhwrQC1V0AO3Y5+ZIkKPGfie4ADyDKB8cAU=;
 b=it07uPHDjGFZLQpswrCddH3xbdXVBbPpx7Nx/qj/M+AFTfNxE4quAolxqS+arqL82c
 bl2Dty4s2fHhhM+letMeeVrn66LuHeYFxq+gNVaSLml043l3Mgqb4ZuFwUwnaUla9vBU
 XCvnGSIeEWBLy3HClWG54PiF0P9CP0Kw/yorUkncnr/GVkjNLF0VOPdoEqQc1YZs648M
 +wTyOAeW9mG/SF5WZayTC41edK3kWoBdjfGk0WyEi0tItDsszZY4wPlWG0TOaJoVLoYS
 XPL4BZeApnwa5rKBzKuaVQbj42euhCwi2RU/Q78YPwDBnIw92QRCD1G8blFVRkcADxlx
 9fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7T+Uz+ziIhwrQC1V0AO3Y5+ZIkKPGfie4ADyDKB8cAU=;
 b=TAlDyBZ4hbevqR+cAZ6dhmy53M2NXtYebjoq/xEdIBMd0uLQZrptmkPTpR20a0aqUS
 VdIiN/9JMjFCMlBYbD5fegoTv9uzjDKMdc7sm1s9D4fIZGYM0b/u46MvUYf1PQBv+l9q
 0Uv/5LPzirWzRz+CMXFEaqxIRtW23eZRDY2b0UTaGxOiTX2BQyvhWTZIg1wv0BeVtVbY
 XwblOsfQCrhC64WMW7cLnfFIcJ6hngC04jmPQDnL1KbirYZhvZdXz5by6oJEthz39egj
 cI1QfAqmcaxDK+ydfNIXcB6VdKyRCWO1sl6cVT/OQyn2XE4HjJAf8/M1Y4vTAD8RI5XA
 +qCQ==
X-Gm-Message-State: APjAAAVogXy1h8kvQU1ooXNIX6BrhWw7x1Xh83hkMkUW9MhTV+qUb0sw
 ygQnfMMtfb7CDD9YTTaf1PptvL9/W4k=
X-Google-Smtp-Source: APXvYqx7dejdsvwplVt1zaxwDZ5VHKGR9kLeMkjdXFz1Pgrfhz+vaitLElnr3cudKfk5O3dhcZdagQ==
X-Received: by 2002:a37:bcc4:: with SMTP id m187mr655640qkf.329.1578421601844; 
 Tue, 07 Jan 2020 10:26:41 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id t29sm186540qkm.27.2020.01.07.10.26.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 10:26:41 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iotYv-0008Q7-0P; Tue, 07 Jan 2020 14:26:41 -0400
Date: Tue, 7 Jan 2020 14:26:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200107182640.GC26174@ziepe.ca>
References: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 dennis.dalessandro@intel.com, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, dledford@redhat.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
 verbs.c: Use built-in RCU list checking
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

On Tue, Jan 07, 2020 at 11:05:08PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Pass cond argument to list_for_each_entry_rcu.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>  drivers/infiniband/hw/hfi1/verbs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
> index 089e201d7550..cab2ff185240 100644
> +++ b/drivers/infiniband/hw/hfi1/verbs.c
> @@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
>  				       opa_get_lid(packet->dlid, 9B));
>  		if (!mcast)
>  			goto drop;
> -		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> +		list_for_each_entry_rcu(p, &mcast->qp_list, list
> +								lock_is_held(&(ibp->rvp.lock).dep_map)) {

This is missing a ',' and isn't indented properly. Does it even
compile?

The idea seems sound though.

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
