Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E815C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 18:16:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79DB206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 18:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="i+vIrFkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E79DB206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B745886CF9;
	Thu,  9 Jan 2020 18:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smZXJbaT-EAM; Thu,  9 Jan 2020 18:16:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C69C986D6F;
	Thu,  9 Jan 2020 18:16:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D10C1D8D;
	Thu,  9 Jan 2020 18:16:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49051C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 18:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 368B62156C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 18:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1S2dz3JAjxXP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 18:16:25 +0000 (UTC)
X-Greylist: delayed 00:05:45 by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 4ED0021519
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 18:16:25 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w30so5445237qtd.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 10:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0QYZyDBxeJN3VU/Z0akCtNQf4HyHME9Tnn6OBKwEbI8=;
 b=i+vIrFkVhNXBZMoERSSUvS2Qk0BqcHa21Sqlcrehd20FjlnCaUYvrWqLyr0T3ZLKiD
 FjO30OzpcIMZJW0L7yWFmrtZAXgfcl82RWRqLuMMBDnTGOZ5UqaXOWQzkFSOv8mQwJvs
 bop+05Eoa3AiB6Y/kXaZ58r72mZyBYJclJEloK7dx7uueawHcM35DzGOi+KbKn25HZ2D
 b5vI59/tV03t9naGFs+K3CdsLj7nuVygGBHHZwekdhBOHAkjhG03xxvqo6POkvtr58AY
 38aZIt4fZfNjF2R6ZEhhkdK0zU+kRl/kvuPJZwgZv1NcuhYt+vp13Semad83a4xueGWN
 CTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0QYZyDBxeJN3VU/Z0akCtNQf4HyHME9Tnn6OBKwEbI8=;
 b=QVDqV70vfAPPdrWqR/Sm8G7RuGfeFzPvK70kNOaaYNsfN1uqdaAqTZOdaC7l63TEl1
 YyxTZBO4Q6jiMSHrDoyYOAbY90/b25stbdRS8KQnUWYahsbLzLKtCMFc5jiJI05Eu6Q7
 x5hbrKRgctbrZYW9OZbAJUPf8gGnY59eq3LQW2GLOFtRDipue5xTfWH/pzn5VbQA9SfG
 FvE0TZLpQaae42Z3n6zWNMFkPt//TWjg1PJKl05tbOIJQcdXrBZ2kItCjLzwkfkicO+K
 GJpgiYrhyYSGoZ/0k3RhVmTeZVDeit68FtH35vF0/9vP2hWX43qajYt1I5uEAllO2xPQ
 VyzA==
X-Gm-Message-State: APjAAAXO4zbTKQDej2oTsowaw6+uK2S7fdsA/SZgqdRh6uk35G1Ih47Q
 iR22rxHHHaOiqhYUOP9Ib0cKQA==
X-Google-Smtp-Source: APXvYqwDDMBGM6inrZQKFmQK40divx6D3kYVrebZh7EmlkxFsfLJxK36AvJD/AON7sxFauHvMR6DNw==
X-Received: by 2002:ac8:53cb:: with SMTP id c11mr8971667qtq.14.1578593439653; 
 Thu, 09 Jan 2020 10:10:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 206sm3367074qkf.132.2020.01.09.10.10.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jan 2020 10:10:39 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1ipcGU-00019D-Hs; Thu, 09 Jan 2020 14:10:38 -0400
Date: Thu, 9 Jan 2020 14:10:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200109181038.GA24939@ziepe.ca>
References: <20200107192912.22691-1-madhuparnabhowmik04@gmail.com>
 <20200107203354.GD26174@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107203354.GD26174@ziepe.ca>
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

On Wed, Jan 08, 2020 at 01:38:50PM +0530, madhuparnabhowmik04@gmail.com wrote:

> Alternatively, it can be lockdep_is_held(ibp->rvp.lock).
> Please refer to the macro(link below) and let me know if the usage of lock_is_held()
> in the patch is correct.

lock_is_held is the normal way to write this

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
