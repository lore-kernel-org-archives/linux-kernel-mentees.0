Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F2E2797A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757915310; cv=none; b=Odq0IuPuPhGpAnvmDQs+ipyXFa4QbkZi335qI5W5zgtlTrh/31i2U6L7iLt1uiIi3mUxCsbOpb66/QClBHBHx9TYubwuwyHipDpapEC5Px1VrGdVKRsF3cYJHcvqaCGzaY1dZUFb7qazlaGRu1vgmfvfMwkiSd/C2lLLJ7tqnEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757915310; c=relaxed/simple;
	bh=nDGZYmOVK3BHyovdEwLI+pkBn1mmcoe5MNbBS1U05Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFT7vH4rT7e+E/Q53XgdDsOATgXQ+qZ+y+5aG1pEXtx0rrxk0daIVqVBjwL+aY5ceH6v6r0GgA5Iym198K77+JCQPicB+KCGDnkTwDDYOxSslwU26BZVuCCn+oP4MehWJ3mteuyLZ3ZVGCI6bb6scERBK2DECA1N/xGVyhki+Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRryVl1k; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRryVl1k"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 102F96F84F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 05:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w94U-i2WJ61 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Sep 2025 05:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 676236F875
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 676236F875
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRryVl1k
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 676236F875
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 05:48:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C557144101;
	Mon, 15 Sep 2025 05:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BB7C4CEF1;
	Mon, 15 Sep 2025 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757915306;
	bh=nDGZYmOVK3BHyovdEwLI+pkBn1mmcoe5MNbBS1U05Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRryVl1kj48MZS2gLanXzQi1bHUnNSgCURmkRfmBVcm2y4EXJENs8ktffrEGhn5q0
	 2AYwWNMewDKF0m8hHHG/8R39U71l1qm3QTTz26ImA2eTX61gegMWJXaIVLWHufkzmt
	 6aRKund/R6fXLnWH8cZmXqar5MFD3xJLjO13QHLcVrwLRRzWPB8/ChL3r5/eB7HAph
	 go5eqPES+QPF6YFSJPjpzPfkj5vwyPHIgjwNpflGLCOq/31Jy0QfjWFjw3Kna6E6XI
	 5dtmw0RTtkDaxKl4vHdlON9Fi3DbckoBd8YJktWDzL3djvaAk3DUavi/2VwoCH1Ra1
	 iibvKzyNcnXXA==
Date: Fri, 12 Sep 2025 12:07:13 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mahanta Jambigi <mjambigi@linux.ibm.com>
Cc: Kriish Sharma <kriish.sharma2006@gmail.com>, alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com, sidraya@linux.ibm.com,
	wenjia@linux.ibm.com, tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] net/smc: replace strncpy with strscpy for ib_name
Message-ID: <20250912090713.GV341237@unreal>
References: <20250908180913.356632-1-kriish.sharma2006@gmail.com>
 <20250910100100.GM341237@unreal>
 <24ced585-1b7f-4577-9cb5-8d6e60ecb363@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24ced585-1b7f-4577-9cb5-8d6e60ecb363@linux.ibm.com>

On Fri, Sep 12, 2025 at 01:18:52PM +0530, Mahanta Jambigi wrote:
> On 10/09/25 3:31 pm, Leon Romanovsky wrote:
> >> --- a/net/smc/smc_pnet.c
> >> +++ b/net/smc/smc_pnet.c
> >> @@ -450,7 +450,7 @@ static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
> >>  		return -ENOMEM;
> >>  	new_pe->type = SMC_PNET_IB;
> >>  	memcpy(new_pe->pnet_name, pnet_name, SMC_MAX_PNETID_LEN);
> >> -	strncpy(new_pe->ib_name, ib_name, IB_DEVICE_NAME_MAX);
> >> +	strscpy(new_pe->ib_name, ib_name);
> > 
> > It is worth to mention that caching ib_name is wrong as IB/core provides
> > IB device rename functionality.
> 
> In our case we hit this code path where we pass *PCI_ID*
> as the *ib_name* using *smc_pnet* tool(smc_pnet -a <pnet_name> -D
> <PCI_ID>). I believe PCI_ID will not change, so caching it here is fine.

If I remember, you are reporting that cached ib_name through netlink much later.

The caching itself is not an issue, but incorrect reported name can be seen as
a wrong thing to do.

Thanks
