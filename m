Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58EC264A90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Sep 2025 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757388248; cv=none; b=PoB1tLNnTlJ8msv6+CfB71Pak1NJJzOuFDyZ/dD/rw8CY3qEaS/hOY9ykeAA4PFk+pstkP4MXDeS/hn7UqEkvVOgVpnyDFWfpoWn2HZAsAfTbleZKAfoq/IHx0rHKnjIE5dYJtX4AtoR7jKQGxaPUc5rJ1b6jI21xpGdy6h0lYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757388248; c=relaxed/simple;
	bh=pswCMpx2vTdQ1c7alrFPSg51STxY+Ef9ucqfFUYaqWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnXS5lWJKeBn5trcMpW+/8neUvH/oORERywd+r/YqMCaYXGufbF2J85uOVKMRsSqCnpWKQgB3kEVURD5txzfj/5cIQNJLErRJh3z4bmA89ljw+S6Hb+fBDX3Ai4J1FM8QCrUM4I3TkICuUgPrjCmC/pAUFzq97x3K+Hv9v8BHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=my0dLRE9; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="my0dLRE9"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5236540783
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Sep 2025 03:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -21.19
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oMb1ByGufVn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Sep 2025 03:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=dust.li@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5698840760
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5698840760
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=my0dLRE9
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5698840760
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Sep 2025 03:23:58 +0000 (UTC)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757388235; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=3kUMao3FvCL6I7A/UN7ip7pd2M3nqoLuRCUIBR3cW0E=;
	b=my0dLRE9dxg0QMG/M4ZEQZ8XY+iAZN75DZ4SthjZYhcAnlBt3iK12EZS5iH9wxEG4JxaaudYBBzPGmq7e0X6edopzEzbQJCG4ZFF/v3/VEUL+WklB5jtdWuvzpWI0Iz9TSV6fGJAl2Gx+fuBE3mLPDSawvQke8YyLLXjTnnra3g=
Received: from localhost(mailfrom:dust.li@linux.alibaba.com fp:SMTPD_---0Wnc7Yfp_1757388232 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Sep 2025 11:23:52 +0800
Date: Tue, 9 Sep 2025 11:23:52 +0800
From: Dust Li <dust.li@linux.alibaba.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, alibuda@linux.alibaba.com,
	sidraya@linux.ibm.com, wenjia@linux.ibm.com
Cc: mjambigi@linux.ibm.com, tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] net/smc: replace strncpy with strscpy for ib_name
Message-ID: <aL-dyGTIUuwK_R8_@linux.alibaba.com>
Reply-To: dust.li@linux.alibaba.com
References: <20250908180913.356632-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908180913.356632-1-kriish.sharma2006@gmail.com>

On 2025-09-08 18:09:13, Kriish Sharma wrote:
>Replace the deprecated strncpy() with strscpy() for ib_name in
>smc_pnet_add_ib(). The destination buffer should be NUL-terminated and
>does not require any trailing NUL-padding. Since ib_name is a fixed-size
>array, the two-argument form of strscpy() is sufficient and preferred.
>
>Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>

I think d250f14f5f0754ce2d05d9c0ce778e4a51f488b0 has already done the
same thing.

Best regards,
Dust


>---
> net/smc/smc_pnet.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
>index 76ad29e31d60..b90337f86e83 100644
>--- a/net/smc/smc_pnet.c
>+++ b/net/smc/smc_pnet.c
>@@ -450,7 +450,7 @@ static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
> 		return -ENOMEM;
> 	new_pe->type = SMC_PNET_IB;
> 	memcpy(new_pe->pnet_name, pnet_name, SMC_MAX_PNETID_LEN);
>-	strncpy(new_pe->ib_name, ib_name, IB_DEVICE_NAME_MAX);
>+	strscpy(new_pe->ib_name, ib_name);
> 	new_pe->ib_port = ib_port;
> 
> 	new_ibdev = true;
>-- 
>2.34.1
